<%-- 
    Document   : Registrar_destete
    Created on : 27/11/2023, 9:26:11 a. m.
    Author     : 2499479
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Destete </title>
         <link href="../css/register.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="container"  style="margin-top : 360px">
            <h2>Registrar Destete</h2>
            <form action="" method="post" id="formulario" onsubmit=" return  MiFuncion()">
                <div class="formulario">
                    <div class="formulario__grupo" id="grupo__id_porcino">
                        <label for="id_porcino" class="formulario__label">ID Porcino</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="id_porcino" name="id_porcino" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Por favor, introduzca el ID del porcino.</p>
                    </div>

                    <div class="formulario__grupo" id="grupo__preparacion_destete">
                        <label for="preparacion_destete" class="formulario__label">Preparación para el destete</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="preparacion_destete" name="preparacion_destete" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Por favor, introduzca la preparación para el destete.</p>
                    </div>

                    <div class="formulario__grupo" id="grupo__problema_salud">
                        <label for="problema_salud" class="formulario__label">Problema de salud</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="problema_salud" name="problema_salud" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Por favor, introduzca el problema de salud.</p>
                    </div>

                    <div class="formulario__grupo" id="grupo__alimentacion">
                        <label for="alimentacion" class="formulario__label">Alimentación</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="alimentacion" name="alimentacion" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Por favor, introduzca la alimentación.</p>
                    </div>

                    <div class="formulario__grupo" id="grupo__necesidad_nutricional">
                        <label for="necesidad_nutricional" class="formulario__label">Necesidad nutricional</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="necesidad_nutricional" name="necesidad_nutricional" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Por favor, introduzca la necesidad nutricional.</p>
                    </div>

                    <div class="formulario__grupo" id="grupo__fecha_destete">
                        <label for="fecha_destete" class="formulario__label">Fecha de destete</label>
                        <div class="formulario__grupo-input">
                            <input type="date" id="fecha_destete" name="fecha_destete" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Por favor, introduzca la fecha de destete.</p>
                    </div>
                </div>
            </form>
        </div>
    </body>


    <jsp:useBean id="objetoRegistrar" class="Modelo.Registro_destete" />
    <jsp:setProperty name="objetoRegistrar" property="*" /> 

    <%
        Boolean EstadoVacio = objetoRegistrar.ValidarInicio();
        if (EstadoVacio) {
            objetoRegistrar.InsertarDestete();
        }
    %>


    <script src="../javascript/ValidarDestete.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

</html>
