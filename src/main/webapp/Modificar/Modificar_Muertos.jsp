

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="objetoRegistrar" class="Modelo.Registro_muertos" />
        <jsp:setProperty name="objetoRegistrar" property="*" /> 

        <%
            boolean Estado = objetoRegistrar.ValidarInicio();
            if (Estado) {
               System.out.println("Entro");
                objetoRegistrar.UpdateMuertos();
                response.sendRedirect("../Listados/Tabla_muertos.jsp");
            }

        %>
        <link rel="stylesheet" href="../Listados/Tabla_usuario.jsp"/>
    </body>
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>
</body>
</html>
