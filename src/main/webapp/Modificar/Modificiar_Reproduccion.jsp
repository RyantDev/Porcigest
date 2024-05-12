<%-- 
    Document   : Modificiar_Reproduccion
    Created on : 25/11/2023, 6:12:54 p. m.
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
        <jsp:useBean id="objetoRegistrar" class="Modelo.Reproduccion" />
        <jsp:setProperty name="objetoRegistrar" property="*" /> 

        <%
            boolean Estado = objetoRegistrar.ValidarInicio();
            if (Estado) {
            String IDReprodu = request.getParameter("id_reproduccion");
             objetoRegistrar.UpdateReproduccion(IDReprodu);
                response.sendRedirect("../Listados/Tabla_Reproducion.jsp");
            }

        %>


        <link rel="stylesheet" href="../Listados/Tabla_usuario.jsp"/>
    </body>
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>
</html>
