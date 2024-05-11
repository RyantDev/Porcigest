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
        <jsp:useBean id="Objectoalimento" class="Modelo.registro_alimento" />
        <jsp:setProperty name="Objectoalimento" property="*" />
        <h1>Tabla de Alimento</h1>

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
            <iframe id="modalContent" src="../vistas/registro_alimento.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>


        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Id alimento</th>
                    <th>nombre alimento</th>
                    <th>cantidad alimento</th>
                    <th>observacion</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = Objectoalimento.ListadoAlimento();
                    while (Resultado.next()) {
                        String IDLote = Resultado.getString("id_alimento");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_alimento"));%></td>
                    <td><%out.print(Resultado.getString("nombre_alimento"));%></td>
                    <td><%out.print(Resultado.getString("cantidad_alimento"));%></td>
                    <td><%out.print(Resultado.getString("observacion"));%></td>

                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>

                </tr>

                <%
                    }
                    Resultado.close();
                %>
            </tbody>
        </table>
        <div class="position-absolute w-100 top translate" id="modal" style=" background: rgba(0, 0, 0, 0.1); ">
            <div class="container"  style="margin-top : 250px">
                <h2>Formulario de Registro de lotes</h2>
                <form action="../Modificar/ModificarAlimento.jsp" method="post"  id="formulario" onsubmit=" return  MiFuncion()">
                    <div class="formulario">
                        <div class="formulario__grupo" id="grupo__id_alimento">
                            <label for="id" class="formulario__label">ID Alimento</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="id_alimento" id="id_alimento" placeholder="" required>
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El ID de alimento solo puede tener 1 a 20 digitos.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__nombre_alimento">
                            <label for="raza" class="formulario__label">Nombre Alimento </label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="nombre_alimento" id="nombre_alimento" placeholder="" required>
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Digite un Nombre de Alimento Valido</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__cantidad_alimento">
                            <label for="id" class="formulario__label">Cantidad A Agregar </label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="cantidad_alimento" id="cantidad_alimento" placeholder="" required>
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Digite una cantidad de alimento en KG.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__observacion">
                            <label for="id" class="formulario__label">Observacion </label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="observacion" id="observacion" placeholder="">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Agrega una observacion</p>
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

    


    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../ModificacionesValidacion/FiltradoListadosalimento.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

</html>
