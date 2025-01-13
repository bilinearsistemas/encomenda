"use strict";

(() => {
    $(window).on("load", function () {
        $(".preloader img").fadeOut();
        $(".preloader").fadeOut();
    })

    const server = new ODWServer({}, payload, "odwctrl");

    var form = new Vue({
        el: "#form",
        data: {
            usr: "",
            pwd: "",
            message: "",           
            running: false,
            classes: {
                submit: {},
                message: {}
            }
        },
        computed: {
            addOns() {
                return {
                    usr: {
                        template: `
                            <svg class="svg-icon" viewBox="-1 -1 22 22">
                                <path d="M0,20 a10,8 0 0,1 20,0z M10,0 a4,4 0 0,1 0,8 a4,4 0 0,1 0,-8" />
                            </svg>
                        `
                    },
                    pwd: {
                        template: `
                            <svg class="svg-icon" viewBox="-1 -1 22 22">
                                <path d="M0,20 20,20 20,8 0,8z M10,13 10,16z M4,8 a6,8 0 0,1 12,0" />
                            </svg>
                        `
                    }
                }
            }
        },
        mounted() {
            $(this.$el).find("input").first().focus();
        },
        methods: {
            onSubmit() {
                this.login();
            },
            login() {
                if (this.running) {
                    return;
                }
                const $this = $(this.$el);

                this.message = "Autenticando..."
                this.classes.message = {
                    "alert-info": true
                }

                const $submit = $this.find(".submit")

                const $message = $this.find(".message")

                this.classes.submit = {
                    processing: true
                }

                setTimeout(() => {
                    server.post({
                            data: {
                                usr: this.usr,
                                pwd: `!${getHashSHA1(this.pwd)}`
                            }
                        })
                        .then((response) => {                            
                            //console.log(server.post);
                            if (response === "failure") {
                                this.classes.submit = {}
                                this.message = "Ops... Verifique os dados informados e tente novamente."
                                this.alert = true
                                this.classes.message = {
                                    "alert-warning": true
                                }
                            } else {
                                this.message = "Sucesso"
                                this.classes.message = {
                                    "alert-success": true                                
                                }

                                this.classes.submit = {
                                    success: true
                                }

                                setTimeout(() => {
                                    $(".preloader img").fadeIn();
                                    $(".preloader").fadeIn();
                                }, 200)

                                setTimeout(() => {
                                    window.location = "odwctrl?" + (!payload.queryString || payload.queryString === "action=logout" || payload.queryString === "null" ? "action=menu" : payload.queryString);
                                }, 500) 
                                
                            }
                        })
                        .fail((response) => {
                            this.classes.submit = {}
                            this.message = "Ops... Atualize a página e tente novamente."
                            this.classes.message = {
                                "alert-info": danger
                            }
                        })

                }, 1000)
            }
        }
    })
})()