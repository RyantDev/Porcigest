<%-- 
    Document   : EliminarPorcino
    Created on : 23/11/2023, 7:40:47 a. m.
    Author     : 57314
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/VentanaEmergente.css" rel="stylesheet" type="text/css"/>
        <title>Eliminar Porcino</title>
    </head>
    <body>
         <div class="modal-container" id="modal_container">
            <jsp:useBean id="ObjectoUsuarios" class="Modelo.Registro_porcino"/>
            <jsp:setProperty name="ObjectoUsuarios" property="*" />
            <%
                try {
                    String ID = request.getParameter("idPorcino");
                    System.out.println(ID);
                    ObjectoUsuarios.EliminarUsuario(ID);
            %>
            <div class="modal">
                <h1>Se Elimino Tu Registro Correctamente!</h1>
                <a href="./../Listados/Tabla_porcinos.jsp"><button id="close">VOLVER</button></a>
            </div>
            <% } catch (Exception e) {
                    System.out.println("Error!!");
                }
     
            %>
        </div>
    </body>
</html>
