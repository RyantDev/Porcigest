<%-- 
    Document   : ModificarAlimento
    Created on : 10/12/2023, 12:57:10 p. m.
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
        <jsp:useBean id="objetoRegistrar" class="Modelo.registro_alimento" />
        <jsp:setProperty name="objetoRegistrar" property="*" /> 

        <%
            boolean Estado = objetoRegistrar.ValidarInicio();
            if (Estado) {
                objetoRegistrar.UpdateAlimento();
                response.sendRedirect("../Listados/Tabla_alimento.jsp");
            }

        %>

        <link rel="stylesheet" href="../Listados/Tabla_alimento.jsp"/>
    </body>
    
</html>
