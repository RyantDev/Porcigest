<%-- 
    Document   : Tabla_alimentacion
    Created on : 3/10/2023, 8:44:40 a. m.
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
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
        <jsp:useBean id="ObjectoMostrarA" class="Modelo.Registro_alimentacion" />
        <jsp:setProperty name="ObjectoMostrarA" property="*" />

        <h1>Tabla de alimentación</h1>

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


        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>ID Alimentacion</th>
                    <th>Identificador del alimento</th>
                    <th>Identificador del lote</th>
                    <th>Semana</th>
                    <th>Dia 1</th>
                    <th>Dia 2</th>
                    <th>Dia 3</th>
                    <th>Dia 4</th>
                    <th>Dia 5</th>
                    <th>Dia 6</th>
                    <th>Dia 7</th>
                    <th>Fecha inicial</th>
                    <th>Fecha final</th>
                    <th>Promedio semanal</th>
                    <th>Promedio diario</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoMostrarA.MostrarAlimentacion();
                    while (Resultado.next()) {
                        String ID = Resultado.getString("id_alimentacion");

                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_alimentacion"));%></td>
                    <td><%out.print(Resultado.getString("id_alimento"));%></td>
                    <td><%out.print(Resultado.getString("id_lote"));%></td>
                    <td><%out.print(Resultado.getString("semana"));%></td>
                    <td><%out.print(Resultado.getString("dia_1"));%></td>
                    <td><%out.print(Resultado.getString("dia_2"));%></td>
                    <td><%out.print(Resultado.getString("dia_3"));%></td>
                    <td><%out.print(Resultado.getString("dia_4"));%></td>
                    <td><%out.print(Resultado.getString("dia_5"));%></td>
                    <td><%out.print(Resultado.getString("dia_6"));%></td>
                    <td><%out.print(Resultado.getString("dia_7"));%></td>
                    <td><%out.print(Resultado.getString("fecha_I"));%></td>
                    <td><%out.print(Resultado.getString("fecha_F"));%></td>
                    <td><%out.print(Resultado.getString("promedio_semanal"));%></td>
                    <td><%out.print(Resultado.getString("promedio_diario"));%></td>
                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                    <td>
                        <form id="formEliminar_<%= ID%>" action="./../Eliminar/EliminarAlimentacion.jsp?ID=<%= ID%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarAlimentacion('<%= ID%>')">
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
                <h2>Formulario de Registro de Alimentación</h2>
                <form action="./../Modificar/Modificar_Alimentacion.jsp" method="post" id="formulario" onsubmit="return MiFuncion()" >  
                    <div class="formulario">
                        <div class="formulario__grupo" id="grupo__id_alimentacion">
                            <label for="id_alimentacion" class="formulario__label">ID Alimentacion</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="id_alimentacion" id="id_alimentacion" placeholder="Digite el número de lote">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El ID del lote solo puede tener 1 a 20 digitos númericos.</p>
                        </div>
                        <jsp:useBean id="Objecto" class="Modelo.Registro_lote" />
                        <jsp:setProperty name="Objecto" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_lote">
                            <label for="id_lote" class="formulario__label">Id Lote</label>
                            <div class="formulario__grupo-input">
                                <select name="id_lote" class="ComboRegistroUsuario" id="id_lote" required>
                                    <option selected > Seleccione</option>
                                    <%
                                        ResultSet rs = Objecto.MostrarLote();
                                        while (rs.next()) {
                                    %>
                                    <option><%out.print(rs.getString("id_lote"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>
                        <jsp:useBean id="ObjectoA" class="Modelo.registro_alimento" />
                        <jsp:setProperty name="ObjectoA" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_alimento">
                            <label for="id_alimento" class="formulario__label">Id Alimento</label>
                            <div class="formulario__grupo-input">
                                <select name="id_alimento" class="ComboRegistroUsuario" id="id_alimento" required>
                                    <option selected > Seleccione</option>
                                    <%
                                        ResultSet rs2 = ObjectoA.ListadoAlimento();
                                        while (rs2.next()) {
                                    %>
                                    <option><%out.print(rs2.getString("id_alimento"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>
                        <div class="formulario__grupo" id="grupo__semana">
                            <label for="id" class="formulario__label">Semana</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="semana" id="semana" placeholder="Digite el número de la semana">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">La semana no puede ser mayor a 4.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__dia_1">
                            <label for="id" class="formulario__label">Dia 1</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="dia_1" id="dia_1" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__dia_2">
                            <label for="id" class="formulario__label">Dia 2</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="dia_2" id="dia_2" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__dia_3">
                            <label for="id" class="formulario__label">Dia 3</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="dia_3" id="dia_3" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__dia_4">
                            <label for="id" class="formulario__label">Dia 4</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="dia_4" id="dia_4" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__dia_5">
                            <label for="id" class="formulario__label">Dia 5</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="dia_5" id="dia_5" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__dia_6">
                            <label for="id" class="formulario__label">Dia 6</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="dia_6" id="dia_6" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__dia_7">
                            <label for="id" class="formulario__label">Dia 7</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="dia_7" id="dia_7" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_I">
                            <label for="id" class="formulario__label">Fecha Inicial</label>
                            <div class="formulario__grupo-input">
                                <input type="Date" class="formulario__input" name="fecha_I" id="fecha_I" placeholder="">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Diligencie una fecha</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_F">
                            <label for="id" class="formulario__label">Fecha Final</label>
                            <div class="formulario__grupo-input">
                                <input type="Date" class="formulario__input" name="fecha_F" id="fecha_F" placeholder="">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Diligencie una fecha</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__promedio_semanal">
                            <label for="id" class="formulario__label">Promedio semanal</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="promedio_semanal" id="promedio_semanal" placeholder="Digite la cantidad de alimento en Kilogramos de la semana">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__promedio_diario">
                            <label for="id" class="formulario__label">Promedio Diario</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="promedio_diario" id="promedio_diario" placeholder="Digite la cantidad de alimento en Kilogramos de la semana">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                        </div>

                        <div class="formulario__mensaje" id="formulario__mensaje">
                            <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                        </div>
                        <div class="formulario__grupo formulario__grupo-btn-enviar">
                            <button type="submit" class="formulario__btn"> Enviar </button>             
                            <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                        </div>
                    </div>
                </form>  
            </div>
            <button class="position-absolute btn btn-danger close">Close</button>
        </div>

        <dialog id="agregar" class="ventana">
            <iframe id="modalContent" src="../vistas/registro_alimentacion.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>   

    </body>

    <script>
        function EliminarAlimentacion(IDAlimento) {
            // Obtener la fila actual
            var fila = $("#formEliminar_" + IDAlimento).closest("tr");

            // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
            console.log("Eliminar usuario con cédula: " + IDAlimento);

            // Enviar el formulario
            $("#formEliminar_" + IDAlimento).submit();
        }
    </script>


    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../ModificacionesValidacion/FiltradoListados_Alimentacion.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

</html>

