<%-- 
    Document   : Tabla_usuario
    Created on : 3/10/2023, 8:44:55 a. m.
    Author     : 2499479
--%>
<%@page import="Modelo.logeo_granja"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>

        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
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
        <h1>Tabla de Usuarios</h1>
        <jsp:useBean id="ObjectoUsuarios" class="Modelo.logeo_granja"/>
        <jsp:setProperty name="ObjectoUsuarios" property="*" />

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
            <iframe id="modalContent" src="../vistas/Registrar_Usuario.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>
        <dialog id="editar" class="ventana">
            <iframe id="modalContent" src="../Modificar/ModificarUsuarios.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>
        <dialog id="eliminar" class="ventana">
            <iframe id="modalContent" src="../Modificar/ModificarUsuarios.jsp" frameborder="0" width="100%" height="100%"></iframe>
            <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
        </dialog>
        <script>
            function validarCedula(btnEdit, Cedulaa) {
                console.log("La cédula es " + Cedulaa);
                var fila = $(btnEdit).closest("tr");


                var comboBoxCedulaValida = fila.find('.selectCedulaValida');


                if (Cedulaa === "1004925521") {


                } else {

                    var nuevaOpcion = $('<option>', {
                        value: 'opcion2',
                        text: 'Empleado'
                    });
                    comboBoxCedulaValida.append(nuevaOpcion);
                }

        </script>

        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Cedula del usuario</th>
                    <th>Nombre del usuario</th>
                    <th>Correo electronico del usuario</th>
                    <th>Direccion del usuario</th>
                    <th>Usuario</th>
                    <th>Clave del usuario</th>
                    <th>Tipo de usuario</th>
                    <th>Fecha de ingreso del usuario</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    ResultSet Resultado = ObjectoUsuarios.ListadoMegaAdmin();
                    while (Resultado.next()) {
                        String cedula = Resultado.getString("cedula_usuario");
                %>
                <tr>
                    <td><%out.print(Resultado.getString("cedula_usuario"));%></td>
                    <td><%out.print(Resultado.getString("nombre_usuario"));%></td>
                    <td><%out.print(Resultado.getString("correo_usuario"));%></td>
                    <td><%out.print(Resultado.getString("direccion_usuario"));%></td>
                    <td><%out.print(Resultado.getString("usuario_clave"));%></td>
                    <td><%out.print(Resultado.getString("contrasena_clave"));%></td>
                    <td><%out.print(Resultado.getString("tipo_rol"));%></td>
                    <td><%out.print(Resultado.getString("fecha_usuario"));%></td>
                    <td> 
                        <button id="btnEditar" class="btn btn-warning">Edit</button>
                    </td>
                    <td>
                        <form id="formEliminar_<%= cedula%>" action="./../Eliminar/EliminarSuperAdmin.jsp?cedula=<%= cedula%>" method="post">
                            <button  id="btnEliminar" type="button" class="btnEliminar icon-button" onclick="eliminarUsuario('<%= cedula%>')">
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
                <h2>Formulario de Registro</h2>
                <form action="./../Modificar/ModificarUsuarios.jsp" method="post" id="formulario"  onsubmit="return MiFuncion()" >
                    <div class="formulario" >
                        <div class="formulario__grupo" id="grupo__cedula_usuario">
                            <label for="Cedula" class="formulario__label">Cedula</label>
                            <div class="formulario__grupo-input">
                                <input type="text" id="cedula_usuario" name="cedula_usuario" readonly >
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener, letras y guion bajo.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__nombre_usuario">
                            <label for="nombre" class="formulario__label">Nombre</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="nombre_usuario" id="nombre_usuario" placeholder="john123">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener, letras y guion bajo.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__correo_usuario">
                            <label for="nombre" class="formulario__label">correo_usuario</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="correo_usuario" id="correo_usuario" placeholder="john123">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener, letras y guion bajo.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__direccion_usuario">
                            <label for="nombre" class="formulario__label">Direccion</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="direccion_usuario" id="direccion_usuario" placeholder="john123">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener, letras y guion bajo.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__usuario_clave">
                            <label for="nombre" class="formulario__label">Usuario Clave</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="usuario_clave" id="usuario_clave" placeholder="john123">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener, letras y guion bajo.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__contrasena_clave">
                            <label for="nombre" class="formulario__label">Contraseña</label>
                            <div class="formulario__grupo-input">
                                <input type="text" class="formulario__input" name="contrasena_clave" id="contrasena_clave" placeholder="john123">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener, letras y guion bajo.</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__tipo_rol">
                            <label for="tipo_rol" class="formulario__label">Tipo Rol</label>
                            <div class="formulario__grupo-input">
                                <select name="tipo_rol" class="ComboRegistroUsuario" id="tipo_rol" required>
                                    <option>Seleccione</option>
                                     <option value="Super Admin">Super Admin</option>
                                    <option value="Administrador">Administrador</option>
                                    <option value="Empleado">Empleado</option>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un rol de usuario</p>
                        </div>
                        <div class="formulario__grupo" id="grupo__fecha_usuario">
                            <label for="nombre" class="formulario__label">Fecha</label>
                            <div class="formulario__grupo-input">
                                <input type="Date" class="formulario__input" name="fecha_usuario" id="fecha_usuario">
                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">El usuario tiene que ser de 4 a 16 dígitos y solo puede contener, letras y guion bajo.</p>
                        </div>
                        <div class="formulario__mensaje" id="formulario__mensaje">
                            <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                        </div>
                        <div class="formulario__grupo formulario__grupo-btn-enviar">
                            <button type="submit" class="formulario__btn" id="botoncito">Enviar</button>
                            <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                        </div>
                    </div>
                </form>
            </div>
            <button class="position-absolute btn btn-danger close">Close</button>
        </div>
    </body>   

    <dialog id="agregar" class="ventana">
        <iframe id="modalContent" src="../vistas/Registrar_Usuario.jsp" frameborder="0" width="100%" height="100%"></iframe>
        <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
    </dialog>



    <script>
            function eliminarUsuario(cedula) {
                // Obtener la fila actual
                var fila = $("#formEliminar_" + cedula).closest("tr");
                // Aquí puedes hacer lo que necesites con la cédula y la fila, por ejemplo, enviarla al formulario y luego enviar el formulario
                console.log("Eliminar usuario con cédula: " + cedula);
                // Enviar el formulario
                $("#formEliminar_" + cedula).submit();
            }
    </script>


    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>
    <script src="../javascript/ValidarFormulario_Usuario.js" type="text/javascript"></script>


</html>
