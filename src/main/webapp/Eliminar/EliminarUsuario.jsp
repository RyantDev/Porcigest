<%-- 
    Document   : EliminarUsuario
    Created on : 19/11/2023, 11:21:48 a. m.
    Author     : 57314
--%>

<%@page import="Modelo.logeo_granja"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/VentanaEmergente.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="modal-container" id="modal_container">
            <jsp:useBean id="ObjectoUsuarios" class="Modelo.logeo_granja"/>
            <jsp:setProperty name="ObjectoUsuarios" property="*" />
            <%
                try {
                    String cedula = request.getParameter("cedula");
                
                    boolean resultado =ObjectoUsuarios.EliminarAdmin(cedula);

                    if (resultado) {


            %>
            <div class="modal">
                <h1>No Puedes Eliminar Este Registro</h1>
                <a href="./../Listados/Tabla_usuario.jsp"><button id="close">VOLVER</button></a>
            </div>

            <%    } else {

            %>
            <div class="modal">
                <h1>Se Elimino Tu Registro Correctamente!</h1>
                <a href="./../Listados/Tabla_usuario.jsp"><button id="close">VOLVER</button></a>
            </div>
            <%               }
                } catch (Exception e) {
                    System.out.println("Error!!");
                }

            %>

        </div>
    </body>
</html>
