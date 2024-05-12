<%-- 
    Document   : EliminarEvento
    Created on : 3/12/2023, 9:30:23 p. m.
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
            <jsp:useBean id="Objecto" class="Modelo.eventos"/>
            <jsp:setProperty name="Objecto" property="*" />
            <%
                try {
                    String ID = request.getParameter("nombre_evento");
                    System.out.println("El IDDDD" + ID);
                    Objecto.EliminarEvento(ID);
            %>
            <div class="modal">
                <h1>Se Elimino Tu Registro Correctamente!</h1>
                <a href="./../Listados/Tabla_Eventos.jsp"><button id="close">VOLVER</button></a>
            </div>
            <% } catch (Exception e) {
                    System.out.println("Error!!");
                }

            %>
        </div>
    </body>
</html>
