<%-- 
    Document   : Recuperar_contraseña
    Created on : 8/09/2023, 9:28:07 a. m.
    Author     : 2499479
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.EnviarCorreo"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Recuperar contraseña</title>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>    
    </head>
    <body>
        <div class="container">
            <h2>Recuperar contraseña</h2>
            <form method="POST" action="../vistas/Validar_Recuperar_Contrasena.jsp">
                <div class="form-group">
                    <label for="correo">Correo electrónico:</label>
                    <input type="email"  name="correo_usuario" id="correo_usuario" required>
                </div>
                <h5>Recuerda ingresar tu correo electrónico en el cual fue creado el usuario</h5>
                <div style="display: flex; justify-content: space-between">
                    <input type="submit" value="Enviar Correo"> <input type ="submit" value="Volver a Inicio" href="#">
                </div>
            </form>
        </div>
    </body>



</html>