<%-- 
    Document   : Validar_Recuperar_Contrasena
    Created on : 9/10/2023, 10:43:02 a. m.
    Author     : 2499479
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/VentanaEmergente.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="ObjectoRecuperar" class="Modelo.EnviarCorreo" />
        <jsp:setProperty name="ObjectoRecuperar" property="*" />
        <jsp:useBean id="ObjectoValidarCorreo" class="Modelo.logeo_granja"/>
        <jsp:setProperty name="ObjectoValidarCorreo" property="*" />

        <%
            Boolean Estado = true;
            ResultSet Rs = ObjectoValidarCorreo.LitadoUsuariosAdmin();
            while (Rs.next()) {
                if (Rs.getString("correo_usuario").equals(request.getParameter("correo_usuario"))) {
        %>



        <%
            ObjectoRecuperar.createEmail(request.getParameter("correo_usuario"), "HOLA PERRITO");
            ObjectoRecuperar.sendEmail();
            break;

        %>


        <div class="modal-container" id="modal_container">
            <div class="modal">
                <h1>Enviado</h1>
                <p>Se ha enviado un correo a la direccion que nos proporcionaste, revisa tu correo electronico para recuperar  tu contraseña.</p>
                <a href="Login.jsp"><button id="close">VOLVER </button></a>
            </div>
        </div>
        <%                } else {
                    Estado = false;
                }
            }
        %>


        <%
            if (Estado == false) {

        %>
        <div class="modal-container" id="modal_container">
            <div class="modal">
                <h1>No se ha encontrado un correo </h1>
                <p>No se ha encontrado un correo electronico registrado con esa dirrecion, por favor vuelve a intentarlo.</p>
                <a href="Recuperar_contraseña.jsp"><button id="close">VOLVER </button></a>
            </div>
        </div>
        <%            }
        %>
    </body>
</html>
