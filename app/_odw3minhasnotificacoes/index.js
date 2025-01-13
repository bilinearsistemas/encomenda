"use strict";

(() => {
    $(window).on("load", function () {
        $(".preloader img").fadeOut();
        $(".preloader").fadeOut();
    });
    moment.locale("pt-br");
})();


(() => {
    const bus = new Vue();

    const persistentFilter = {
        store: {
            keyPrefix: "odw3(_odw3minhasnotificacoes)",
            setItem(key, item) {
                if (Storage) {
                    try {
                        localStorage.setItem(`${this.keyPrefix}.${key}`, typeof item === "string" ? item : JSON.stringify(item));
                    } catch (e) {
                        localStorage.setItem(`${this.keyPrefix}.${key}`, item);
                    }
                }
            },
            getItem(key) {
                if (Storage) {
                    try {
                        return JSON.parse(localStorage.getItem(`${this.keyPrefix}.${key}`));
                    } catch (e) {
                        return localStorage.getItem(`${this.keyPrefix}.${key}`);
                    }
                }
            }
        }
    }

    const service = {
        transport: new ODWServer(),
        get(data) {
            return this.transport.get({
                data: data
            });
        },
        tarefa: {
            transport: new ODWServer({
                },
                {
                    action: "autoComplete",
                    source: "tarefasAll"
                }, 
                "../odwctrl"
            ),
            get(data) {
                return this.transport.get({
                    data: data
                });
            }
        },
        getMinhasNotificacoes(offset, pageSize, payload) {
            return this.transport.get({
                url: "../rest/tarefaExecucaoFormaContato/getMinhasNotificacoes",
                data: $.extend({
                    select: "idTarefaExecucaoFormaContato,destino,tipo,tarefaExecucao.idTarefaExecucao,tarefaExecucao.dataFinal,tarefaExecucao.horaFinal,tarefaExecucao.hash,tarefaExecucao.tarefa.descTarefa",
                    offset: offset,
                    pageSize: pageSize,
                    returnTotals: true
                }, payload)
            });
        },
        openNotificacao(title, idTarefaExecucao, hash, doAction) {
            return this.transport.post({
                url: "../odwctrl",
                data: {
                    action: "pushCallback",
                    title: title,
                    doAction: doAction,
                    url: "CntServlet?id=" + idTarefaExecucao + "&hash=" + hash
                }
            });
        }
    }

    const store = new Vue({
        data() {
            return {
                situacao: [{ id: "A", text: "Ativo" }, { id: "I", text: "Inativo" }],
                flag: [{ id: "T", text: "Sim" }, { id: "F", text: "Não" }]
            }
        }
    });

    Object.defineProperties(Vue.prototype, {
        $$: {
            get() {
                return $(this.$el);
            }
        },
        $$store: {
            get() {
                return store;
            }
        },
        $$service: {
            get() {
                return service;
            }
        },
        $$bus: {
            get() {
                return bus;
            }
        }
    });

    const view = {
        filter: {
            data() {
                return {
                    model: persistentFilter.store.getItem("Filter.model") || {}
                }
            },
            methods: {
                search() {
                    const model = JSON.stringify(this.model);
                    persistentFilter.store.setItem("Filter.model", model);
                    this.$$bus.$emit("Filter.search", JSON.parse(model));
                },
                clean() {
                    for (var prop in this.model) {
                        this.model[prop] = null;
                    }
                    this.$$bus.$emit("Filter.clean");
                    this.$$bus.$emit("Filter.search", JSON.parse(JSON.stringify(this.model)));
                }
            }
        },
        grid: {
            data() {
                const vm = this;
                return {
                    columns: [
                        {
                            data: "tarefaExecucao", title: "Data",
                            render(data, type, row, meta) {
                                return [moment(data.dataFinal).format("DD/MM/YYYY"),
                                moment(data.horaFinal, "HHmmss").format("HH:mm")].join(" ");
                            }
                        },
                        {
                            data: "tarefaExecucao", title: "Tarefa",
                            render(data, type, row, meta) {
                                return data.tarefa.descTarefa;
                            }
                        },
                        { data: "destino", title: "Destino" },
                        /*{ data: "situacao", title: "Situação", "width": "70px", 
                            render(data, type, row, meta) {
                                return data.text;
                            }
                        }*/
                        {
                            data: "tarefaExecucao", title: "Ações",
                            render(data, type, row, meta) {
                                return `<button class="btn btn-primary btn-xs open" 
                                            data-desc-tarefa="${data.tarefa.descTarefa}" data-id-tarefa-execucao="${data.idTarefaExecucao}" data-hash="${data.hash}" data-do-action="openURL">
                                            <span class="fa fa-fw ti-search"></span>
                                        </button>
                                        <button class="btn btn-primary btn-xs open"
                                            data-desc-tarefa="${data.tarefa.descTarefa}" data-id-tarefa-execucao="${data.idTarefaExecucao}" data-hash="${data.hash}" data-do-action="openURLInNewBrowserTab">
                                            <span class="fa fa-fw ti-new-window"></span>
                                        </button>`;
                            }
                        }
                    ],
                    payload: persistentFilter.store.getItem("Filter.model") || {}
                }
            },
            mounted: function () {
                const vm = this;
                const dataTable = vm.$$.DataTable({
                    columns: vm.columns,
                    ajax(data, callback, settings) {
                        vm.$$service.getMinhasNotificacoes(data.start, data.length, vm.payload)
                            .done((response, textStatus, xhr) => {
                                callback({
                                    draw: data.draw,
                                    recordsTotal: xhr.getResponseHeader("total-record-count") || response.length,
                                    recordsFiltered: xhr.getResponseHeader("total-record-count") || response.length,
                                    data: response
                                });
                            });
                    }
                });
                // Bind click
                dataTable.on("click", ".open", (e) => {
                    const $target = $(e.currentTarget);
                    this.$$service.openNotificacao($target.data("descTarefa"), $target.data("idTarefaExecucao"), $target.data("hash"), $target.data("doAction"));
                    event.stopPropagation();
                });
                // Watch filter
                vm.$$bus.$on("Filter.search", (data) => {
                    vm.payload = data;
                    dataTable.ajax.reload();
                });
                // Watch window
                $(window).on("resize", () => {
                    dataTable.draw();
                });
            }
        },
        init() {
            for (var property in this) {
                var component = this[property];
                if (typeof component === "object") {
                    component.el = "#" + property;
                    this[property] = new Vue(component);
                }
            }
            return this;
        }
    }.init();

})()