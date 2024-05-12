<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/evento.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h2>Formulario de Eventos</h2>
            <form action="#" method="post" id="formulario" onsubmit="return MiFuncion()">
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
    </body>
    <script src="../javascript/script-modal.js" type="text/javascript"></script>


    <jsp:useBean id="ObjectoEvento" class="Modelo.eventos" />
    <jsp:setProperty name="ObjectoEvento" property="*" /> 

    <%
        boolean Estado = ObjectoEvento.ValidarInicio();
        if (Estado) {
            ObjectoEvento.insertarEvento();
        }

    %>

    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    <script src="../javascript/ValidarEvento.js" type="text/javascript"></script>


</html>
