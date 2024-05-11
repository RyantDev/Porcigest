<%-- 
    Document   : registro_lote
    Created on : 1/09/2023, 10:43:11 AM
    Author     : julia
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Registro de lotes</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"> 
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container"  style="margin-top : 250px">
            <h2>Formulario de Registro de lotes</h2>
            <form action="#" method="post"  id="formulario" onsubmit=" return  MiFuncion()">
                <div class="formulario">
                    <div class="formulario__grupo" id="grupo__id_lote">
                        <label for="id" class="formulario__label">ID Lote</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="id_lote" id="id_lote" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">El ID de lote solo puede tener 1 a 20 digitos.</p>
                    </div>
                    <jsp:useBean id="objetoReproduccion" class="Modelo.Reproduccion" />
                    <jsp:setProperty name="objetoReproduccion" property="*" /> 
                    <div class="formulario__grupo" id="grupo__id_reproduccion">
                        <label for="id_reproduccion" class="formulario__label">ID Reproduccion </label>
                        <div class="formulario__grupo-input">
                            <select name="id_reproduccion" class="ComboRegistroUsuario" id="id_reproduccion" required>
                                <option selected > Seleccione</option>
                                <%
                                    ResultSet rs2 = objetoReproduccion.listado_Reproduccion();
                                    while (rs2.next()) {
                                %>
                                <option><%out.print(rs2.getString("id_reproduccion"));%></option>

                                <%}%>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un ID </p>
                    </div>
                    <div class="formulario__grupo" id="grupo__raza">
                        <label for="raza" class="formulario__label">Raza</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="raza" id="raza" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Error raza</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_nacimiento">
                        <label for="id" class="formulario__label">Fecha Nacimiento</label>
                        <div class="formulario__grupo-input">
                            <input type="date" class="formulario__input" name="fecha_nacimiento" id="fecha_nacimiento" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Escoja la fecha de nacimiento.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__promedio_peso">
                        <label for="id" class="formulario__label">Promedio de Peso</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="promedio_peso" id="promedio_peso" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Digite el promedio de peso</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__cantidad_camada">
                        <label for="id" class="formulario__label">Cantidad de la Camada</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="cantidad_camada" id="cantidad_camada" placeholder="" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Error en la cantidad</p>
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
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                    </div>
                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__btn"> Enviar </button>             
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                    </div>
            </form>
        </div>

        <jsp:useBean id="ObjectoLote" class="Modelo.Registro_lote" />
        <jsp:setProperty name="ObjectoLote" property="*" /> 

        <%
            boolean Estado = ObjectoLote.ValidarInicio();
            if (Estado) {
                ObjectoLote.InsertarLote();
            }
        %>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <script src="../javascript/validarFormularioLote.js" type="text/javascript"></script>
    </body>
</html>