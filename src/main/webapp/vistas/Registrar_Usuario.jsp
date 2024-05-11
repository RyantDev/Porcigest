<%-- 
    Document   : Inicio
    Created on : 31/08/2023, 7:21:30 a. m.
    Author     : Usuario
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro usuarios</title>
         <link href="../css/register.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="container"  style="margin-top : 360px">
            <h2>Formulario de Registro Usuario</h2>
            <form action="" method="post" id="formulario" onsubmit=" return  MiFuncion()">
                <div class="formulario">
                    <div class="formulario__grupo" id="grupo__cedula_usuario">
                        <label for="Cedula" class="formulario__label">Cedula</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="id_corral" name="cedula_usuario" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La cedula colombiana debe tener 8 o 10 digitos.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__nombre_usuario">
                        <label for="nombre" class="formulario__label">Nombre</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="nombre_usuario" id="usuario" placeholder="Juanito Perez Rocha" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El Nombre tiene que ser de 1 a 40 dígitos y solo puede contener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__correo_usuario">
                        <label for="nombre" class="formulario__label">Correo electronico</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="correo_usuario" id="correo_usuario" placeholder="ejemplo@gmail.com" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El Correo tiene que ser de 1 a 50 dígitos, y debe contener @ y un punto en la direccion.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__direccion_usuario">
                        <label for="nombre" class="formulario__label">Dirección</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="direccion_usuario" id="direccion_usuario" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La dirección tiene que ser de 1 a 50 dígitos y solo puede contener letras, números y caracteres especiales.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__usuario_clave">
                        <label for="nombre" class="formulario__label">Usuario</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="usuario_clave" id="usuario_clave" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El usuario tiene que ser de 1 a 10 dígitos y solo puede contener letras, números y caracteres especiales.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__contraseña_clave">
                        <label for="nombre" class="formulario__label">Contraseña</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="contrasena_clave" id="contraseña_clave" placeholder="P@ssw0rd" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La contraseña debe contener al menos una letra mayúscula, una letra minúscula, un dígito y uno de los siguientes caracteres especiales: @, $, !, %, *, ?, o &,
                            con una longitud mínima de 8 caracteres.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__tipo_rol">
                        <label for="tipo_rol" class="formulario__label">Tipo Rol</label>
                        <div class="formulario__grupo-input">
                            <select name="tipo_rol" class="ComboRegistroUsuario" id="tipo_rol" required>
                                <option>Seleccione</option>
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
                            <input type="Date" class="formulario__input" name="fecha_usuario" id="usuario" id="fecha_usuario" placeholder="">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione una fecha.</p>
                    </div>
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
        <jsp:useBean id="objetoRegistrar" class="Modelo.logeo_granja" />
        <jsp:setProperty name="objetoRegistrar" property="*" /> 

        <%
            Boolean EstadoVacio = objetoRegistrar.ValidarInicio();
            if (EstadoVacio) {
                objetoRegistrar.insertarusuarioRol();
            }
        %>


        <script src="../javascript/ValidarFormulario_Usuario.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    </body>
</html>
