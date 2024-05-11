<%-- 
    Document   : EliminarCorral
    Created on : 25/11/2023, 3:07:50 p. m.
    Author     : 57314
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/VentanaEmergente.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="modal-container" id="modal_container">
            <jsp:useBean id="ObjectoUsuarios" class="Modelo.Registro_corral"/>
            <jsp:setProperty name="ObjectoUsuarios" property="*" />
            <%
                try {
                    String ID = request.getParameter("IdCorral");
                    ObjectoUsuarios.EliminarCorral(ID);
            %>
            <div class="modal">
                <h1>Se Elimino Tu Registro Correctamente!</h1>
                <a href="./../Listados/Tabla_corral.jsp"><button id="close">VOLVER</button></a>
            </div>
            <% } catch (Exception e) {
                    System.out.println("Error!!");
                }

            %>
        </div>
    </body>
</html>
