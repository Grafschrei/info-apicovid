
$(document).ready(function () {
    $("#btn-menu").click(function () {
        //$("#main-menu").css({"display": "none"});
        $("#main-menu").toggleClass("main-menu-hide");
        //$("#main-menu").fadeOut("slow");
        $("#right-content").toggleClass("col-md-12");
    });
});

$(document).ready(function () {
    $('#tbl-usuarios').DataTable({
            language: {
                        
                        "decimal": "",
                        "emptyTable": "No hay información",
                        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                        "infoPostFix": "",
                        "thousands": ",",
                        "lengthMenu": "Mostrar _MENU_ Entradas",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "zeroRecords": "Sin resultados encontrados",
                        "paginate": {
                            "first": "Primero",
                            "last": "Ultimo",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    }
                });
