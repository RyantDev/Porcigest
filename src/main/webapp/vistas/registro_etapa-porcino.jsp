<%-- 
    Document   : registro
    Created on : 1/09/2023, 10:08:20 AM
    Author     : julia
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro etapa</title>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
    </head>
    <body>
        <div class="container" style=" margin-top: 315px;" >
            <h2>Formulario de Registro Etapa</h2>
            <form action="#" method="post"  id="formulario"  onsubmit="MiFuncion()">
                <div  class="formulario">
                    <div class="formulario__grupo" id="grupo__id_etapa">
                        <label for="id" class="formulario__label">ID Etapa</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="id_etapa" id="id_etapa" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID de la etapa solo puede tener 1 a 20 digitos númericos.</p>
                    </div>
                   <jsp:useBean id="Objecto" class="Modelo.Registro_lote" />
                        <jsp:setProperty name="Objecto" property="*" /> 
                        <div class="formulario__grupo" id="grupo__id_lote">
                            <label for="id_lote" class="formulario__label">Id Lote</label>
                            <div class="formulario__grupo-input">
                                <select name="id_lote" class="ComboRegistroUsuario" id="id_lote" required>
                                    <option selected > Seleccione</option>
                                    <%
                                        ResultSet rs = Objecto.MostrarLote();
                                        while (rs.next()) {
                                    %>
                                    <option><%out.print(rs.getString("id_lote"));%></option>

                                    <%}%>
                                </select>
                                <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                            </div>
                            <p class="formulario__input-error">Seleccione un ID </p>
                        </div>
                    <div class="formulario__grupo" id="grupo__fecha_inicial">
                        <label for="id" class="formulario__label">Fecha Inicial</label>
                        <div class="formulario__grupo-input">
                            <input type="Date" id="fecha_inicial" class="formulario__input" name="fecha_inicial" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Deligencie una fecha.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_final">
                        <label for="id" class="formulario__label">Fecha Inicial</label>
                        <div class="formulario__grupo-input">
                            <input type="Date" id="fecha_final" class="formulario__input" name="fecha_final" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Deligencie una fecha.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__peso_inicial">
                        <label for="id" class="formulario__label">Peso Inicial</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="peso_inicial" class="formulario__input" name="peso_inicial" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error"></p>
                    </div>
                    <div class="formulario__grupo" id="grupo__peso_final">
                        <label for="id" class="formulario__label">Peso Inicial</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="peso_final" class="formulario__input" name="peso_final" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error"></p>
                    </div>
                    <div class="formulario__grupo" id="grupo__estado">
                        <label for="id" class="formulario__label">Estado</label>
                        <div class="formulario__grupo-input">
                            <input type="text" id="estado" class="formulario__input" name="estado" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error"></p>
                    </div>
                </div>
                <div class="formulario__mensaje" id="formulario__mensaje">
                    <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                </div>
                <div class="formulario__grupo formulario__grupo-btn-enviar">
                    <button type="submit" class="formulario__btn" id="botoncito">Enviar</button>
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
            </form>
        </div>

        <jsp:useBean id="ObjectoEtapa" class="Modelo.Registro_etapaP" />
        <jsp:setProperty name="ObjectoEtapa" property="*" /> 

        <%
            boolean Estado = ObjectoEtapa.ValidarInicio();
            if (Estado) {
                ObjectoEtapa.InsertarEtapaPorcino();
            }

        %>

        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <script src="../javascript/Registro_etapa_porcino.js" type="text/javascript"></script>
    </body>
</html>