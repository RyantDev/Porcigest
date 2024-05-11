<%-- 
    Document   : Tabal
    Created on : 3/10/2023, 8:36:59 a. m.
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
        <jsp:useBean id="ObjectoMostrarLote" class="Modelo.Registro_lote" />
        <jsp:setProperty name="ObjectoMostrarLote" property="*" />
        <h1>Tabla de Lote</h1>

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
            <iframe id="modalContent" src="../vistas/registro_lote.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>


        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Identificador del lote</th>
                    <th>Identificador de la Reproduccion</th>
                    <th>Raza del lote</th>
                    <th>Fecha de nacimiento</th>
                    <th>Promedio del peso</th>
                    <th>Cantidad de la camada</th>
                    <th>Identificador de el corral</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoMostrarLote.MostrarLote();
                    while (Resultado.next()) {
                        String IDLote = Resultado.getString("id_lote");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_lote"));%></td>
                    <td><%out.print(Resultado.getString("id_reproduccion"));%></td>
                    <td><%out.print(Resultado.getString("raza_lote"));%></td>
                    <td><%out.print(Resultado.getString("fecha_nacimiento"));%></td>
                    <td><%out.print(Resultado.getString("promedio_peso"));%></td>
                    <td><%out.print(Resultado.getString("cantidad_camada"));%></td>
                    <td><%out.print(Resultado.getString("id_corral"));%></td>
                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                    <td>
                        <form id="formEliminar_<%= IDLote%>" action="./../Eliminar/EliminarLote.jsp?IDLote=<%= IDLote%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarLote('<%= IDLote%>')" disabled="false">
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
                <h2>Formulario de Registro de lotes</h2>
                <form action="./../Modificar/Modificar_Lote.jsp" method="post" id="formulario" onsubmit="return MiFuncion()">
                    <div class="formulario">
                        <div class="formulario__grupo" id="grupo__id_lote">
                            <label for="id" class="formulario__label">ID Lote</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="id_lote" id="id_lote" placeholder="" readonly>
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El ID de lote solo puede tener 1 a 20 digitos.</p>
                        </div>
                        <jsp:useBean id="objetoReproduccion" class="Modelo.Reproduccion" />
                        <jsp:setProperty name="objetoReproduccion" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_reproduccion">
                            <label for="id_reproduccion" class="formulario__label">ID Reproduccion </label>
                            <div class="formulario__grupo-input">
                                <select name="id_reproduccion" class="ComboRegistroUsuario" id="id_reproduccion" required>
                                    <option selected > Seleccione</option>
                                    <%
                                        ResultSet rs2 = objetoReproduccion.listado_Reproduccion();
                                        while (rs2.next()) {
                                    %>
                                    <option><%out.print(rs2.getString("id_reproduccion"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>
                        <div class="formulario__grupo" id="grupo__raza">
                            <label for="raza" class="formulario__label">Raza</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="raza" id="raza" placeholder="" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error raza</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_nacimiento">
                            <label for="id" class="formulario__label">Fecha Nacimiento</label>
                            <div class="formulario__grupo-input">
                                <input type="date" class="formulario__input" name="fecha_nacimiento" id="fecha_nacimiento" placeholder="" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Escoja la fecha de nacimiento.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__promedio_peso">
                            <label for="id" class="formulario__label">Promedio de Peso</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="promedio_peso" id="promedio_peso" placeholder="" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Digite el promedio de peso</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__cantidad_camada">
                            <label for="id" class="formulario__label">Cantidad de la Camada</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="cantidad_camada" id="cantidad_camada" placeholder="" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error en la cantidad</p>
                        </div>
                        <jsp:useBean id="objeto" class="Modelo.Registro_corral" />
                        <jsp:setProperty name="objeto" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_corral">
                            <label for="id_corral" class="formulario__label">ID Corral </label>
                            <div class="formulario__grupo-input">
                                <select name="id_corral" class="ComboRegistroUsuario" id="id_corral" required>
                                    <option selected > Seleccione</option>
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
                        <div class="formulario__mensaje" id="formulario__mensaje">
                            <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                        </div>
                        <div class="formulario__grupo formulario__grupo-btn-enviar">
                            <button type="submit" class="formulario__btn"> Enviar </button>             
                            <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                        </div>
                </form>
            </div>
            <button class="position-absolute btn btn-danger close">Close</button>
        </div>
    </body>   

    <script>
        function EliminarLote(IDLote) {
            // Obtener la fila actual
            var fila = $("#formEliminar_" + IDLote).closest("tr");

            // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
            console.log("Eliminar usuario con cédula: " + IDLote);

            // Enviar el formulario
            $("#formEliminar_" + IDLote).submit();
        }
    </script>


    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../ModificacionesValidacion/FiltradoLote.js" type="text/javascript"></script>
    <script src="../javascript/validarFormularioLote.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

</html>
