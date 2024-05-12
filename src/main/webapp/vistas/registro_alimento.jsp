<%-- 
    Document   : registro_alimento
    Created on : 10/12/2023, 12:19:35 p. m.
    Author     : 57314
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de Alimento</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container"  style="margin-top : 250px">
            <h2>Formulario de Registro de Alimento</h2>
            <form action="#" method="post"  id="formulario" onsubmit=" return  MiFuncion()">
                <div class="formulario">
                    <div class="formulario__grupo" id="grupo__id_alimento">
                        <label for="id" class="formulario__label">ID Alimento</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="id_alimento" id="id_alimento" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID de alimento solo puede tener 1 a 20 digitos.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__nombre_alimento">
                        <label for="raza" class="formulario__label">Nombre Alimento </label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="nombre_alimento" id="nombre_alimento" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite un Nombre de Alimento Valido</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__cantidad_alimento">
                        <label for="id" class="formulario__label">Cantidad A Agregar </label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="cantidad_alimento" id="cantidad_alimento" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite una cantidad de alimento en KG.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__observacion">
                        <label for="id" class="formulario__label">Observacion </label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="observacion" id="observacion" placeholder="">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Agrega una observacion</p>
                    </div>
                    <div class="formulario__mensaje" id="formulario__mensaje">
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                    </div>
                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__btn"> Enviar </button>             
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                    </div>
            </form>

            <jsp:useBean id="Objecto" class="Modelo.registro_alimento" />
            <jsp:setProperty name="Objecto" property="*" /> 
            <%
                boolean Estado = Objecto.ValidarInicio();
                if (Estado) {
                    Objecto.InsertarAlimento();
                }

            %>

            <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
            <script src="../javascript/validarFormularioAlimento.js" type="text/javascript"></script>
</html>
