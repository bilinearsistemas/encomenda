"use strict";

(() => {
    $(window).on("load", function () {
        $(".preloader img").fadeOut();
        $(".preloader").fadeOut();
    });
    moment.locale("pt-br");
})();

(() => {
    Vue.directive("event", {
        bind: function (el, binding, vnode) {
            $(el).on(binding.rawName.split(":")[1], binding.value);
        }
    });

    const bus = new Vue();

    var connTimeout;

    const websocket = {
        bus: null,
        socket: null,
        connect: function (host) {
            if ('WebSocket' in window) {
                this.socket = new WebSocket(host);
            } else if ('MozWebSocket' in window) {
                this.socket = new MozWebSocket(host);
            } else {
                console.log('Error: WebSocket is not supported by this browser.');
                return;
            }

            this.socket.onopen = function () {
                //toastr["info"]("Info: WebSocket connection opened.", "Notificação");
                console.log('Info: WebSocket connection opened.');
            };

            this.socket.onclose = function () {
                //toastr["error"]("Info: WebSocket connection closed.", "Notificação");
                console.log('Info: WebSocket closed.');
                this.socket = null;
                connTimeout = setTimeout(function () {
                    this.initialize();
                }, 10000);
            };

            this.socket.onmessage = function (message) {
                if (message.data.startsWith("{")) {
                    const json = JSON.parse(message.data);
                    if (json.doAction) {
                        if (json.doAction == "newNotif") {
                            bus.$emit("Header." + json.doAction);
                        } else {
                            bus.$emit("Content." + json.doAction, json.url, json.title);
                        }
                    } else {
                        toastr["success"](json.content, json.notificationTitle,
                            {
                                onclick: function () {
                                    bus.$emit("Content.openURL", json.url, json.tabTitle)
                                }
                            });
                    }
                } else {
                    const el = $.parseHTML(`<div>${message.data}</div>`);
                    $(el).find("a").addClass("btn btn-sm button-pill new-task");
                    $(el).find("a").click(function (event) {
                        event.preventDefault();
                        const url = $(this).attr("href");
                        bus.$emit("Content.openURL", url, "push");
                    });
                    toastr["success"](el, "Notificação");
                }
            };
        },
        initialize: function () {
            const url = (location.protocol == "https:" ? "wss://" : "ws://") + location.host + location.pathname.substr(0, location.pathname.lastIndexOf('/')) + "/ws/ms?devId=web_view";
            this.connect(url);
            return this;
        },
        sendMessage: function () {
            let message = 'xyz';
            if (message != '') {
                if (socket == null) {
                    clearTimeout(connTimeout);
                    initialize();
                }
                socket.send(message);
            }
        }
    }.initialize();

    const store = {
        db: {
            menu: {
                tarefas: []
            },
            preferencias: null,
            visaoInicial: null,
            tarefas: [],
            mapTarefasById: new Map(),
            mapTarefasByApelido: new Map(),
            initMapTarefas(processos) {
                let i, j, tarefas;
                for (i in processos) {
                    tarefas = processos[i].tarefas;
                    for (j in tarefas) {
                        this.mapTarefasById.set(tarefas[j].idTarefa, tarefas[j]);
                        this.mapTarefasByApelido.set(tarefas[j].apelido, tarefas[j]);
                    }
                }
            },
            getTarefaById(id) {
                return this.mapTarefasById.get(id);
            },
            getTarefaByApelido(apelido) {
                return this.mapTarefasByApelido.get(apelido);
            }
        }
    }

    Object.defineProperties(Vue.prototype, {
        $$: {
            get() {
                return $(this.$el);
            }
        },
        $$bus: {
            get() {
                return bus;
            }
        },
        $$store: {
            get() {
                return store;
            }
        }
    });

    const service = {
        transport: new ODWServer(),
        transportAutoComplete: new ODWServer({},
            {
                action: "autoComplete",
                source: "tarefasWeb",
                fields: "value,label"
            },
            "odwctrl"
        ),
        transportJSON: new ODWServer({
            dataType: 'json',
            contentType: "application/json; charset=ISO-8859-1"
        }),
        getMenuTarefas() {
            return this.transport.post({
                data: {
                    action: "das",
                    ent: "tarefa",
                    mtd: "getMenuTarefas"
                }
            });
        },
        getAllTarefas() {
            return this.transport.post({
                data: {
                    action: "das",
                    ent: "tarefa",
                    mtd: "getAllTarefas"
                }
            });
        },
        getAllTarefasAutoComplete(data) {
            return this.transportAutoComplete.get({
                data: data
            });
        },
        getPreferencias() {
            return this.transport.get({
                url: "rest/preferencia/get",
                data: {
                    select: "idPreferencia,tipoHierarquiaMenu,apelidoTarefaMenu,dataHoraVisualExecMilis,dataHoraVisualNotifMilis,usuario.idUsuario,usuario.usuario,usuario.nomeUsuario"
                }
            });
        },
        getVisaoInicial() {
            return this.transport.get({
                url: "rest/visaoInicial/getAll",
                data: {
                    select: "idVisaoInicial,tipoItem,tipoItemDesc,idItem,titulo.ordem,usuario.idUsuario,usuario.usuario,usuario.nomeUsuario"
                }
            });
        },
        saveVisaoInicial(visaoInicial) {
            return this.transportJSON.post({
                url: "rest/visaoInicial/saveAll",
                data: JSON.stringify(visaoInicial)
            });
        },
        getNumNovasNotificacoes(data) {
            return this.transport.get({
                url: "rest/tarefaExecucaoFormaContato/getNumNovasNotificacoes",
                data: data
            });
        },
        getUltimasNotificacoes(updateDataHoraVisual) {
            return this.transport.get({
                url: "rest/tarefaExecucaoFormaContato/getMinhasNotificacoes",
                data: {
                    select: "idTarefaExecucaoFormaContato,destino,tipo,tarefaExecucao.idTarefaExecucao,tarefaExecucao.dataFinal,tarefaExecucao.horaFinal,tarefaExecucao.hash,tarefaExecucao.tarefa.descTarefa",
                    updateDataHoraVisual: (updateDataHoraVisual | false ? true : false)
                }
            });
        },
        getNumNovasExecucoes() {
            return this.transport.get({
                url: "rest/tarefaExecucao/getMinhasExecucoes",
                data: {
                    select: "idTarefaExecucao,dataEnvio,horaEnvio,tarefa.descTarefa"
                }
            });
        },
        getUltimasExecucoes() {
            return this.transport.get({
                url: "rest/tarefaExecucao/getMinhasExecucoes",
                data: {
                    select: "idTarefaExecucao,dataIncial,horaInicial,dataFinal,horaFinal,hash,tarefa.descTarefa,tipoExecucaoDesc,tipoResultadoDesc"
                }
            });
        },
        execEngine(action) {
            return this.transport.get({
                data: {
                    action: "execEngine",
                    resptype: "json",
                    _action: action
                }
            });
        }
    }

    service.getPreferencias()
        .then((response) => {
            store.db.preferencias = response;
            service.getVisaoInicial()
                .then((response) => {
                    store.db.visaoInicial = response;
                    service.getMenuTarefas()
                        .then((response) => {
                            store.db.menu.tarefas = response;
                            service.getAllTarefasAutoComplete({ term: '' })
                                .then((response) => {
                                    store.db.tarefas = response;
                                    store.db.initMapTarefas(store.db.menu.tarefas);
                                    view.init();
                                });
                        });    
                });
        });

    const view = {
        "sidebar-left": {
            data() {
                return {
                    search: ""
                }
            },
            mounted() {
                this.$nextTick(function () {
                    var input = document.getElementById("search");
                    var awesomplete = new Awesomplete(input,
                        {
                            minChars: 1,
                            autoFirst: true,
                            list: this.$$store.db.tarefas
                        }
                    );
                    Awesomplete.$.bind(input, { "awesomplete-selectcomplete": this.openSearch });

                    this.$$.metisMenu();
                    this.$$.find(".navigation")
                        .slimScroll({
                            height: "calc(100% - 105px);",
                            railVisible: true
                        });

                    $("[data-toggle='offcanvas']").on('click', function(e) {
                        e.preventDefault();
                        //===disable toggle if mini_sidebar in enabled===
                        //If window is small enough, enable sidebar push menu
                        if ($(window).width() <= 992) {
                            $('.row-offcanvas').toggleClass('active').toggleClass("relative");
                            $('.left-side').removeClass("collapse-left");
                            $(".right-side").removeClass("strech");
                        } else {
                            if (!$("body").hasClass("mini_sidebar")) {
                                //Else, enable content streching
                                $('.left-side').toggleClass("collapse-left");
                                $(".right-side").toggleClass("strech");
                            }
                        }
                    });
                })
            },
            methods: {
                open(tarefa) {
                    this.$$bus.$emit("Content.open", tarefa);
                },
                openNewBrowserTab(tarefa) {
                    window.open(`odwctrl?action=getParameters&idTarefa=${tarefa.idTarefa}`, "_blank");
                },
                openSearch(event) {
                    let tarefa;
                    if (event instanceof KeyboardEvent) {
                        let value = event.target.value;
                        tarefa = this.$$store.db.getTarefaByApelido(value);
                        if (!tarefa) {
                            tarefa = this.$$store.db.getTarefaById(value);
                        }
                    } else {
                        const sel = event.text;
                        tarefa = this.$$store.db.getTarefaById(sel.value);
                    }
                    if (tarefa) {
                        event.target.value = "";
                        this.open(tarefa);
                    } 
                },
                menuTarefas() {
                    return this.$$store.db.menu.tarefas;
                },
                dragStart(tarefa, event) {
                    event.dataTransfer.setData("odw_info", JSON.stringify(tarefa));
                }
            }
        },
        "content": {
            data() {
                return {
                    active: null,
                    tabs: [],
                    indexes: []
                }
            },
            methods: {
                new(tab) {
                    this.tabs.push(tab);
                    this.indexes.push(this.indexes.length)
                    this.setActive(tab);
                },
                close(index) {
                    if (this.active === this.tabs[index]) {
                        this.setActive(this.tabs[index - 1]);
                    }
                    delete this.tabs[index];
                    delete this.indexes[index];
                    this.$forceUpdate();
                },
                reload(index) {
                    const tab = this.tabs[index];
                    tab.v = (tab.v || 1) + 1;
                    this.$forceUpdate();
                },
                setActive(tab) {
                    this.active = tab;
                    this.$forceUpdate();
                }
            },
            created() {
                this.$$bus.$on("Content.open", (tarefa) => {
                    this.new({
                        title: tarefa.descTarefa,
                        tarefa: tarefa,
                        tipoItem: "Tarefa",
                        idItem: tarefa.apelido
                    });
                });
                this.$$bus.$on("Content.openNotificacao", (notificacao) => {
                    const url = 'CntServlet?id=' + notificacao.tarefaExecucao.idTarefaExecucao + '&hash=' + notificacao.tarefaExecucao.hash;
                    this.new({
                        title: notificacao.tarefaExecucao.tarefa.descTarefa,
                        url: url,
                        tipoItem: "URL",
                        idItem: url
                    });
                });
                this.$$bus.$on("Content.openExecucao", (execucao) => {
                    const url = 'CntServlet?id=' + execucao.idTarefaExecucao + '&hash=' + execucao.hash;
                    this.new({
                        title: execucao.tarefa.descTarefa,
                        url: url,
                        tipoItem: "URL",
                        idItem: url
                    });
                });
                this.$$bus.$on("Content.openURL", (url, title) => {
                    this.new({
                        title: title,
                        url: url,
                        tipoItem: "URL",
                        idItem: url
                    });
                });
                this.$$bus.$on("Content.openURLInNewBrowserTab", (url, title) => {
                    window.open(url, "_blank");
                });
            },
            mounted() {
                this.$nextTick(function () {
                    const visaoInicial = this.$$store.db.visaoInicial;
                    let vi;
                    for (let i in visaoInicial) {
                        vi = visaoInicial[i];
                        if (vi.tipoItemDesc == "Tarefa") {
                            const tarefa = this.$$store.db.getTarefaByApelido(vi.idItem);
                            if (tarefa) {
                                this.$$bus.$emit("Content.open", tarefa);
                            }
                        } else if (vi.tipoItemDesc == "URL") {
                            this.$$bus.$emit("Content.openURL", vi.idItem, vi.titulo);        
                        }
                    }
                    if (this.tabs.length > 0) {
                        this.setActive(this.tabs[0]);
                    }
                })
            }
        },
        "header": {
            data() {
                return {
                    numNovasExecucoes: 0,
                    execucoes: [],
                    numNovasNotificacoes: 0,
                    notificacoes: [],
                    preferencias: this.$$store.db.preferencias,
                    hasCadTarefas: this.$$store.db.getTarefaByApelido("webview-cad-tarefas") != null,
                    execEngineStarted: false,
                    tooltipExecEngine: "Executor de tarefas",
                    logExecutorTarefas: { idLogExecutorTarefas: null }
                }
            },
            created() {
                service.getNumNovasExecucoes()
                    .then((response) => {
                        this.numNovasExecucoes = response.length;
                    });
                service.getNumNovasNotificacoes({ dataHoraVisualNotifMilis: this.$$store.db.preferencias.dataHoraVisualNotifMilis })
                    .then((response) => {
                        this.numNovasNotificacoes = response;
                    });
                this.$$bus.$on("Header.newNotif", () => {
                    this.numNovasNotificacoes++;
                });
            },
            mounted() {
                $("[data-toggle-extra='tooltip']").tooltip();
                if (this.hasCadTarefas) {
                    this.execEngine("status");
                    setInterval(() => {
                        this.execEngine("status");
                    }, 30000);
                }
            },
            methods: {
                saveVisaoInicial() {
                    //let tabs = $(content).context.__vue__["$root"].tabs;
                    const visaoInicial = [];
                    let item, i = 0;
                    $(".nav-tabs li").each(function() {
                        item = $(this);
                        visaoInicial.push({
                            tipoItemDesc: item.data("tipoItem"),
                            idItem: item.data("idItem"),
                            titulo: item.data("titulo"),
                            ordem: ++i
                        });
                    });
                    service.saveVisaoInicial(visaoInicial)
                        .then((response) => {
                            alert.success("", "Visão inicial gravada com sucesso.");
                        });
                },
                getUltimasExecucoes() {
                    service.getUltimasExecucoes()
                        .then((response) => {
                            this.execucoes = response;
                            this.numNovasExecucoes = 0;
                        })
                },
                openExecucao(execucao) {
                    this.$$bus.$emit("Content.openExecucao", execucao);
                },
                getUltimasNotificacoes() {
                    service.getUltimasNotificacoes(true)
                        .then((response) => {
                            this.notificacoes = response;
                            this.numNovasNotificacoes = 0;
                        })
                },
                getPreferencias() {
                    service.getPreferencias() 
                        .then((response) => {
                            this.preferencias = response;
                        })
                },
                openNotificacao(notificacao) {
                    this.$$bus.$emit("Content.openNotificacao", notificacao);
                },
                openURL(url, title) {
                    this.$$bus.$emit("Content.openURL", url, title);
                },
                execEngine(action) {
                    let _action = action || (this.execEngineStarted ? "stop" : "start");
                    service.execEngine(_action)
                        .then((response) => {
                            this.setExecEngineStatus(this.logExecutorTarefas = response);
                        })
                },
                setExecEngineStatus() {
                    this.tooltipExecEngine = this.logExecutorTarefas.description;
                    this.execEngineStarted = (this.logExecutorTarefas.tipoLog == 0);
                }
            },
            filters: {
                tarefaExecucaoData(tarefaExecucao) {
                    return [moment(tarefaExecucao.dataFinal != null ? tarefaExecucao.dataFinal : tarefaExecucao.dataInicial).format("DD/MM/YYYY"),
                    moment(tarefaExecucao.horaFinal != null ? tarefaExecucao.horaFinal : tarefaExecucao.horaInicial, "HHmmss").format("HH:mm")].join(" ");
                },
                tarefaExecucaoNova(tarefaExecucao, preferencias) {
                    let dh = dayInMillisPlusHHMMSSInString((tarefaExecucao.dataFinal != null ? tarefaExecucao.dataFinal : tarefaExecucao.dataInicial),
                        (tarefaExecucao.horaFinal != null ? tarefaExecucao.horaFinal : tarefaExecucao.horaInicial));
                    return (dh > preferencias.dataHoraVisualNotifMilis ? "Nova" : "");
                }
            }
        },
        init() {
            for (let property in this) {
                let component = this[property];
                if (typeof component === "object") {
                    component.el = "#" + property;          // set el
                    this[property] = new Vue(component);    // make vue instance
                }
            }
            return this;
        }
    }

})()