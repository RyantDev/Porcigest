<%-- 
    Document   : Validar_CambiarContraseña
    Created on : 11/10/2023, 10:51:47 a. m.
    Author     : 2499479
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
        <jsp:useBean id="objeto" class="Modelo.Cambiar_Contraseña" />
        <jsp:setProperty name="objeto" property="*" />
        <%
            System.out.println(request.getParameter("Contraseña antiguaaa" + "contraseña_antigua"));
            Boolean EstadoVacio = objeto.ValidarInicioContraseña(request.getParameter("contrasena_antigua"), request.getParameter("contrasena_nueva"), request.getParameter("confirmar_contrasena"));
            if (EstadoVacio) {
                Boolean EstadoContraseña = objeto.validarCambioContraseña(request.getParameter("contraseña_antigua"));
                if (EstadoContraseña) {
                    objeto.UpdateCambio(request.getParameter("contrasena_nueva"));

        %>
        <div class="modal-container" id="modal_container">
            <div class="modal">
                <h1>Exito</h1>
                <p>Se ha Cambiado la contraseña exitosamente, y ya yorqui</p>         
            </div>
        </div> 

        <%          } else {

        %>
        <div class="modal-container" id="modal_container">
            <div class="modal">
                <h1>Contraseña no encontrada</h1>
                <p>No se ha encontrado la contraseña introducida, comprueba nuevamente. </p>
                <a href="../vistas/Cambiar_contraseña.jsp"><button id="close">VOLVER </button></a>
            </div>
        </div> 

        <%}%>

        <%        } else {
        %>
        <div class="modal-container" id="modal_container">
            <div class="modal">
                <h1>Contraseña no encontrada</h1>
                <p>No se ha encontrado la contraseña introducida, comprueba nuevamente. </p>
                <a href="../vistas/Cambiar_contraseña.jsp"><button id="close">VOLVER </button></a>
            </div>
        </div> 

        <%}%>
    </body>
</html>
