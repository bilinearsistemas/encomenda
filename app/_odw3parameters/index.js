"use strict";

(() => {
    $(window).on("load", function () {
        $(".preloader img").fadeOut();
        $(".preloader").fadeOut();
    })

    const service = {
        transport: new ODWServer({},
            {
                action: "execTarefa",
                idTarefa: payload.idTarefa,
            },
            "odwctrl"
        ),
        transportScriptFunction: new ODWServer({},
            {
                action: "execTarefa",
            },
            "odwctrl"
        ),
        transportCancelExec: new ODWServer({},
            {
                action: "cancelExec",
            },
            "odwctrl"
        ),
        executeScriptFunction(data) {
            return this.transportScriptFunction.get({
                data: data
            });
        },
        execute(data) {
            return this.transport.post({
                data: data
            });
        },
        cancelExec(data) {
            return this.transportCancelExec.post({
                data: data
            });
        }
    }

    let form = new Vue({
        el: "#form",
        btnExec: null,
        keyExec: null,
        data() {
            return {
                parameters: parameters.model,
                running: false
            }
        },
        mounted() {
            this.btnExec = Ladda.create(document.querySelector(".ladda-button"));
            this.focusFirst();
        },
        computed: {
            store() {
                return parameters
            }
        },
        methods: {
            executeScriptFunction(data, callback) {
                service.executeScriptFunction(data)
                    .then((response) => {
                        callback(response);
                    })
                    .fail((response) => {
                    });
            },
            execute() {
                if (this.running) {
                    return;
                }
                this.startExec();
                const data = this.parameters;
                data.odwKeyExec = this.keyExec;
                service.execute(data)
                    .then((response) => {
                        document.write(response);
                        document.close();
                        this.stopExec();
                    })
                    .fail((response) => {
                        this.stopExec();
                        if (response.status == 500) {
                            alert.error("", "Houve um problema ao executar essa tarefa.<br>Verifique os parâmetros informados e tente novamente.<br>Se o problema persistir entre em contato com o suporte técnico.");
                        }
                    });
            },
            startExec() {
                this.running = true;
                this.btnExec.start(); 
                this.keyExec = this.createKeyExec();
            },
            stopExec() {
                this.running = false;
                this.btnExec.stop(); 
                this.keyExec = null;
            },
            cancelExec() {
                service.cancelExec({ odwKeyExec: this.keyExec })
                    .then((response) => {
                        alert.success(response.msg);
                        this.stopExec();
                    })
                    .fail((response) => {
                    });
            },
            createKeyExec() {
                return moment().format("MM-DD HH:mm:ss:SSS");
            },
            getKeyExec() {
                return keyExec;
            },
            focusFirst() {
                $(this.$el).find(".form-control").first().focus();
            }
        }
    })
})()