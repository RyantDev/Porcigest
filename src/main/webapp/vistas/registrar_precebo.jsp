<%-- 
    Document   : registrar_precebo
    Created on : 26/11/2023, 1:08:11 p. m.
    Author     : 57314
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h2>Registro Precebo</h2>
            <form action="#" method="post"  id="formulario" onsubmit=" return  MiFuncion()">
                <!-- Campo id_lot -->
                <div class="formulario__grupo" id="grupo__id_lote">
                    <label for="id_lote" class="formulario__label">ID Lote</label>
                    <div class="formulario__grupo-input">
                        <input type="numeric" class="formulario__input" name="id_lote" id="id_lote" placeholder="" required>
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">El ID de lote solo puede tener 1 a 20 dígitos.</p>
                </div>
                <!-- Campo fecha_Inicio_P -->
                <div class="formulario__grupo" id="grupo__fecha_Inicio_P">
                    <label for="fecha_Inicio_P" class="formulario__label">Fecha de Inicio</label>
                    <div class="formulario__grupo-input">
                        <input type="date" class="formulario__input" name="fecha_Inicio_P" id="fecha_Inicio_P" required>
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa una fecha válida.</p>
                </div>

                <!-- Campo cantidad_porcino -->
                <div class="formulario__grupo" id="grupo__cantidad_porcino">
                    <label for="cantidad_porcino" class="formulario__label">Cantidad de Porcinos</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="cantidad_porcino" id="cantidad_porcino" placeholder="" required>
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">La cantidad de porcinos debe ser un número válido.</p>
                </div>

                <!-- Campo tipo_dieta -->
                <div class="formulario__grupo" id="grupo__tipo_dieta">
                    <label for="tipo_dieta" class="formulario__label">Tipo de Dieta</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="tipo_dieta" id="tipo_dieta" placeholder="" required>
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa el tipo de dieta.</p>
                </div>

                <!-- Campo condicion_ambiental -->
                <div class="formulario__grupo" id="grupo__condicion_ambiental">
                    <label for="condicion_ambiental" class="formulario__label">Condición Ambiental</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="condicion_ambiental" id="condicion_ambiental" placeholder="" required>
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa la condición ambiental.</p>
                </div>

                <!-- Campo salud_porcinos -->
                <div class="formulario__grupo" id="grupo__salud_porcinos">
                    <label for="salud_porcinos" class="formulario__label">Salud de Porcinos</label>
                    <div class="formulario__grupo-input">
                        <input type="text" class="formulario__input" name="salud_porcinos" id="salud_porcinos" placeholder="" required>
                        <i class="formulario__validacion-estado fas fa-times-circle"></i>
                    </div>
                    <p class="formulario__input-error">Por favor, ingresa el estado de salud de los porcinos.</p>
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
    </body>
    <jsp:useBean id="ObjectoPrecebo" class="Modelo.Registro_precebo" />
    <jsp:setProperty name="ObjectoPrecebo" property="*" /> 

    <%
        boolean Estado = ObjectoPrecebo.ValidarInicio();
        if (Estado) {
            ObjectoPrecebo.InsertarPrecebo();
        }
    %>

    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    <script src="../javascript/ValidarPrecebo.js" type="text/javascript"></script>
</html>




