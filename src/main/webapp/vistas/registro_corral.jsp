<%-- 
    Document   : newjsp
    Created on : 5/09/2023, 10:01:03 a. m.
    Author     : 2499479
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro de Corral</title>
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="container">
            <h2>Formulario de Registro Corral</h2>
            <form action="#" method="post" id="formulario" onsubmit="return MiFuncion()">
                <div class="formulario" >
                    <div class="formulario__grupo" id="grupo__id_corral">
                        <label for="id_corral" class="formulario__label">ID Corral</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="id_corral" class="formulario__input" name="id_corral" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID del corral solo puede tener 1 a 20 digitos númericos.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__nombre_corral">
                        <label for="nombre_corral" class="formulario__label">Nombre Corral</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="nombre_corral" class="formulario__input" name="nombre_corral" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite el nombre del corral.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__capacidad_corral">
                        <label for="id_corral" class="formulario__label">Capacidad</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="capacidad_corral" class="formulario__input" name="capacidad_corral" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">la capacidad  del corral no puede ser menor a 0.</p>
                    </div>
                </div>
                <div class="formulario__mensaje" id="formulario__mensaje">
                    <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                </div>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn" id="botoncito" >Enviar</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
            </form>
        </div>    
        <jsp:useBean id="objetoCorral" class="Modelo.Registro_corral" />
        <jsp:setProperty name="objetoCorral" property="*" /> 

        <%
            boolean Estado = objetoCorral.ValidarInicio();
            
            if(Estado){
                    objetoCorral.InsertarCorral();
            }
         
        %>

        <script src="../javascript/ValidarFormularioCorral.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

    </body>
</html>