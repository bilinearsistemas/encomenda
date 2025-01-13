"use strict";

(() => {
    $(window).on("load", function () {
        $(".preloader img").fadeOut();
        $(".preloader").fadeOut();
    });
})();


(() => {
    const bus = new Vue();

    const service = {
        transport: new ODWServer(),
        transportJSON: new ODWServer({
            dataType: 'json',
            contentType: "application/json; charset=ISO-8859-1"
        }),
        get(data) {
            return this.transport.get({
                data: data
            });
        },
        getMeusFavoritos() {
            return this.transport.get({
                url: "../rest/favorito/getAll",
                data: {
                    select: "idFavorito,tipoItem,tipoItemDesc,idItem,itemDesc,gridX,gridY,gridWidth,gridHeight,imagem,props,ordem"
                }
            });
        },
        saveFavorito(favorito) {
            return this.transportJSON.post({
                url: "../rest/favorito/save",
                data: JSON.stringify(favorito)
            });
        },
        saveFavoritos(favoritos) {
            return this.transportJSON.post({
                url: "../rest/favorito/saveAll",
                data: JSON.stringify(favoritos)
            });
        },
        deleteFavorito(idFavorito) {
            return this.transport.get({
                url: "../rest/favorito/delete",
                data: {
                    idFavorito: idFavorito
                }
            });
        },
        openTarefa(title, apelido, doAction) {
            return this.transport.post({
                url: "../odwctrl",
                data: {
                    action: "pushCallback",
                    title: title,
                    doAction: doAction,
                    url: "odwctrl?action=getParameters&apelido=" + apelido
                }
            });
        }
    }

    const store = {
        db: {
            favoritos: [],
            mapFavoritos: new Map(),
            idFavorito: 0
        }
    }

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
        favoritos: {
            data() {
                const vm = this;
                return {
                }
            },
            created() {
                service.getMeusFavoritos()
                    .then((response) => {
                        this.$$store.db.favoritos = response;
                        this.createGridStack();
                        this.addWidgets(this.$$store.db.favoritos);
                        this.$$.find(".grid-stack").on("change", (event, items) => {
                            this.save(items);
                        });
                    })
            },            
            methods: {
                drop(event) {
                    const tarefa = JSON.parse(event.dataTransfer.getData("odw_info"));
                    const favorito = { idFavorito: --this.$$store.db.idFavorito, tipoItem: 0, idItem: tarefa.apelido, itemDesc: tarefa.descTarefa, gridX: -1, gridY: -1, gridWidth: 3, gridHeight: 3, tarefa: tarefa };
                    this.addWidget(favorito);

		        },
                createGridStack() {
                    const gridstack = this.$$.find(".grid-stack");
                    gridstack.gridstack({
                        width: 12,
                        alwaysShowResizeHandle: /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent),
                        resizable: {
                            handles: 'e, se, s, sw, w'
                        }
                    });
                    gridstack.on("dragstart", (event, ui) => {
                        $(event.currentTarget).addClass("noclick");
                    });
                    gridstack.on("added", (event, items) => {
                        for (let i in items) {
                            this.added(items[i]);
                        }
                    });                    
                    this.$$store.db.mapFavoritos = new Map();
                },
                addWidget(favorito) {
                    const el = $.parseHTML(`<div data-id-favorito="${favorito.idFavorito}" data-id-item="${favorito.idItem}" data-item-desc="${favorito.itemDesc}" data-tipo-item="0" class="grid-stack-item ui-draggable ui-resizable ui-resizable-autohide">
                                            <div class="grid-stack-item-content ui-draggable-handle">
                                                <a href="#" class="settings" data-id-item="${favorito.idItem}" data-item-desc="${favorito.itemDesc}" data-do-action="openURL">
                                                    <i class="fa fa-fw ti-settings  clickable"></i>
                                                </a>
												<a href="#" class="open" data-id-item="${favorito.idItem}" data-item-desc="${favorito.itemDesc}" data-do-action="openURLInNewBrowserTab" >
                                                    <i class="fa fa-fw ti-new-window clickable"></i> 
                                                </a>
												<a href="#" class="delete" data-id-favorito="${favorito.idFavorito}">
                                                    <i class="fa fa-fw ti-close clickable"></i> 
                                                </a>
												<h3 class="title clickable" data-id-item="${favorito.idItem}" data-item-desc="${favorito.itemDesc}" data-do-action="openURL">${favorito.itemDesc}</h3>
                                            </div>
                                            </div>`);
                    $(el).find(".settings, .grid-stack-item-content .title, .open").click((event) => {
                        const gridstack = $(".grid-stack");
                        if (gridstack.hasClass("noclick")) {
                            gridstack.removeClass("noclick");
                        } else {
                            const $target = $(event.currentTarget);
                            this.$$service.openTarefa($target.data("item-desc"), $target.data("id-item"), $target.data("doAction"));
                            event.stopPropagation();
                        }
                    });
                    $(el).find(".delete").click((event) => {
                        const gridstack = $(".grid-stack");
                        if (gridstack.hasClass("noclick")) {
                            gridstack.removeClass("noclick");
                        } else {
                            const $target = $(event.currentTarget);
                            this.removeWidget(el, $target.data("id-favorito"));
                            event.stopPropagation();
                        }
                    });
                    this.$$store.db.mapFavoritos.set(favorito.idFavorito, favorito);
                    const gridstack = $(".grid-stack").data("gridstack");
                    const newEl = (favorito.gridX == -1)
                    gridstack.addWidget(el, favorito.gridX, favorito.gridY, favorito.gridWidth, favorito.gridHeight, newEl);
                },
                addWidgets(favoritos) {
                    for (let i in favoritos) {
                        this.addWidget(favoritos[i]);
                    }
                },
                removeWidget(el, idFavorito) {
                    const gridstack = $(".grid-stack").data("gridstack");
                    gridstack.removeWidget(el);
                    if (idFavorito > 0) {
                        service.deleteFavorito(idFavorito);
                        this.$$store.db.mapFavoritos.delete(idFavorito);
                    }
                },
                save(items) {
                    let idFavorito, item, favorito;
                    let favoritosToSave = [];
                    for (let i in items) {
                        item = items[i];
                        idFavorito = item.el[0].dataset.idFavorito;
                        favorito = this.$$store.db.mapFavoritos.get(parseInt(idFavorito));
                        if (favorito.gridX != item.x || favorito.gridY != item.y ||
                            favorito.gridWidth != item.width || favorito.gridHeight != item.height) {
                            favorito.gridX = item.x;
                            favorito.gridY = item.y;
                            favorito.gridWidth = item.width;
                            favorito.gridHeight = item.height;
                            favoritosToSave.push(favorito);
                        }
                    }
                    if (favoritosToSave.length > 0) {
                        service.saveFavoritos(favoritosToSave)
                            .then((response) => {
                                console.log(favoritosToSave.length + " favorito(s) updated");
                                console.log(response);
                            });
                    }
                },
                added(item) {
                    let idFavorito = item.el[0].dataset.idFavorito;
                    if (idFavorito < 0) {
                        const favorito = this.$$store.db.mapFavoritos.get(parseInt(idFavorito));
                        favorito.gridX = item.x;
                        favorito.gridY = item.y;
                        favorito.gridWidth = item.width;
                        favorito.gridHeight = item.height;
                        service.saveFavorito(favorito)
                            .then((response) => {
                                item.el[0].dataset.idFavorito = response.idFavorito;
                                favorito.idFavorito = response.idFavorito;
                                this.$$store.db.mapFavoritos.delete(parseInt(idFavorito));
                                this.$$store.db.mapFavoritos.set(parseInt(favorito.idFavorito), favorito);
                            });
                    }
                }
            }
        },
        init() {
            for (let property in this) {
                let component = this[property];
                if (typeof component === "object") {
                    component.el = "#" + property;
                    this[property] = new Vue(component);
                }
            }
            return this;
        }
    }.init();

})()