<%-- 
    Document   : registro_muertos
    Created on : 5/09/2023, 10:30:18 a. m.
    Author     : 2499479
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro de Muertos</title>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>  
        <div class="container">
            <h2>Formulario de Registro de Muertos</h2>
            <form action="#" method="post" id="formulario" onsubmit=" return MiFuncion()">
                <div class="formulario"> 
                    <jsp:useBean id="Objecto" class="Modelo.Registro_lote" />
                    <jsp:setProperty name="Objecto" property="*" /> 
                    <div class="formulario__grupo" id="grupo__id_lote">
                        <label for="id_lote" class="formulario__label">Id Lote</label>
                        <div class="formulario__grupo-input">
                            <select name="id_lote" class="ComboRegistroUsuario" id="id_lote" required>
                                <option selected > Seleccione</option>
                                <%
                                    ResultSet rs2 = Objecto.MostrarLote();
                                    while (rs2.next()) {
                                %>
                                <option><%out.print(rs2.getString("id_lote"));%></option>

                                <%}%>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un ID </p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_muerte">
                        <label for="id" class="formulario__label">Fecha Muerte</label>
                        <div class="formulario__grupo-input">
                            <input type="Date" id="fecha_muerte" class="formulario__input" name="fecha_muerte" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite la fecha de la muerte del porcino.</p>
                    </div>
                    <jsp:useBean id="ObjectoEtapa" class="Modelo.Registro_etapa" />
                    <jsp:setProperty name="ObjectoEtapa" property="*" /> 
                    <div class="formulario__grupo" id="grupo__id_etapa">
                        <label for="id_etapa" class="formulario__label">Id Etapa</label>
                        <div class="formulario__grupo-input">
                            <select name="id_etapa" class="ComboRegistroUsuario" id="id_etapa" required>
                                <option selected > Seleccione</option>
                                <%
                                    ResultSet rs = ObjectoEtapa.MostrarEtapas();
                                    while (rs.next()) {
                                %>
                                <option><%out.print(rs.getString("id_etapa"));%></option>

                                <%}%>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un ID </p>
                    </div>
                    <div class="formulario__grupo" id="grupo__descripcion_muerte">
                        <label for="id" class="formulario__label">Descripcion Muerte </label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="descripcion_muerte" class="formulario__input" name="descripcion_muerte" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite la descripcion de la muerte.</p>
                    </div>
                </div>
                <div class="formulario__mensaje" id="formulario__mensaje">
                    <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                </div>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn"> Enviar </button>             
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
            </form>

        </div>
        <jsp:useBean id="ObjectoMuertos" class="Modelo.Registro_muertos" />
        <jsp:setProperty name="ObjectoMuertos" property="*" /> 
        <%
            boolean Estado = ObjectoMuertos.ValidarInicio();
            if (Estado) {
                ObjectoMuertos.InsertarMuertos();
            }
        %>

        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <script src="../javascript/ValidarFormularioMuertos.js" type="text/javascript"></script>
    </body>

</html>