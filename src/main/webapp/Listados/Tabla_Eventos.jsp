
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html>
    <head>
          <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <jsp:useBean id="ObjectoEventos" class="Modelo.eventos"/>
        <jsp:setProperty name="ObjectoEventos" property="*" />

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
            <iframe id="modalContent" src="../vistas/Registro_Evento.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>

        <table id="tabla"  class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Fecha</th>
                    <th>Editar</th>
                    <th>Eliminar</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoEventos.listado_evento();
                    while (Resultado.next()) {
                        String Nombre = Resultado.getString("nombre_evento");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("nombre_evento"));%></td>
                    <td><%out.print(Resultado.getString("descripcion_evento"));%></td>
                    <td><%out.print(Resultado.getString("fecha_evento"));%></td>
                    <td><button id="btnEditar" class="btn btn-warning">Edit</button></td>
                    <td>
                        <form id="formEliminar_<%= Nombre%>" action="./../Eliminar/EliminarEvento.jsp?Nombre=<%= Nombre%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="EliminarEvento('<%= Nombre%>')">
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
    </body>

    <div class="position-absolute w-100 top translate" id="modal" style=" background: rgba(0, 0, 0, 0.1); ">
        <div class="container">
            <h2>Formulario de Eventos</h2>
            <form action="../Modificar/ModificarEvento.jsp" method="post" id="formulario" onsubmit="return MiFuncion()">
                <div class="formulario" >
                    <div class="formulario__grupo" id="grupo__nombre_evento">
                        <label for="nombre_evento" class="formulario__label">Nombre Evento</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="nombre_evento" class="formulario__input" name="nombre_evento" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese un Nombre Correcto</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__descripcion_evento">
                        <label for="text" class="formulario__label">Descrpcion Evento</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="descripcion_evento" class="formulario__input" name="descripcion_evento" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite la descripcion del evento correcto.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_evento">
                        <label for="fecha_evento" class="formulario__label">Fecha Evento</label>
                        <div class="formulario__grupo-input">
                            <input type="Date" id="fecha_evento" class="formulario__input" name="fecha_evento" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ups! debes ingresar una fecha!</p>
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


    <script>
        function EliminarEvento(NombreE) {
            // Obtener la fila actual
            var fila = $("#formEliminar_" + NombreE).closest("tr");

            // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
            console.log("Eliminar usuario con cédula: " + NombreE);

            // Enviar el formulario
            $("#formEliminar_" + NombreE).submit();
        }
    </script>



    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>   
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../javascript/evento.js" type="text/javascript"></script>

</html>
