<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <link href="../css/grafico.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:useBean id="Objetocorral" class="Modelo.Registro_corral" />
        <jsp:setProperty name="Objetocorral" property="*" />

        <jsp:useBean id="Objetolote" class="Modelo.Registro_lote"/>
        <jsp:setProperty name="Objetolote" property="*" />

        <jsp:useBean id="Objetousuario" class="Modelo.logeo_granja"/>
        <jsp:setProperty name="Objetousuario" property="*"/>


        <canvas id="miGrafico" style="max-width: 700px; max-height: 700px;"></canvas>



        <%
            int corral = 0;
            int lote = 0;
            int usuario = 0;

            ResultSet Resultado = Objetocorral.ConsultaIDCorral();
            while (Resultado.next()) {
                corral++;
            }

            ResultSet Resultador = Objetolote.MostrarLote();
            while (Resultador.next()) {
                lote++;
            }

            ResultSet Resultadod = Objetousuario.ListadoMegaAdmin();
            while (Resultadod.next()) {
                usuario++;
            }


        %>

        <script>
            // Obténgo el contexto delcanvas
            var ctx = document.getElementById('miGrafico').getContext('2d');


            //aqui configuro los datos del gráfico
            var data = {
                labels: ['corrales', 'lotes', 'usuarios'],
                datasets: [{
                        data: [<%=corral%>,<%=lote%>,<%=usuario%>],

                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)'
                        ],

                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)'
                        ],

                        borderWidth: 1
                    }]
            };

            // Configurar las opciones del gráfico

            var options = {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                }
            };


            // Creo el gráfico de rosquilla
            var myDoughnutChart = new Chart(ctx, {
                type: 'doughnut',
                data: data,
                options: options // Corrige aquí, la coma estaba fuera del objeto options
            });
        </script>

        <script src="../javascript/grafico_porcino.js" type="text/javascript"></script>
    </body>
</html>
