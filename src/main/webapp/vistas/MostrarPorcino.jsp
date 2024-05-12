<%-- 
    Document   : MostrarPorcino
    Created on : 3/10/2023, 6:50:26 a. m.
    Author     : 2499479
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
        <jsp:useBean id="ObjectoMostrarP" class="Modelo.Registro_porcino" />
        <jsp:setProperty name="ObjectoMostrarP" property="*" /> 

        <form class="d-flex" role="search">
            <input class="form-control me-2 light-table-filter" data-table="order-table" type="text" placeholder="Search..">
        </form>    

        <h1>Tabla de Porcinos</h1>
        <table class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Identificador porcino</th>
                    <th>Género porcino</th>
                    <th>Fecha de nacimiento</th>
                    <th>ID del padre porcino</th>
                    <th>ID de la madre porcino</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoMostrarP.MostrarPorcinos();
                    while (Resultado.next()) {

                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_porcino"));%></td>
                    <td><%out.print(Resultado.getString("genero_porcino"));%></td>
                    <td><%out.print(Resultado.getString("fecha_nacimiento_porcino"));%></td>
                    <td><%out.print(Resultado.getString("id_padre_porcino"));%></td>
                    <td><%out.print(Resultado.getString("id_madre_porcino"));%></td>
                </tr>

                <%
                    }
                    Resultado.close();
                %>

            </tbody>
        </table>
    </body>   
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>


</html>
