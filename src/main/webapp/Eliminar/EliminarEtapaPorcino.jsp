<%-- 
    Document   : EliminarEtapaPorcino
    Created on : 28/11/2023, 8:55:36 a. m.
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
            <jsp:useBean id="ObjectoUsuarios" class="Modelo.Registro_etapaP"/>
            <jsp:setProperty name="ObjectoUsuarios" property="*" />
            <%
                try {
                    String ID = request.getParameter("id_etapa_porcino");
                    ObjectoUsuarios.EliminarEtapa_Porcino(ID);
            %>
            <div class="modal">
                <h1>Se Elimino Tu Registro Correctamente!</h1>
                <a href="./../Listados/Tabla_Etapa_Porcino.jsp"><button id="close">VOLVER</button></a>
            </div>
            <% } catch (Exception e) {
                    System.out.println("Error!!");
                }

            %>
        </div>
    </body>
</html>
