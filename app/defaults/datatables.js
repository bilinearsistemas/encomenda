$.extend(true, $.fn.dataTable.defaults, {
    autoWidth: false,
    destroy: true,
    dom: "<'row'<'col-sm-12'B>>"
        + "<'row'<'col-sm-12'tr>>"
        + "<'row'<'col-sm-5'l><'col-sm-7'p>>",
    searching: false,
    order: [0, "asc"],
    // Language
    language: { 
        "sEmptyTable": "Nenhum registro encontrado",
        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
        "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
        "sInfoFiltered": "(Filtrados de _MAX_ registros)",
        "sInfoPostFix": "",
        "sInfoThousands": ".",
        "sLengthMenu": "_MENU_ Resultados por página",
        "sLoadingRecords": "Carregando...",
        "sProcessing": "Processando...",
        "sZeroRecords": "Nenhum registro encontrado",
        "sSearch": "Pesquisar",
        
        "oPaginate": {
            "sNext": "Próximo",
            "sPrevious": "Anterior",
            "sFirst": "Primeiro",
            "sLast": "Último"
        },
        
        "oAria": {
            "sSortAscending": ": Ordenar colunas de forma ascendente",
            "sSortDescending": ": Ordenar colunas de forma descendente"
        },
    
        "buttons": {
            "collection": "Coleção <span class=\"caret\"/>",
            "colvis": "Colunas",
            "colvisRestore": "Restaurar",
            "copy": "Copiar",
            "copyTitle": "Copiar",
            "copySuccess": {
                _: "%d linhas copiadas",
                1: "1 linha copiada"
            },
            "print": "Imprimir"
        }
    },
    // Pagination
    scrollY: 350,
    serverSide: true,
    paging: true,
    processing: true,
    // Buttons
    buttons: [
    ],
    // Extensions
    keys: false,
    scroller: false,
    colReorder: true,
    select: true
});
