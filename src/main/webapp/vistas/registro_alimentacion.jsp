<%-- 
    Document   : registro_alimentacion
    Created on : 23/10/2023, 8:10:12 p. m.
    Author     : 57314
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../css/register.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="container"  style="margin-top : 820px">
            <h2>Formulario de Registro de Alimentación</h2>
            <form action="" method="post" id="formulario" onsubmit=" return  MiFuncion()">  
                <div class="formulario">
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
                    <jsp:useBean id="ObjectoA" class="Modelo.registro_alimento" />
                    <jsp:setProperty name="ObjectoA" property="*" /> 
                    <div class="formulario__grupo" id="grupo__id_alimento">
                        <label for="id_alimento" class="formulario__label">Id Alimento</label>
                        <div class="formulario__grupo-input">
                            <select name="id_alimento" class="ComboRegistroUsuario" id="id_alimento" required>
                                <option selected > Seleccione</option>
                                <%
                                    ResultSet rs2 = ObjectoA.ListadoAlimento();
                                    while (rs2.next()) {
                                %>
                                <option><%out.print(rs2.getString("id_alimento"));%></option>

                                <%}%>
                            </select>
                            <i class="formulario__validacion-estado-combo fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Seleccione un ID </p>
                    </div>         
                    <div class="formulario__grupo" id="grupo__semana">
                        <label for="id" class="formulario__label">Semana</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="semana" id="semana" placeholder="Digite el número de la semana">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">La semana no puede ser mayor a 4.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__dia_1">
                        <label for="id" class="formulario__label">Dia 1</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="dia_1" id="dia_1" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__dia_2">
                        <label for="id" class="formulario__label">Dia 2</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="dia_2" id="dia_2" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__dia_3">
                        <label for="id" class="formulario__label">Dia 3</label>
                        <div class="formulario__grupo-input">
                            <input type="text" class="formulario__input" name="dia_3" id="dia_3" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__dia_4">
                        <label for="id" class="formulario__label">Dia 4</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="dia_4" id="dia_4" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__dia_5">
                        <label for="id" class="formulario__label">Dia 5</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="dia_5" id="dia_5" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__dia_6">
                        <label for="id" class="formulario__label">Dia 6</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="dia_6" id="dia_6" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__dia_7">
                        <label for="id" class="formulario__label">Dia 7</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="dia_7" id="dia_7" placeholder="Digite cantidad de alimentos en kilogramos de el día">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__promedio_semanal">
                        <label for="id" class="formulario__label">Promedio semanal</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="promedio_semanal" id="promedio_semanal" placeholder="Digite la cantidad de alimento en Kilogramos de la semana">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__promedio_diario">
                        <label for="id" class="formulario__label">Promedio Diario</label>
                        <div class="formulario__grupo-input">
                            <input type="numeric" class="formulario__input" name="promedio_diario" id="promedio_diario" placeholder="Digite la cantidad de alimento en Kilogramos de la semana">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Ingrese la cantidad de alimentos en kilogramos, no puede tener letras.</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_I">
                        <label for="id" class="formulario__label">Fecha Inicial</label>
                        <div class="formulario__grupo-input">
                            <input type="Date" class="formulario__input" name="fecha_I" id="fecha_I" placeholder="">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Diligencie una fecha</p>
                    </div>
                    <div class="formulario__grupo" id="grupo__fecha_F">
                        <label for="id" class="formulario__label">Fecha Final</label>
                        <div class="formulario__grupo-input">
                            <input type="Date" class="formulario__input" name="fecha_F" id="fecha_F" placeholder="">
                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                        </div>
                        <p class="formulario__input-error">Diligencie una fecha</p>
                    </div>
                    <div class="formulario__mensaje" id="formulario__mensaje">
                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                    </div>
                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                        <button type="submit" class="formulario__btn"> Enviar </button>             
                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                    </div>
                </div>
            </form>
        </div>
        <jsp:useBean id="ObjectoAlimentacion" class="Modelo.Registro_alimentacion" />
        <jsp:setProperty name="ObjectoAlimentacion" property="*" /> 
        <%
            System.out.println("Hola");
            boolean Estado = ObjectoAlimentacion.ValidarInicio();
            System.out.println(Estado);
            if (Estado) {
                ObjectoAlimentacion.InsertarAlimentacionCorral();
            }
        %>

        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
        <script src="../javascript/ValidarFormularioAlimentacion.js" type="text/javascript"></script>
    </body>
</html>
