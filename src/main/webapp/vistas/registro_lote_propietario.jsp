<%-- 
    Document   : registro_lote_propietario
    Created on : 5/09/2023, 10:26:45 a. m.
    Author     : 2499479
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro de lote propietario</title>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/> 
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="container">
            <h2>Formulario de Registro de lote propietario</h2>
            <form action="#" method="post"  id="formulario" onsubmit=" return MiFuncion()"> 
                <div class="formulario" >
                    <div class="formulario__grupo" id="grupo__id_lote" >
                        <label for="Cedula" class="formulario__label">ID Lote</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="id_lote" class="formulario__input" name="id_lote" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID del lote solo puede tener 1 a 20 digitos.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__id_corral">
                        <label for="Cedula" class="formulario__label">ID Corral</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="id_corral" class="formulario__input"  name="id_corral" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID del Corral solo puede tener 1 a 20 digitos.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__cedula_propietario">
                        <label for="Cedula" class="formulario__label">Cedula Propietario</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="cedula_propietariol" class="formulario__input" name="cedula_propietario" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La cedula no puede llevar 10  Digitos, no puedo contener letras.</p>
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

        <jsp:useBean id="objectoLotePropietario" class="Modelo.Registro_lote_propietario" />
        <jsp:setProperty name="objectoLotePropietario" property="*" /> 
        <% 
            boolean Estado = objectoLotePropietario.ValidarInicio();
            if(Estado){
             objectoLotePropietario.InsertarLotePropieratio();
            }
     
%>

        <script src="../javascript/ValidarFormularioLotePropietario.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    </body>
</html>