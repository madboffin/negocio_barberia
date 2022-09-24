$(document).ready(function () {
    // Transformando tabla en DataTable
    $('#tableServicios').DataTable();
    // Inicializando tooltips
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    });
    // Muestra el contenido del modal
    $("#crearServiciosModal").click(function () {
        $("#modalRegistrarServicios").modal('show');
    });

    // ==== REGISTRAR ====
    //redirige a la creacion del objeto con ajax
    $("#registrarServicios").click(function () {
        //Validar datos
        var nombre = $("#nombreServicio").val();
        var precio = $("#costoServicio").val();
        if (nombre.trim() == "") {
            alert("nombre vacio");
            return;
        }
        if (precio.trim() == "") {
            alert("precio vacio");
            return;
        }
        var servicio = {
            "Nombre": nombre,
            "Precio": precio
        }
        $.ajax({
            type: "POST",
            url: "/Servicios/Servicios?handler=Create",
            contentType: "application/json; charset=utf-8",
            dataType: "html",  //la respuesta que espera recibir
            headers: {
                "RequestVerificationToken": $('input:hidden[name="__RequestVerificationToken"]').val()
            },
            data: JSON.stringify(servicio)
        })
            .done(function (result) {
                alert(result);
                console.log(result);
                location.reload();
            })
            .fail(function (error) {
                console.log(result);
                alert(error);
            });
    });

    // ==== EDITAR ====
    $(document).on('click', '#tableServicios tbody tr td a.btn.btn-primary', function () {
        $(this).parent().parent().find('td').each(function (index) {
            switch (index) {
                case 0:
                    $('#idServicioEditar').val($(this).text());
                    break;
                case 1:
                    $('#nombreServicioEditar').val($(this).text());
                    break;
                case 2:
                    $('#precioServicioEditar').val($(this).text());
                    break;
            }
        });

        $('#modalEditarServicios').modal('show');
    });
    // Ejecuta la funcion de editar servicios al dar click al confirmar
    $('#btnEditarServicios').click(function () {
        var id = $("#idServicioEditar").val();
        var nombre = $("#nombreServicioEditar").val();
        var precio = $("#precioServicioEditar").val();
        var servicio = {
            "Id": id,
            "Nombre": nombre,
            "Precio": precio
        };
        alert(id + nombre + precio);

        $.ajax({
            type: "POST",
            url: "/Servicios/Servicios?handler=Edit",
            contentType: "application/json; charset=utf-8",
            dataType: "html",
            headers: {
                "RequestVerificationToken": $('input:hidden[name="__RequestVerificationToken"]').val()
            },
            data: JSON.stringify(servicio),
        })
            .done(function (result) {
                console.log(result);
                alert(result);
                location.reload();
            })
            .fail(function (error) {
                console.log(error);
                alert("Código: " + error.status + ", Error: " + error.responseText);
            });
    });

    // ==== ELIMINAR ====
    // Anota el Id correspondiente a la fila en el contenedor asignado
    $(document).on('click', '#tableServicios tbody tr td a.btn.btn-secondary', function () {
        // revisando cada fila
        $(this).parent().parent().find('td').each(function (index) {
            // la columna 1 contiene el Id
            switch (index) {
                case 0:
                    $('#idServiciosEliminar').val($(this).text());
                    break;
            }
        });

        $('#modalEliminarServicios').modal('show');
    });
    // Ejecuta la funcion de eliminar servicios al dar click al confirmar
    $('#btnEliminarServiciosSi').click(function () {
        var id = $("#idServiciosEliminar").val();
        $.ajax({
            type: "POST",
            url: "/Servicios/Servicios?handler=Delete",
            contentType: "application/json; charset=utf-8",
            dataType: "html",
            headers: {
                "RequestVerificationToken": $('input:hidden[name="__RequestVerificationToken"]').val()
            },
            data: JSON.stringify(id),
        })
            .done(function (result) {
                console.log(result);
                alert(result);
                location.reload();
            })
            .fail(function (error) {
                console.log(error);
                alert("Código: " + error.status + ", Error: " + error.responseText);
            });
    });
});