<%-- 
    Document   : Tabla_Etapa_Porcino
    Created on : 28/11/2023, 8:45:31 a. m.
    Author     : 57314
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
        <title>JSP Page</title>

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
        <h1>Tabla de Etapa Porcino</h1>
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
        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <td>Id Etapa Porcino</td>
                    <td>ID Etapa </td>
                    <th>Identificador del lote</th>
                    <th>Fecha Inicial</th>
                    <th>Fecha Final</th>
                    <th>Peso Inicial</th>
                    <th>Peso Final</th>
                    <th>Estado</th>
                </tr>
            </thead>
            <tbody>  
                <jsp:useBean id="ObjectoEtapaPorcino" class="Modelo.Registro_etapaP" />
                <jsp:setProperty name="ObjectoEtapaPorcino" property="*" />

                <%
                    ResultSet Resultado = ObjectoEtapaPorcino.MostrarEtapa();
                    while (Resultado.next()) {
                        String ID = Resultado.getString("id_etapa_porcino");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_etapa_porcino"));%></td>
                    <td><%out.print(Resultado.getString("id_etapa"));%></td>
                    <td><%out.print(Resultado.getString("id_lote"));%></td>
                    <td><%out.print(Resultado.getString("fecha_inicial"));%></td>
                    <td><%out.print(Resultado.getString("fecha_final"));%></td>
                    <td><%out.print(Resultado.getString("peso_inicial"));%></td>
                    <td><%out.print(Resultado.getString("peso_final"));%></td>
                    <td><%out.print(Resultado.getString("estado"));%></td>
                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                    <td>
                        <form id="formEliminar_<%= ID%>" action="./../Eliminar/EliminarPorcinosMuertos.jsp?ID=<%= ID%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarEtapaP('<%= ID%>')">
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
        <dialog id="agregar" class="ventana">
            <iframe id="modalContent" src="../vistas/../vistas/registro_etapa-porcino.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>

        <div class="position-absolute w-100 top translate" id="modal" style=" background: rgba(0, 0, 0, 0.1); ">
            <div class="container">
                <h2>Formulario de Registro Etapa</h2>
                <form action="../Modificar/Modificar_Etapa-Porcino.jsp" method="post"  id="formulario"  onsubmit="return MiFuncion()" >
                    <div  class="formulario">
                        <div class="formulario__grupo" id="grupo__id_etapa_porcino">
                            <label for="id" class="formulario__label">ID Etapa Porcino</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="id_etapa_porcino" id="id_etapa_porcino" placeholder=""  readonly="">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El ID de la etapa solo puede tener 1 a 20 digitos númericos.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__id_etapa">
                            <label for="id" class="formulario__label">ID Etapa</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="id_etapa" id="id_etapa" placeholder="" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El ID de la etapa solo puede tener 1 a 20 digitos númericos.</p>
                        </div>
                        <jsp:useBean id="Objecto" class="Modelo.Registro_lote" />
                        <jsp:setProperty name="Objecto" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_lote">
                            <label for="id_lote" class="formulario__label">Id Lote</label>
                            <div class="formulario__grupo-input">
                                <select name="id_lote" class="ComboRegistroUsuario" id="id_lote" required>
                                    <option selected > Seleccione</option>
                                    <%
                                        ResultSet rs2 = Objecto.MostrarLote();
                                        while (rs2.next()) {
                                    %>
                                    <option><%out.print(rs2.getString("id_lote"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_inicial">
                            <label for="id" class="formulario__label">Fecha Inicial</label>
                            <div class="formulario__grupo-input">
                                <input type="date" id="fecha_inicial" class="formulario__input" name="fecha_inicial" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Deligencie una fecha.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_final">
                            <label for="id" class="formulario__label">Fecha Inicial</label>
                            <div class="formulario__grupo-input">
                                <input type="date" id="fecha_final" class="formulario__input" name="fecha_final" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Deligencie una fecha.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__peso_inicial">
                            <label for="id" class="formulario__label">Peso Inicial</label>
                            <div class="formulario__grupo-input">
                                <input type="text" id="peso_inicial" class="formulario__input" name="peso_inicial" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error"></p>
                        </div>
                        <div class="formulario__grupo" id="grupo__peso_final">
                            <label for="id" class="formulario__label">Peso Inicial</label>
                            <div class="formulario__grupo-input">
                                <input type="text" id="peso_final" class="formulario__input" name="peso_final" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error"></p>
                        </div>
                        <div class="formulario__grupo" id="grupo__estado">
                            <label for="id" class="formulario__label">Estado</label>
                            <div class="formulario__grupo-input">
                                <input type="text" id="estado" class="formulario__input" name="estado" >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error"></p>
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
        function EliminarEtapaP(IDM) {
            // Obtener la fila actual
            var fila = $("#formEliminar_" + IDM).closest("tr");

            // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
            console.log("Eliminar usuario con cédula: " + IDM);

            // Enviar el formulario
            $("#formEliminar_" + IDM).submit();
        }
    </script>



    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../ModificacionesValidacion/FiltradoListados_Etapa.js" type="text/javascript"></script>
    <script src="../javascript/ValidarFormularioCerdos.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>



</html>
