<%-- 
    Document   : ModificarEvento
    Created on : 3/12/2023, 9:30:39 p. m.
    Author     : 57314
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="Objecto" class="Modelo.eventos" />
        <jsp:setProperty name="Objecto" property="*" /> 

        <%
            boolean Estado = Objecto.ValidarInicio();
            if (Estado) {
                Objecto.ModificarEvento();
                response.sendRedirect("../Listados/Tabla_Eventos.jsp");
            }

        %>
    </body>
 
</html>
