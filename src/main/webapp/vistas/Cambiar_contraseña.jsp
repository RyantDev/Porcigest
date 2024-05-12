
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cambiar contraseña</title>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>

        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="container">
            <h2>Cambiar contraseña</h2>
            <form method="POST" action="../vistas/Validar_CambiarContraseña.jsp"> 
                <div class="formulario">
                    <div class="formulario__grupo" id="grupo__contraseña_antigua">
                        <label for="descripcion_etapa" class="formulario__label">Contraseña Antigua</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="contraseña_antigua" class="formulario__input" name="contrasena_antigua" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">descripcion_etapa</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__contraseña_nueva">
                        <label for="descripcion_etapa" class="formulario__label">Contraseña Nueva</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="contraseña_nueva" class="formulario__input" name="contrasena_nueva" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Contraseña no valida</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__confirmar_contraseña">
                        <label for="confirmar_contraseña" class="formulario__label">Confirmar Contraseña</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="confirmar_contraseña" class="formulario__input" name="confirmar_contrasena" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Las contraseñas no coinciden, asegurate de las mayusculas</p>
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
    </body>

    <script src="../javascript/ValidarCambioContraseña.js" type="text/javascript"></script>

</html>
