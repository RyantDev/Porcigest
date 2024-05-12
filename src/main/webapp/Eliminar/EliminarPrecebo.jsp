<%-- 
    Document   : EliminarPrecebo
    Created on : 26/11/2023, 2:10:19 p. m.
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
            <jsp:useBean id="ObjectoPrecebo" class="Modelo.Registro_precebo"/>
            <jsp:setProperty name="ObjectoPrecebo" property="*" />
            <%
                try {
                    String IDPrecebo = request.getParameter("ID");
                    ObjectoPrecebo.EliminarPrecebo(IDPrecebo);
            %>
            <div class="modal">
                <h1>Se Elimino Tu Registro Correctamente!</h1>
                <a href="./../Listados/Tabla_Precebo.jsp"><button id="close">VOLVER</button></a>
            </div>
            <% } catch (Exception e) {
                    System.out.println("Error!!");
                }

            %>

        </div>
    </body>
</html>
