<%-- 
    Document   : Tabla_porcinos
    Created on : 3/10/2023, 8:26:11 a. m.
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
        <h1>Tabla de Porcinos</h1>
        <jsp:useBean id="ObjectoPorcino" class="Modelo.Registro_porcino" />
        <jsp:setProperty name="ObjectoPorcino" property="*" />

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
            <iframe id="modalContent" src="../vistas/registro_porcino.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>

        <dialog id="editar" class="ventana">
            <iframe id="modalContent" src="../Modificar/Modificar_Porcinos.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>
        <dialog id="eliminar" class="ventana">
            <iframe id="modalContent" src="../Eliminar/EliminarPorcino.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>

        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Identificador porcino</th>
                    <th>Género porcino</th>
                    <th>ID Corral</th>
                    <th>Fecha de nacimiento</th>

                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoPorcino.LitadoPorcino();
                    while (Resultado.next()) {
                        String idPorcino = Resultado.getString("id_porcino");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_porcino"));%></td>
                    <td><%out.print(Resultado.getString("genero_porcino"));%></td>
                    <td><%out.print(Resultado.getString("id_corral"));%></td>
                    <td><%out.print(Resultado.getString("fecha_nacimiento_porcino"));%></td>
                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                    <td>
                        <form id="formEliminar_<%= idPorcino%>" action="./../Eliminar/EliminarPorcino.jsp?idPorcino=<%= idPorcino%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="eliminarPorcino('<%= idPorcino%>')">
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
                <h2>Formulario de Registro de Porcino Reproductor</h2>
                <form action="./../Modificar/Modificar_Porcinos.jsp" method="post" id="formulario" onsubmit="return MiFuncion()">
                    <div class="formulario" >
                        <div class="formulario__grupo" id="grupo__id_porcino">
                            <label for="id_porcino" class="formulario__label">ID Porcino</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" id="id_corral" name="id_porcino" class="formulario__input" required="">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El ID del porcino solo puede tener 1 a 20 digitos númericos.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__genero_porcino">
                            <label for="genero_porcino" class="formulario__label">Genero </label>
                            <div class="formulario__grupo-input">
                                <select name="genero_porcino" class="ComboRegistroUsuario" id="genero_porcino" required>
                                    <option>Seleccione</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un Genero</p>
                        </div>
                        <jsp:useBean id="objeto" class="Modelo.Registro_corral" />
                        <jsp:setProperty name="objeto" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_corral">
                            <label for="id_corral" class="formulario__label">ID Corral </label>
                            <div class="formulario__grupo-input">
                                <select name="id_corral" class="ComboRegistroUsuario" id="id_corral" required>
                                    <%
                                        ResultSet rs = objeto.ConsultaIDCorral();
                                        while (rs.next()) {
                                    %>
                                    <option><%out.print(rs.getString("id_corral"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>
                        <div class="formulario__grupo"  id="grupo__fecha_nacimiento_porcino">
                            <label for="fecha_nacimiento" class="formulario__label">Fecha de Nacimiento</label>
                            <div class="formulario__grupo-input">
                                <input type="date" id="fecha_nacimiento_porcino" name="fecha_nacimiento_porcino" class="formulario__input" required="">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">La fecha de nacimiento del porcino es obligatoria.</p>
                        </div>
                        <div class="formulario__mensaje" id="formulario__mensaje">
                            <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente.</p>
                        </div>
                        <div class="formulario__grupo formulario__grupo-btn-enviar">
                            <button type="submit" class="formulario__btn">Enviar</button>
                            <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                        </div>
                </form>
            </div>   
            <button class="position-absolute btn btn-danger close">Close</button>
        </div>


        <script>
            function eliminarPorcino(idPorcino) {
                // Obtener la fila actual
                var fila = $("#formEliminar_" + idPorcino).closest("tr");

                // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
                console.log("Eliminar usuario con cédula: " + idPorcino);

                // Enviar el formulario
                $("#formEliminar_" + idPorcino).submit();
            }
        </script>

        <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
        <script src="../javascript/script-modal.js" type="text/javascript"></script>
        <script src="../ModificacionesValidacion/FiltradoListadosPorcinos.js" type="text/javascript"></script>
        <script src="../javascript/ValidarFormularioCerdos.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

    </body>     
</html>
