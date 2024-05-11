<%-- 
    Document   : ValidarLogeo
    Created on : 1/09/2023, 8:30:15 a. m.
    Author     : 2499479
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP</title>
        <link href="../css/VentanaEmergente.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="objeto" class="Modelo.logeo_granja" />
        <jsp:setProperty name="objeto" property="*" />
        <h1>  </h1>
        <%
            boolean sw = objeto.validarlogeo();
            if (sw == true) {
                String ResultadoTipoRol = objeto.validarTipoRol();

                if (ResultadoTipoRol.equals("Administrador")) {
                    response.sendRedirect("Inicio_Admin.jsp");


        %>


        <%    } else if (ResultadoTipoRol.equals("Empleado")) {
            response.sendRedirect("Inicio_Usuario.jsp");
        } else if (ResultadoTipoRol.equals("SuperAdmin")) {
            response.sendRedirect("Inicio_Admin_1.jsp");
        } else if (ResultadoTipoRol.equals("Sin Rol")) {

        %>
        <div class="modal-container" id="modal_container">
            <div class="modal">
                <h1>OOPS!</h1>
                <p>Parece que no tienes un Tipo de Rol Ingresado, comunicate con un administrador..</p>
                <a href="Login.jsp"><button id="close">VOLVER</button></a>
            </div>
        </div>
        <%        }
        } else {
        %> 

        <div class="modal-container" id="modal_container">
            <div class="modal">
                <h1>OOPS!</h1>
                <p>No se encontro tu registro, por favor vuelve a intentarlo.</p>
                <a href="Login.jsp"><button id="close">VOLVER</button></a>
            </div>
        </div>

        <%            }
        %>
    </body>
</html>
