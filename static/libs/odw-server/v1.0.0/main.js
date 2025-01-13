function ODWServer(options, parameters, location) {
    return {
        parameters: parameters || {},
        location: location || window.location.pathname,
        options: $.extend({
            type: "POST",
            contentType: "application/x-www-form-urlencoded; charset=ISO-8859-1"
        }, options),
        url: function (additionalParameters) {
            var parameters = $.extend(true, {}, this.parameters, additionalParameters);
            var query = [];

            Object.keys(parameters).forEach(function (key) {
                var parameter = parameters[key] || "";
                if (parameter instanceof Array) {
                    parameter = parameter.join();
                }
                query.push(encodeURI(key) + "=" + encodeURI(parameter));
            });

            return this.location + "?" + query.join("&");
        },
        get: function (args) {
            return this.request($.extend(args, {
                type: "GET"
            }));
        },
        post: function (args) {
            return this.request($.extend(args, {
                type: "POST"
            }));
        },
        put: function (args) {
            return this.request($.extend(args, {
                type: "PUT"
            }));
        },
        delete: function (args) {
            return this.request($.extend(args, {
                type: "DELETE"
            }));
        },
        request: function (args) {
            Object.keys(args.data).forEach(function (key) {
                var value = args.data[key] || "";
                if (value instanceof Array) {
                    args.data[key] = value.join();
                }
            });

            return $.ajax($.extend(true, {}, this.options, {
                url: this.url()
            }, args));
        }
    };
}

ODWServer.execTarefa = function (tarefa, options) {
    var server = new ODWServer(options);
    server.parameters.action = "execTarefa";
    try {
        if (tarefa.idTarefa) {
            server.parameters.idTarefa = tarefa.idTarefa
        } else if (tarefa.apelido) {
            server.parameters.apelido = tarefa.apelido;
        }
    } catch (ex) {
        // Silence is golden
    }
    return server;
}

ODWServer.execFunction = function (tarefa, options) {
    var server = new ODWServer(options);
    server.parameters.action = "execFunction";
    try {
        if (tarefa.idTarefa) {
            server.parameters.idTarefa = tarefa.idTarefa
        } else if (tarefa.apelido) {
            server.parameters.apelido = tarefa.apelido;
        }
    } catch (ex) {
        // Silence is golden
    }
    return server;
}