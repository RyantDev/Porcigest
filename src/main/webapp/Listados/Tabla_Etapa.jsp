
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="../css/EstilosVentanEmergente.css" rel="stylesheet" type="text/css"/>
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
        <jsp:useBean id="ObjectoMostrarE" class="Modelo.Registro_etapa" />
        <jsp:setProperty name="ObjectoMostrarE" property="*" />

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
                    <button id="btnexcell" onclick="exportToExcel('siete')" class="icon-button">
                        <i class="fas fa-file-excel"></i> Exportar a Excel
                    </button>

                    <button  id="btnpdf" onclick="generatePDF()" class="icon-button">
                        <i class="fas fa-file-pdf"></i> Generar PDF
                    </button>
                </div>
            </div>
        </div>

        <h1>Tabla de Etapa</h1>
        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Identificador de etapa</th>
                    <th>Nombre de la etapa</th>
                    <th>Descripción de etapa</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoMostrarE.MostrarEtapas();
                    while (Resultado.next()) {
                        String ID = Resultado.getString("id_Etapa");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_etapa"));%></td>
                    <td><%out.print(Resultado.getString("nombre_etapa"));%></td>
                    <td><%out.print(Resultado.getString("descripcion_etapa"));%></td>
                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                    <td>
                        <form id="formEliminar_<%= ID%>" action="./../Eliminar/EliminarEtapa.jsp?ID=<%= ID%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarEtapa('<%= ID%>')">
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
                <h2>Formulario de Registro Etapa</h2>
                <form action="../Modificar/Modificar_Etapa.jsp" method="post"  id="formulario" >
                    <div  class="formulario">
                        <div class="formulario__grupo" id="grupo__id_etapa">
                            <label for="id" class="formulario__label">ID Etapa</label>
                            <div class="formulario__grupo-input">
                                <input type="numeric" class="formulario__input" name="id_etapa" id="id_etapa" placeholder="" required>
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El ID de la etapa solo puede tener 1 a 20 digitos númericos.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__nombre_etapa">
                            <label for="id" class="formulario__label">Nombre de la etapa</label>
                            <div class="formulario__grupo-input">
                                <input type="text" id="nombre_etapa" class="formulario__input" name="nombre_etapa" required>
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Digite el nombre de la etapa.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__descripcion_etapa">
                            <label for="id" class="formulario__label">Descripción de la etapa</label>
                            <div class="formulario__grupo-input">
                                <input type="text" id="id_corral" class="formulario__input" name="descripcion_etapa" required>
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Digite la descripción de la etapa.</p>
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
     
  
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>      
</body>    


<script>
                                function EliminarEtapa(IDEtapa) {
                                    // Obtener la fila actual
                                    var fila = $("#formEliminar_" + IDEtapa).closest("tr");

                                    // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
                                    console.log("Eliminar usuario con cédula: " + IDEtapa);

                                    // Enviar el formulario
                                    $("#formEliminar_" + IDEtapa).submit();
                                }
</script>

</html>
