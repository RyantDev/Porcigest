<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Cache-Control" content="no-store" />
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            h2{
                width: 100px;
                margin-top: 0px;
            }
            body {

                color: #0050ff;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                height: 100vh;
            }
            .perfil-container {
                height: 300px;
                margin-top: 50px;
                background-color: #ffffff7d;
                border-radius: 20px;
                padding: 30px;
                width: 100%;
                max-width: 600px;
                text-align: left;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .perfil-label {
                font-weight: bold;
                margin-top: 10px;
                display: block;
                color: #0050ff;
            }
            .perfil-dato {
                margin-bottom: 5px;

                color: #333;
                display: flex;
                align-items: center;
            }
            .perfil-dato span {
                margin-left: 10px;
            }
            #btnAgregar{
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 15px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
                position: relative;
                left: 75%;
            }
            @media screen and (max-width: 600px) {
                #btnAgregar{
                    background-color: #007bff;
                    color: #fff;
                    border: none;
                    padding: 10px 15px;
                    border-radius: 5px;
                    cursor: pointer;
                    font-size: 14px;
                    transition: background-color 0.3s ease;
                    position: relative;
                    left: 180px;
                }
            }
        </style>
    </head>
    <body>        
        <jsp:useBean id="ObjectoUsuarios" class="Modelo.logeo_granja"/>
        <jsp:setProperty name="ObjectoUsuarios" property="*"/>
        <%
            try {
                ResultSet Resultado = ObjectoUsuarios.ListadoMegaAdmin();
                while (Resultado.next()) {
                    HttpSession sesions = request.getSession();
                    String usuarioEnSesion = (String) sesions.getAttribute("user");
                    String usuariodos = Resultado.getString("usuario_clave");
                    if (usuarioEnSesion.equals(usuariodos)) {
        %>

        <div class="perfil-container">
            <input id="btnAgregar"  type="button" onclick="abrir_ventana(id)" value="Cambiar Contraseña" name="cambiarcontra" />
            <h2>Mi Perfil</h2>
            <div class="perfil-dato">
                <span class="perfil-label">Nombre:</span>
                <span><%out.print(Resultado.getString("nombre_usuario"));%></span>
            </div>
            <div class="perfil-dato">
                <span class="perfil-label">Cédula:</span>
                <span><%out.print(Resultado.getString("cedula_usuario"));%></span>
            </div>
            <div class="perfil-dato">
                <span class="perfil-label">Usuario:</span>
                <span><%out.print(Resultado.getString("usuario_clave"));%></span>
            </div>
            <div class="perfil-dato">
                <span class="perfil-label">Clave:</span>
                <span><%out.print(Resultado.getString("contrasena_clave"));%></span>
            </div>
            <div class="perfil-dato">
                <span class="perfil-label">Tipo de Rol:</span>
                <span><%out.print(Resultado.getString("tipo_rol"));%></span>
            </div>
            <div class="perfil-dato">
                <span class="perfil-label">Dirección:</span>
                <span><%out.print(Resultado.getString("correo_usuario"));%></span>
            </div>
        </div>
        <%
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
    <script src="../javascript/script-modal.js" type="text/javascript"></script>
    <dialog id="agregar" class="ventana">
        <iframe id="modalContent" src="Cambiar_contraseña.jsp" frameborder="0" width="100%" height="100%"></iframe>
        <button id="closeModalBtn" onclick="cerra_ventana()"> <span class="close">X</span></button>
    </dialog>
</html>
