<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx-style/0.13.2/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="barra">
            <div class="export-buttons">
                <button id="btnexcell" onclick="exportToExcel('cero')" class="icon-button">
                    <i class="fas fa-file-excel"></i> Exportar a Excel
                </button>

                <button  id="btnpdf" onclick="generatePDF()" class="icon-button">
                    <i class="fas fa-file-pdf"></i> Generar PDF
                </button>
            </div>
        </div>


        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>Semana </th>
                    <th>Fecha Inicial</th>
                    <th>Fecha  Final </th>
                    <th>Kilos de la semana </th>
                </tr>
            </thead>
            <tbody>  
                <%
                    Conexion ObjectoConexion = new Conexion();

                    ObjectoConexion.ConexionMySQL();
                    String QueryListadoCerdasDisp = "SELECT semana AS Seman, fecha_I As fechaI, fecha_F as fechaF,SUM(fecha_I) AS suma_kilos FROM alimentacion WHERE fecha_I BETWEEN Fecha_I AND Fecha_F GROUP BY semana;";
                    ResultSet Resultado = ObjectoConexion.consultar(QueryListadoCerdasDisp);
                    while (Resultado.next()) {
                %>
                <tr>
                    <td><%out.print(Resultado.getString("Seman"));%></td>
                    <td><%out.print(Resultado.getString("fechaI"));%></td>
                    <td><%out.print(Resultado.getString("fechaF"));%></td>
                    <td><%out.print(Resultado.getString("suma_kilos"));%></td>
                    <% }%>
            </tbody>  

            <button> <a href="../Reportes/Reportes.jsp">Volver</a></button>

            <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    </body>

