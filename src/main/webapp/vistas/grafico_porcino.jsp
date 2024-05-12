<%@page import="Config.Conexion"%>
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
        <jsp:useBean id="ObjetoPorcino" class="Modelo.Registro_porcino" />
        <jsp:setProperty name="ObjetoPorcino" property="*" />


        <jsp:useBean id="ObjetoLote" class="Modelo.Registro_lote" />
        <jsp:setProperty name="ObjetoLote" property="*" />

        <jsp:useBean id="Objetoetapas" class="Modelo.Registro_etapa" />
        <jsp:setProperty name="Objetoetapas" property="*" />


        <jsp:useBean id="ObjetoReproduccion" class="Modelo.Reproduccion" />
        <jsp:setProperty name="ObjetoReproduccion" property="*" />

        <jsp:useBean id="ObjetoMuertos" class="Modelo.Registro_muertos" />
        <jsp:setProperty name="ObjetoMuertos" property="*"/>


        <canvas id="miGrafico" style="max-width: 700px; max-height: 700px;"></canvas>



        <%
            int reproduccionC = 0;
            int deste = 0;
            int precebo = 0;
            int cebo = 0;

          
            Conexion Conectar = new Conexion();

            Conectar.ConexionMySQL();
             String QueryUnir = "SELECT etapa_porcino.id_etapa from lote , etapa_porcino Where lote.id_lote = etapa_porcino.id_lote ";
            try {
                ResultSet ResulSetResultadoUnir = Conectar.consultar(QueryUnir);
                while (ResulSetResultadoUnir.next()) {
                    if (ResulSetResultadoUnir.getInt("id_etapa") == 0) {
                        reproduccionC++;
                    } else if (ResulSetResultadoUnir.getInt("id_etapa") == 1) {
                        deste++;
                    } else if (ResulSetResultadoUnir.getInt("id_etapa") == 2) {
                        precebo++;
                    } else if (ResulSetResultadoUnir.getInt("id_etapa") == 3) {
                        cebo++;
                    }
                }
            } catch (Exception e) {
                System.out.println("Error");
            }
           System.out.println(precebo);

        %>



        <%            int porcinos = 0;
            int reproduccion = 0;
            int muertos = 0;

            ResultSet Resultado = ObjetoPorcino.LitadoPorcino();

            while (Resultado.next()) {
                porcinos++;
            }
            ResultSet Resultador = ObjetoPorcino.LitadoPorcino();

            while (Resultado.next()) {
                reproduccion++;
            }

            ResultSet Resultadom = ObjetoMuertos.LitadoMuertos();

            while (Resultadom.next()) {
                muertos++;
            }


        %>

        <script>
            // Obténgo el contexto delcanvas
            var ctx = document.getElementById('miGrafico').getContext('2d');


            //aqui configuro los datos del gráfico
            var data = {
                labels: ['Porcinos', 'lotes en etapa reproduccion', 'lotes en etapa deste', 'lotes en etapa precebo', 'lotes en etapa cebo'],
                datasets: [{
                        data: [<%=porcinos%>,<%=reproduccionC%>,<%=deste%>,<%=precebo%>,<%=cebo%>],

                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(112, 45, 189, 0.8)',
                            'rgba(27, 198, 176, 0.6)'

                        ],

                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(112, 45, 189, 0.8)',
                            'rgba(27, 198, 176, 0.6)'
                            
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
