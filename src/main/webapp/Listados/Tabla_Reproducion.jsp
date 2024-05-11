<%-- 
    Document   : Tabla_Reproducion
    Created on : 27/10/2023, 3:44:25 p. m.
    Author     : Usuario
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"

              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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
        <jsp:useBean id="ObjectoReproduccion" class="Modelo.Reproduccion"/>
        <jsp:setProperty name="ObjectoReproduccion" property="*" />

        <div class="barra">
            <div class="uno"> 
                <form class="d-flex busca" role="search">            
                    <input class="form-control me-2 light-table-filter" data-table="order-table" type="text" placeholder="Search..">
                </form>          
            </div>
            <div class="dos">
                <!-- Botón de agrupación para móviles -->
                <button id="btnGroup" onclick="toggleButtons()" class="icon-button">
                    <i class="fas fa-bars"></i>
                </button>
                <!-- Botones individuales -->

                <button id="btnAgregar" class="icon-button" onclick="abrir_ventana(id)">
                    <i class="fas fa-plus"></i> Agregar
                </button>

            </div>
        </div>

        <dialog id="agregar" class="ventana">
            <iframe id="modalContent" src="../vistas/Registro_Reproduccion.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>

        <table id="tabla"  class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>ID Reproduccion</th>
                    <th>Numero Camada</th>
                    <th>Fecha parto</th>
                    <th>ID Madre</th>
                    <th>ID Padre</th>
                    <th>Vivos</th>
                    <th>Muertos</th>
                    <th>Fecha destete</th>
                    <th>Observacion</th>

                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoReproduccion.listado_Reproduccion();
                    while (Resultado.next()) {
                        String ID = Resultado.getString("id_reproduccion");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_reproduccion"));%></td>
                    <td><%out.print(Resultado.getString("numero_camada"));%></td>
                    <td><%out.print(Resultado.getString("fecha_parto"));%></td>
                    <td><%out.print(Resultado.getString("id_madre"));%></td>
                    <td><%out.print(Resultado.getString("id_padre"));%></td>
                    <td><%out.print(Resultado.getString("nacidos_vivos"));%></td>
                    <td><%out.print(Resultado.getString("nacidos_muertos"));%></td>
                    <td><%out.print(Resultado.getString("fecha_destete"));%></td>
                    <td><%out.print(Resultado.getString("observacion"));%></td>
                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                    <td>
                        <form id="formEliminar_<%= ID%>" action="./../Eliminar/EliminarReproduccion.jsp?ID=<%= ID%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarReproduccion('<%= ID%>')">
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
            <div class="container" style=" height: 108%;" margin-top: -80px";>
                <h2>Formulario de Registro de Reproduccion</h2>
                <form action="../Modificar/Modificiar_Reproduccion.jsp" method="post" id="formulario" onsubmit="return MiFuncion()"  >
                    <div class="formulario">
                        <div class="formulario__grupo" id="grupo__id_reproduccion">
                            <label for="id_reproduccion" class="formulario__label">Número de Camada</label>
                            <div class="formulario__grupo-input">
                                <input type= "text" class="formulario__input" name="id_reproduccion" id="id_reproduccion" placeholder="Número de Camada" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error message here</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__numero_camada">
                            <label for="numero_camada" class="formulario__label">Número de Camada</label>
                            <div class="formulario__grupo-input">
                                <input type= "text" class="formulario__input" name="numero_camada" id="numero_camada" placeholder="Número de Camada" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error message here</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_parto">
                            <label for="fecha_parto" class="formulario__label">Fecha de Parto</label>
                            <div class="formulario__grupo-input">
                                <input type="Date" class="formulario__input" name="fecha_parto" id="fecha_parto" placeholder="Fecha de Parto" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error message here</p>
                        </div>
                        <jsp:useBean id="ObjectoPM" class="Modelo.Registro_porcino" />
                        <jsp:setProperty name="ObjectoPM" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_madre">
                            <label for="id_madre" class="formulario__label">ID Madre </label>
                            <div class="formulario__grupo-input">
                                <select name="id_madre" class="ComboRegistroUsuario" id="id_madre" required>
                                    <option selected > Seleccione</option>
                                    <%
                                        ResultSet rs2 = ObjectoPM.LitadoPorcinoHembras();
                                        while (rs2.next()) {
                                    %>
                                    <option><%out.print(rs2.getString("id_porcino"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>
                        <jsp:useBean id="ObjectoPP" class="Modelo.Registro_porcino" />
                        <jsp:setProperty name="ObjectoPP" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_padre">
                            <label for="id_padre" class="formulario__label">ID Padre </label>
                            <div class="formulario__grupo-input">
                                <select name="id_padre" class="ComboRegistroUsuario" id="id_padre" required>
                                    <option selected > Seleccione</option>
                                    <%
                                        ResultSet rs = ObjectoPM.LitadoPorcinoMachos();
                                        while (rs.next()) {
                                    %>
                                    <option><%out.print(rs.getString("id_porcino"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>

                        <div class="formulario__grupo" id="grupo__nacidos_vivos">
                            <label for="nacidos_vivos" class="formulario__label">Nacidos Vivos</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="nacidos_vivos" id="nacidos_vivos" placeholder="Nacidos Vivos" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error message here</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__nacidos_muertos">
                            <label for="nacidos_muertos" class="formulario__label">Nacidos Muertos</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="nacidos_muertos" id="nacidos_muertos" placeholder="Nacidos Muertos" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error message here</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_destete">
                            <label for="fecha_destete" class="formulario__label">Fecha de Destete</label>
                            <div class="formulario__grupo-input">
                                <input type="Date" class="formulario__input" name="fecha_destete" id="fecha_destete" placeholder="Fecha de Destete" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error message here</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__observacion">
                            <label for="observacion" class="formulario__label">Observación</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="observacion" id="observacion" placeholder="Observación" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Error message here</p>
                        </div>
                    </div>
                    <div class="formulario__mensaje" id="formulario__mensaje">
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                    </div>
                    <div class="formulario__grupo formulario__grupo-btn-enviar">    
                        <button type="submit" class="formulario__btn" onclick="return ValidarNumerosDeVivosYMuertos2()">Enviar</button>
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                    </div>
            </div>
        </form>
        <button class="position-absolute btn btn-danger close">Close</button>
    </div>
</body>


<script>
    function EliminarReproduccion(ID) {
        // Obtener la fila actual
        var fila = $("#formEliminar_" + ID).closest("tr");

        // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
        console.log("Eliminar usuario con cédula: " + ID);

        // Enviar el formulario
        $("#formEliminar_" + ID).submit();
    }
</script>

<script src="../javascript/script-modal.js" type="text/javascript"></script>
<script src="../ModificacionesValidacion/FiltradoListados_Reproduccion.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>


</html>
