<%-- 
    Document   : Tabla_Precebo
    Created on : 26/11/2023, 2:02:13 p. m.
    Author     : 57314
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx-style/0.13.2/xlsx.full.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>

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
        <jsp:useBean id="ObjectoMostrarA" class="Modelo.Registro_precebo" />
        <jsp:setProperty name="ObjectoMostrarA" property="*" />
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
    </body>

    <table id="tabla" class="table table-bordered order-table">
        <thead>
            <tr>
                <th>ID Precebo</th>
                <th>ID Lote</th>
                <th>Fecha Inicio</th>
                <th>Cantidad </th>
                <th>Tipo_dieta</th>
                <th>Condicion Ambiental</th>
                <th>Salud Porcinos</th>
            </tr>
        </thead>
        <tbody>  
            <%
                ResultSet Resultado = ObjectoMostrarA.ListadoPrecebo();
                while (Resultado.next()) {
                    String ID = Resultado.getString("id_precebo");

            %>
            <tr>
                <td><%out.print(Resultado.getString("id_precebo"));%></td>
                <td><%out.print(Resultado.getString("id_lote"));%></td>
                <td><%out.print(Resultado.getString("fecha_Inicio_P"));%></td>
                <td><%out.print(Resultado.getString("cantidad_porcino"));%></td>
                <td><%out.print(Resultado.getString("tipo_dieta"));%></td>
                <td><%out.print(Resultado.getString("condicion_ambiental"));%></td>
                <td><%out.print(Resultado.getString("salud_porcinos"));%></td>

                <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                <td>
                    <form id="formEliminar_<%= ID%>" action="./../Eliminar/EliminarPrecebo.jsp?ID=<%= ID%>" method="post">
                        <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarPrecebo('<%= ID%>')">
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
        <div class="container" >
            <h2>Formulario de Registro de lotes</h2>
            <form action="./../Modificar/ModificarPrecebo.jsp" method="post"  id="formulario">
                <!-- Campo id_lot -->
                <div class="formulario__grupo" id="grupo__id_precebo">
                    <label for="id_lote" class="formulario__label">ID Precebo</label>
                    <div class="formulario__grupo-input">
                        <input type="numeric" class="formulario__input" name="id_precebo" id="id_precebo" placeholder=""  readonly>
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">El ID de lote solo puede tener 1 a 20 dígitos.</p>
                </div>
                <div class="formulario__grupo" id="grupo__id_lote">
                    <label for="id_lote" class="formulario__label">ID Lote</label>
                    <div class="formulario__grupo-input">
                        <input type="numeric" class="formulario__input" name="id_lote" id="id_lote" placeholder="" >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">El ID de lote solo puede tener 1 a 20 dígitos.</p>
                </div>

                <!-- Campo fecha_Inicio_P -->
                <div class="formulario__grupo" id="grupo__fecha_Inicio_P">
                    <label for="fecha_Inicio_P" class="formulario__label">Fecha de Inicio</label>
                    <div class="formulario__grupo-input">
                        <input type="Date" class="formulario__input" name="fecha_Inicio_P" id="fecha_Inicio_P" >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa una fecha válida.</p>
                </div>

                <!-- Campo cantidad_porcino -->
                <div class="formulario__grupo" id="grupo__cantidad_porcino">
                    <label for="cantidad_porcino" class="formulario__label">Cantidad de Porcinos</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="cantidad_porcino" id="cantidad_porcino" placeholder="" >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">La cantidad de porcinos debe ser un número válido.</p>
                </div>

                <!-- Campo tipo_dieta -->
                <div class="formulario__grupo" id="grupo__tipo_dieta">
                    <label for="tipo_dieta" class="formulario__label">Tipo de Dieta</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="tipo_dieta" id="tipo_dieta" placeholder="" >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa el tipo de dieta.</p>
                </div>

                <!-- Campo condicion_ambiental -->
                <div class="formulario__grupo" id="grupo__condicion_ambiental">
                    <label for="condicion_ambiental" class="formulario__label">Condición Ambiental</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="condicion_ambiental" id="condicion_ambiental" placeholder="" >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa la condición ambiental.</p>
                </div>

                <!-- Campo salud_porcinos -->
                <div class="formulario__grupo" id="grupo__salud_porcinos">
                    <label for="salud_porcinos" class="formulario__label">Salud de Porcinos</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="salud_porcinos" id="salud_porcinos" placeholder="" >
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa el estado de salud de los porcinos.</p>
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

    <dialog id="agregar" class="ventana">
        <iframe id="modalContent" src="../vistas/registrar_precebo.jsp" frameborder="0" width="100%" height="100%"></iframe>
        <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
    </dialog>

    <script>
        function EliminarPrecebo(IDPrecebo) {
            // Obtener la fila actual
            var fila = $("#formEliminar_" + IDPrecebo).closest("tr");

            // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
            console.log("Eliminar usuario con cédula: " + IDPrecebo);

            // Enviar el formulario
            $("#formEliminar_" + IDPrecebo).submit();
        }
    </script>

    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>
</html>
