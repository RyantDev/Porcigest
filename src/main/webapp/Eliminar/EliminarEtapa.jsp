<%-- 
    Document   : EliminarEtapa
    Created on : 28/11/2023, 8:51:18 p. m.
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
       <jsp:useBean id="objetoRegistrar" class="Modelo.Registro_etapa" />
        <jsp:setProperty name="objetoRegistrar" property="*" /> 
     <body>
        <div class="modal-container" id="modal_container">
            <%
                try {
                    String ID = request.getParameter("IdCorral");
                    objetoRegistrar.EliminarEtapa(ID);
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
