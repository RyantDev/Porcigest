<%-- 
    Document   : registro_porcino
    Created on : 5/09/2023, 10:35:14 a. m.
    Author     : 2499479
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro de Porcino</title>
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="container">
            <h2>Formulario de Registro de Porcino Reproductor</h2>
            <form action="#" method="post" id="formulario" onsubmit=" return MiFuncion()">
                <div class="formulario" >
                    <div class="formulario__grupo" id="grupo__id_porcino">
                        <label for="id_porcino" class="formulario__label">ID Porcino</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" id="id_corral" name="id_porcino" class="formulario__input" required="">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID del porcino solo puede tener 1 a 20 digitos númericos.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__genero_porcino">
                        <label for="genero_porcino" class="formulario__label">Genero </label>
                        <div class="formulario__grupo-input">
                            <select name="genero_porcino" class="ComboRegistroUsuario" id="genero_porcino" required>
                                <option>Seleccione</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un Genero</p>
                    </div>
                    <div class="formulario__grupo"  id="grupo__fecha_nacimiento_porcino">
                        <label for="fecha_nacimiento" class="formulario__label">Fecha de Nacimiento</label>
                        <div class="formulario__grupo-input">
                            <input type="date" id="fecha_nacimiento_porcino" name="fecha_nacimiento_porcino" class="formulario__input" required="">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La fecha de nacimiento del porcino es obligatoria.</p>
                    </div>
                    <jsp:useBean id="objeto" class="Modelo.Registro_corral" />
                    <jsp:setProperty name="objeto" property="*" /> 
                    <div class="formulario__grupo" id="grupo__id_corral">
                        <label for="id_corral" class="formulario__label">ID Corral </label>
                        <div class="formulario__grupo-input">
                            <select name="id_corral" class="ComboRegistroUsuario" id="id_corral" required>
                                <option selected > Seleccione</option>
                                <%
                                    ResultSet rs = objeto.ConsultaIDCorral();
                                    while (rs.next()) {
                                %>
                                <option><%out.print(rs.getString("id_corral"));%></option>

                                <%}%>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un ID </p>
                    </div>
                    <div class="formulario__mensaje" id="formulario__mensaje">
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente.</p>
                    </div>
                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__btn">Enviar</button>
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                    </div>
            </form>
        </div>

        <jsp:useBean id="objetoPorcino" class="Modelo.Registro_porcino" />
        <jsp:setProperty name="objetoPorcino" property="*" /> 

        <%

            boolean resultadoConsulta = objetoPorcino.ValidarInicio();
            if (resultadoConsulta) {
                objetoPorcino.InsertarPorcino();
            }
        %>


        <script src="../javascript/ValidarFormularioCerdos.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    </body>
</html>
