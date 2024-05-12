<%-- 
    Document   : Tabla_corral
    Created on : 3/10/2023, 8:44:27 a. m.
    Author     : 2499479
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx-style/0.13.2/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript">
            (function (document) {
                'use strict';

                var LightTableFilter = (function (Arr) {

                    var _input;

                    function _onInputEvent(e) {
                        _input = e.target;
                        var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                        Arr.forEach.call(tables, function (table) {
                            Arr.forEach.call(table.tBodies, function (tbody) {
                                Arr.forEach.call(tbody.rows, _filter);
                            });
                        });
                    }

                    function _filter(row) {
                        var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                        row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                    }

                    return {
                        init: function () {
                            var inputs = document.getElementsByClassName('light-table-filter');
                            Arr.forEach.call(inputs, function (input) {
                                input.oninput = _onInputEvent;
                            });
                        }
                    };
                })(Array.prototype);

                document.addEventListener('readystatechange', function () {
                    if (document.readyState === 'complete') {
                        LightTableFilter.init();
                    }
                });

            })(document);
        </script>
    </head>
    <body>
        <jsp:useBean id="objetoCorral" class="Modelo.Registro_corral" />
        <jsp:setProperty name="objetoCorral" property="*" />
        <h1>Tabla de corral</h1>

        <div class="barra">
            <div class="uno"> 
                <form class="d-flex busca" role="search">            
                    <input class="form-control me-2 light-table-filter" data-table="order-table" type="text" placeholder="Search..">
                </form>          
            </div>
            <div class="dos">
                <button id="btnAgregar" class="icon-button" onclick="abrir_ventana(id)">
                    <i class="fas fa-plus"></i> Agregar
                </button>
            </div>
        </div>

        <dialog id="agregar" class="ventana">
            <iframe id="modalContent" src="../vistas/registro_corral.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>

    </div>
    <table id="tabla" class="table table-bordered order-table">
        <thead>
            <tr>
                <th>Identificador del corral</th>
                <th>Nombre del corral</th>
                <th>Capacidad de granja</th>
            </tr>
        </thead>
        <tbody>  
            <%
                ResultSet Resultado = objetoCorral.ConsultaIDCorral();
                while (Resultado.next()) {
                    String IdCorral = Resultado.getString("id_corral");
            %>
            <tr>
                <td><%out.print(Resultado.getString("id_corral"));%></td>
                <td><%out.print(Resultado.getString("nombre_corral"));%></td>
                <td><%out.print(Resultado.getString("capacidad_corral"));%></td>   
                <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                <td>
                    <form id="formEliminar_<%= IdCorral%>" action="./../Eliminar/EliminarCorral.jsp?IdCorral=<%= IdCorral%>" method="post">
                        <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarCorral('<%= IdCorral%>')" disabled="false">
                            <i class="fas fa-trash"></i> Eliminar
                        </button>
                    </form>
                </td
            </tr>

            <%
                }
                Resultado.close();
            %>
        </tbody>
    </table>

    <div class="position-absolute w-100 top translate" id="modal" style=" background: rgba(0, 0, 0, 0.1); ">
        <div class="container">
            <h2>Formulario de Registro Corral</h2>
            <form action="./../Modificar/Modificar_Corral.jsp" method="post" id="formulario" onsubmit="return MiFuncion()" >
                <div class="formulario" >
                    <div class="formulario__grupo" id="grupo__id_corral">
                        <label for="id_corral" class="formulario__label">ID Corral</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="id_corral" class="formulario__input" name="id_corral" readonly>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID del corral solo puede tener 1 a 20 digitos númericos.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__nombre_corral">
                        <label for="nombre_corral" class="formulario__label">Nombre Corral</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="nombre_corral" class="formulario__input" name="nombre_corral" >
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite el nombre del corral.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__capacidad_corral">
                        <label for="id_corral" class="formulario__label">Capacidad</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="capacidad_corral" class="formulario__input" name="capacidad_corral" >
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">la capacidad  del corral no puede ser menor a 0.</p>
                    </div>
                </div>
                <div class="formulario__mensaje" id="formulario__mensaje">
                    <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                </div>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn" id="botoncito">Enviar</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
            </form>
        </div>     
        <button class="position-absolute btn btn-danger close">Close</button>  
    </div> 
</body>    


<script>
    function EliminarCorral(IdCorral) {
        // Obtener la fila actual
        var fila = $("#formEliminar_" + IdCorral).closest("tr");

        // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
        console.log("Eliminar usuario con cédula: " + IdCorral);

        // Enviar el formulario
        $("#formEliminar_" + IdCorral).submit();
    }

</script>
<script src="../ModificacionesValidacion/FiltradoListados_Corral.js" type="text/javascript"></script>
<script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
<script src="../javascript/script-modal.js" type="text/javascript"></script>

<script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

</html>

