<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
                      <meta http-equiv="Cache-Control" content="no-store" />
        <%
            HttpSession sessions = request.getSession(false);
            if (sessions == null || session.getAttribute("user") == null) {
                response.sendRedirect(request.getContextPath() + "/proyecto_final/vistas/login.jsp");
            }

        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/Inicio_Admin.css">
        <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>
    </head>

    <!DOCTYPE html>
    <body id="body">
        <header>
            <div class="icon__menu">
                <i class="fas fa-bars" id="btn_open"></i>
            </div>
        </header>
        <div class="menu__side" id="menu_side">
                 <div class="name__page">
                <i class="fa-solid fa-user eli"></i>
                <a onclick="changeTab(16)">Mi Sesion</a>
            </div>
            <div class="options__menu">

                <a href="#" id="0" class="eli" onclick="detectar(id)">
                    <div class="option" id="selecc">
                        <i class="fas fa-home"  title="Inicio"></i>
                        <h4>Inicio</h4>
                    </div>
                </a>
                <a href="#" id="1" class="eli" onclick="detectar(id)">
                    <div class="option" id="0">
                        <i class="fa-solid fa-list-check"></i>
                        <h4>Gestion</h4>
                    </div>
                </a>
                <a href="#" id="2" class="eli" onclick="detectar(id)">
                    <div class="option" id="1">
                        <i class="far fa-file" title="Cursos"></i>
                        <h4>Informes</h4>
                    </div>
                </a>

                <a href="#" id="3" class="eli" onclick="detectar(id)">
                    <div class="option" id="2">
                        <i class="fa-solid fa-bowl-food"></i>
                        <h4>Alimento</h4>
                    </div>
                </a>
                <a href="#" id="4"  class="eli" onclick="detectar(id)">
                    <div class="option" id="selecc">
                        <i class="fa-solid fa-draw-polygon"></i>
                        <h4>Graficos</h4>
                    </div>
                </a>
                <a href="#" id="5" class="eli" onclick="detectar(id)">
                    <div class="option" id="selecc">
                        <i class="far fa-address-card"  id="opcion5" title="Reportes"></i>
                        <h4>Reportes</h4>
                    </div>
                </a>
            <div class="option">
                    <i class="fa-solid fa-lock"></i>
                    <a href="cerrar_sesion.jsp">Cerrar Sesión</a>
                </div>
            </div>
            </div>
        </div>
        <div class="pestanas">
            <div class="tabs" id="tab0">
                <button class="tab-button" onclick="changeTab(0)">Inicio</button>
                <button class="tab-button" onclick="changeTab(1)">Eventos</button>
                <button class="tab-button" onclick="changeTab(2)">Cambiar Clave</button>
            </div>
            <div class="tabs" id="tab1">
                <button class="tab-button" onclick="changeTab(3)">Porcinos</button>
                <button class="tab-button" onclick="changeTab(4)">Lotes</button>
                <button class="tab-button" onclick="changeTab(5)">Corral</button>
                <button class="tab-button" onclick="changeTab(6)">Porcinos Muertos</button>
            </div>
            <div class="tabs" id="tab2">
                <button class="tab-button" onclick="changeTab(7)">Reproduccion</button>
                <button class="tab-button" onclick="changeTab(8)">Etapa Porcino</button>
            </div>
            <div class="tabs" id="tab3">
                <button class="tab-button" onclick="changeTab(9)">Alimentacion</button>
                <button class="tab-button" onclick="changeTab(10)">Crear Alimento</button>
            </div>
            <div class="tabs" id="tab4">
                <button class="tab-button" onclick="changeTab(11)"> Grafico porcino</button>
                <button class="tab-button" onclick="changeTab(12)">Graficos otro</button>
                <button class="tab-button" onclick="changeTab(13)">opciones4</button>
            </div>
            <div class="tabs" id="tab5">
                <button class="tab-button" onclick="changeTab(14)">Reportes</button>
            </div>
        </div>
        <div class="contenidos">
            <div id="tabContent1" class="tab-content">
                <p>Contenido de Inicio0</p>
            </div>

            <div id="tabContent2" class="tab-content">
                <iframe src="../Listados/Tabla_Eventos.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>

            <div id="tabContent3" class="tab-content">

                <iframe src="../vistas/Cambiar_contraseña.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>


            <div id="tabContent2" class="tab-content">
                <iframe src="../Listados/Tabla_porcinos.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>
            <div id="tabContent3" class="tab-content">

                <iframe src="../Listados/Tabla_Lote.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>

            <div id="tabContent4" class="tab-content">
                <iframe src="../Listados/Tabla_corral.jsp" width="250px" height="250px" frameborder="1"></iframe>

            </div>

            <div id="tabContent5" class="tab-content">
                <iframe src="../Listados/Tabla_muertos.jsp" width="250px" height="250px" frameborder="1"></iframe>

            </div>


            <div id="tabContent1" class="tab-content">
                <iframe src="../Listados/Tabla_Reproducion.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>

            <div id="tabContent2" class="tab-content">
                <iframe src="../Listados/Tabla_Etapa_Porcino.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>




            <div id="tabContent1" class="tab-content">
                <iframe src="../Listados/Tabla_alimentacion.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>
            <div id="tabContent2" class="tab-content">
                <p>Contenido de Gestionar Usuario3</p>
            </div>


            <div id="tabContent1" class="tab-content">
                <iframe src="../vistas/grafico_porcino.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>
            <div id="tabContent2" class="tab-content">
                <iframe src="../vistas/grafico_otros.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>
            <div id="tabContent3" class="tab-content">
                <p>Contenido de opciones4</p>
            </div>

            <div id="tabContent1" class="tab-content">
                <iframe src="../Reportes/Reportes.jsp" width="250px" height="250px" frameborder="1"></iframe>
            </div>

        </div>   
        <script src="../javascript/Inicio_Admin.js"></script>
    </body>
</html>


