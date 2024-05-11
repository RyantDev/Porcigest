<%-- 
    Document   : EliminarReproduccion
    Created on : 25/11/2023, 3:45:17 p. m.
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
            <jsp:useBean id="ObjectoUsuarios" class="Modelo.Reproduccion"/>
            <jsp:setProperty name="ObjectoUsuarios" property="*" />
            <%
                try {
                    String IDReproduccion = request.getParameter("ID");
                    ObjectoUsuarios.EliminarReproduccion(IDReproduccion);
            %>
            <div class="modal">
                <h1>Se Elimino Tu Registro Correctamente!</h1>
                <a href="./../Listados/Tabla_Reproducion.jsp"><button id="close">VOLVER</button></a>
            </div>
            <% } catch (Exception e) {
                    System.out.println("Error!!");
                }
            %>
        </div>
    </body>
</html>
