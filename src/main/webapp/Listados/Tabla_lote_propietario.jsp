<%-- 
    Document   : Tabla_lote_propietario
    Created on : 3/10/2023, 8:34:57 a. m.
    Author     : 2499479
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx-style/0.13.2/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <jsp:useBean id="ObjectoListadoPropietario" class="Modelo.Registro_lote_propietario" />
        <jsp:setProperty name="ObjectoListadoPropietario" property="*" />

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
                <div class="export-buttons">
                    <button id="btnexcell" onclick="exportToExcel('tres')" class="icon-button">
                        <i class="fas fa-file-excel"></i> Exportar a Excel
                    </button>

                    <button  id="btnpdf" onclick="generatePDF()" class="icon-button">
                        <i class="fas fa-file-pdf"></i> Generar PDF
                    </button>
                </div>

            </div>

        </div>


        <h1>Tabla de lote propietario</h1>
        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Identificador del lote</th>
                    <th>Identificador de el corral</th>
                    <th>Cedula del propietario</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoListadoPropietario.ListadoPropietarioXLote();
                    while (Resultado.next()) {
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_lote"));%></td>
                    <td><%out.print(Resultado.getString("id_corral"));%></td>
                    <td><%out.print(Resultado.getString("cedula_propietario"));%></td> 
                    <td class="button-cell"> 
                        <button id="btnEditar" class="icon-button hidden-button" onclick="abrir_ventana(id)">
                            <i class="fas fa-edit"></i> Editar
                        </button>
                    </td>
                    <td class="button-cell">
                        <button id="btnEliminar" class="icon-button hidden-button" onclick="abrir_ventana(id)">
                            <i class="fas fa-trash"></i> Eliminar
                        </button>
                    </td>

                </tr>

                <%
                    }
                    Resultado.close();
                %>
            </tbody>
        </table>

    </body>
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>
</html>
