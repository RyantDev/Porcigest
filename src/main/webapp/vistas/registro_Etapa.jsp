<%-- 
    Document   : registro
    Created on : 1/09/2023, 10:08:20 AM
    Author     : julia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro etapa</title>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
      
        <div class="container">
            <h2>Formulario de Registro Etapa</h2>
            <form action="#" method="post"  id="formulario"  onsubmit="MiFuncion()">
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

        <jsp:useBean id="ObjectoEtapa" class="Modelo.Registro_etapa" />
        <jsp:setProperty name="ObjectoEtapa" property="*" /> 

        <%
            boolean Estado = ObjectoEtapa.ValidarInicio();
            if (Estado) {
                ObjectoEtapa.InsertarEtapa();
            }

        %>

        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <script src="../javascript/validarFormularioEtapa.js" type="text/javascript"></script>
    </body>
</html>