
<%@page import="Modelo.logeo_granja"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/loginstyle.css" rel="stylesheet" type="text/css"/>
        <link href="../css/normalize.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Open+Sans:ital,wght@1,600&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <title>Inicio</title>
    </head>
    <body>
        <div class="container-form">
            <div class="information">
                <div class="info-childs">
                    <h2>Bienvenido</h2>
                    <p>¿Olvidaste tu contraseña?</p>
                    <input type="button" value="Recuperar contraseña" id="">
                </div>
            </div>
            <div class="form-information">
                <div class="form-information-childs">
                    <h2>Inicio de sesión</h2>
                    <p>Para conocer la información de tu granja por favor inicia sesión con tu cuenta</p>
                    <form class="form" method = "POST" action="seguridad.do">
                        <label>
                            <i class='bx bx-user'></i>
                            <input type="" placeholder="Nombre completo" name="usuario_clave">
                        </label>
                        <label>
                            <i class='bx bx-lock-alt' ></i>
                            <input type="password"placeholder="Contraseña" name="contrasena_clave">
                        </label>
                        <input type="submit" value="Iniciar sesión">
                        </div>
                    </form>
                </div>
            </div>    
    </body>
</html>
