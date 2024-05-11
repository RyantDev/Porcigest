<%-- 
    Document   : Registro_Reproduccion
    Created on : 27/10/2023, 3:44:54 p. m.
    Author     : Usuario
--%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/register_2.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">   
    </head>
    <body>
        <div class="container">
            <h2>Formulario de Registro de Reproduccion</h2>
            <form action="#" method="post" id="formulario" onsubmit="return MiFuncion()">
                <div class="formulario">
                    <div class="formulario__grupo" id="grupo__numero_camada">
                        <label for="numero_camada" class="formulario__label">Número de Camada</label>
                        <div class="formulario__grupo-input">
                            <input type= "numeric" class="formulario__input" name="numero_camada" id="numero_camada" placeholder="Número de Camada" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Error message here</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_parto">
                        <label for="fecha_parto" class="formulario__label">Fecha de Parto</label>
                        <div class="formulario__grupo-input">
                            <input type="date" class="formulario__input" name="fecha_parto" id="fecha_parto" placeholder="Fecha de Parto" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Error message here</p>
                    </div>
                    <jsp:useBean id="ObjectoPM" class="Modelo.Registro_porcino" />
                    <jsp:setProperty name="ObjectoPM" property="*" /> 
                    <div class="formulario__grupo" id="grupo__id_madre">
                        <label for="id_madre" class="formulario__label">ID Madre </label>
                        <div class="formulario__grupo-input">
                            <select name="id_madre" class="ComboRegistroUsuario" id="id_madre" required>
                                <option selected > Seleccione</option>
                                <%
                                    ResultSet rs2 = ObjectoPM.LitadoPorcinoHembras();
                                    while (rs2.next()) {
                                %>
                                <option><%out.print(rs2.getString("id_porcino"));%></option>

                                <%}%>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un ID </p>
                    </div>
                    <jsp:useBean id="ObjectoPP" class="Modelo.Registro_porcino" />
                    <jsp:setProperty name="ObjectoPP" property="*" /> 
                    <div class="formulario__grupo" id="grupo__id_padre">
                        <label for="id_padre" class="formulario__label">ID Padre </label>
                        <div class="formulario__grupo-input">
                            <select name="id_padre" class="ComboRegistroUsuario" id="id_padre" required>
                                <option selected > Seleccione</option>
                                <%
                                    ResultSet rs = ObjectoPM.LitadoPorcinoMachos();
                                    while (rs.next()) {
                                %>
                                <option><%out.print(rs.getString("id_porcino"));%></option>

                                <%}%>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un ID </p>
                    </div>
                    <div class="formulario__grupo" id="grupo__nacidos_vivos">
                        <label for="nacidos_vivos" class="formulario__label">Nacidos Vivos</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="nacidos_vivos" id="nacidos_vivos" placeholder="Nacidos Vivos" required >
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Error message here</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__nacidos_muertos">
                        <label for="nacidos_muertos" class="formulario__label">Nacidos Muertos</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="nacidos_muertos" id="nacidos_muertos" placeholder="Nacidos Muertos" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error" >Por favor, ingrese una cantidad coherente con el numero de la camada </p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_destete">
                        <label for="fecha_destete" class="formulario__label">Fecha de Destete</label>
                        <div class="formulario__grupo-input">
                            <input type="date" class="formulario__input" name="fecha_destete" id="fecha_destete" placeholder="Fecha de Destete" required>
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Error message here</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__observacion">
                        <label for="observacion" class="formulario__label">Observación</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="observacion" id="observacion" placeholder="Observación" >
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Error message here</p>
                    </div>
                </div>
                <div class="formulario__mensaje" id="formulario__mensaje">
                    <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                </div>
                <div class="formulario__grupo formulario__grupo-btn-enviar"  >
                    <button type="submit" class="formulario__btn" onclick="ValidarNumerosDeVivosYMuertos()"> Enviar </button >             
                    <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                </div>
            </form>
        </div>

        <jsp:useBean id="ObjectoReproduccion" class="Modelo.Reproduccion" />
        <jsp:setProperty name="ObjectoReproduccion" property="*" /> 

        <%
            Boolean Estado = ObjectoReproduccion.ValidarInicio();
            if (Estado) {
                ObjectoReproduccion.InsertarReproduccion();
            }

        %>




        <script src="../javascript/ValidarFormularioReproduccion.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

    </body>
</html>


