<%-- 
    Document   : ModificarUsuarios
    Created on : 8/10/2023, 6:03:59 p. m.
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
        <jsp:useBean id="objetoRegistrar" class="Modelo.logeo_granja" />
        <jsp:setProperty name="objetoRegistrar" property="*" /> 

        <%
            boolean Estado = objetoRegistrar.ValidarInicio();
            if (Estado) {
                System.out.println("Entro");
                String CedulaA = request.getParameter("cedula_usuario");
                Boolean EstadoModificar = objetoRegistrar.UpdateUsuarios(CedulaA);

                if (EstadoModificar) {

        %>

        <div class="modal">
            <h1>Te Modificaste, Por favor vuelve a logiarte!</h1>
            <a href="./../vistas/Login.jsp"><button id="close">VOLVER</button></a>
        </div>
        <%                        }
                response.sendRedirect("../Listados/Tabla_SuperAdmin.jsp");
            }

        %>


        <link rel="stylesheet" href="../Listados/Tabla_usuario.jsp"/>
    </body>
    <script src="../javascript/FiltradoListados.js" type="text/javascript"></script>

</html>
