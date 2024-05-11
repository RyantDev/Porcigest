
<%@page import="java.sql.ResultSet"%>
<%@page import="Config.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/EstilosDeListados.css" rel="stylesheet" type="text/css"/>
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
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
                <button id="btnexcell" onclick="exportToExcel('tres')" class="icon-button">
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
                    <th>ID Corral </th>
                    <th>Nombre</th>
                    <th>Capacidad</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    Conexion ObjectoConexion = new Conexion();

                    ObjectoConexion.ConexionMySQL();
                    String QueryListadoCerdasDisp = "SELECT corral_porcino.* FROM  corral_porcino LEFT JOIN lote ON corral_porcino.id_corral = lote.id_corral WHERE lote.id_corral IS NULL;";
                    ResultSet Resultado = ObjectoConexion.consultar(QueryListadoCerdasDisp);
                    while (Resultado.next()) {

                %>
                <tr>
                    <td><%out.print(Resultado.getString("corral_porcino.id_corral"));%></td>
                    <td><%out.print(Resultado.getString("corral_porcino.nombre_corral"));%></td>
                    <td><%out.print(Resultado.getString("corral_porcino.capacidad_corral"));%></td>
                    <% }%>
            </tbody>  



            <button> <a href="../Reportes/Reportes.jsp">Volver</a></button>
                   <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    </body>
