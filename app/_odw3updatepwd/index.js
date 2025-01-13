"use strict";

Vue.use(window.vuelidate.default);
const { required, sameAs } = window.validators;

(() => {
    $(window).on("load", function () {
        $(".preloader img").fadeOut();
        $(".preloader").fadeOut();
    })

    const service = {
        transport: new ODWServer({},
            {
                action: "doUpdatePwd"
            },
            "odwctrl"
        ),
        save(data) {
            return this.transport.post({
                data: data
            });
        }
    }

    let form = new Vue({
        el: "#form",
        btnExec: null,
        data() {
            return {
                currPwd: "",
                newPwd: "",
                newPwd2: ""
            }
        },
        mounted() {
            this.btnExec = Ladda.create(document.querySelector(".ladda-button"));
            this.focusFirst();
        },
        methods: {
            save() {
                this.focusFirst();
                this.$v.$touch();
                if (this.$v.$invalid) {
                    alert.error("", "É necessário preencher os campos corretamente.");
                    return;
                }
                this.btnExec.start(); 
                const data = {
                    currPwd: `!${getHashSHA1(this.currPwd)}`,
                    newPwd: `!${getHashSHA1(this.newPwd)}`
                }
                service.save(data)
                    .then((response) => {
                        this.btnExec.stop(); 
                        if (response == "failure") {
                            alert.error("", "Não foi possível alterar a senha.<br>Verifique se a Senha Atual foi informada corretamente.");
                        } else {
                            alert.success("", "Senha alterada com sucesso.");
                        }
                    })
                    .fail((response) => {
                        this.btnExec.stop(); 
                        alert.error("", "Erro ao alterar a senha.");
                    });
            },
            focusFirst() {
                $(this.$el).find("input").first().focus();
            }
        },
        validations: {
            currPwd: {
                required
            },
            newPwd: {
                required
            },
            newPwd2: {
                sameAsPassword: sameAs('newPwd')
            }
        }
    })
})()