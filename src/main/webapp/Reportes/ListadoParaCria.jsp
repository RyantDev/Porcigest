<%-- 
    Document   : Tabla1
    Created on : 2/12/2023, 11:11:39 p. m.
    Author     : 57314
--%>

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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
       
        <title>JSP Page</title>
    </head>
    
    
    <div class="barra">
            <div class="export-buttons">
                <button id="btnexcell" onclick="exportToExcel('dos')" class="icon-button">
                    <i class="fas fa-file-excel"></i> Exportar a Excel
                </button>

                <button  id="btnpdf" onclick="generatePDF()" class="icon-button">
                    <i class="fas fa-file-pdf"></i> Generar PDF
                </button>
            </div>
        </div>
    <body>

        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>ID Porcino </th>
                    <th>ID Corral</th>
                    <th>Fecha De Nacimiento </th>
                    <th>Ultima Fecha de Parto</th>
                    <th>Cantidad de Porcinos de ultima vez</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    Conexion ObjectoConexion = new Conexion();

                    ObjectoConexion.ConexionMySQL();
                    String QueryListadoCerdasDisp = "SELECT * FROM porcino, reproduccion where porcino.id_porcino =  reproduccion.id_madre AND porcino.genero_porcino = 'Femenino' AND  fecha_parto  < fecha_parto + INTERVAL 5 DAY AND fecha_parto  + INTERVAL 5 DAY  <= CURRENT_DATE";
                    ResultSet Resultado = ObjectoConexion.consultar(QueryListadoCerdasDisp);
                    while (Resultado.next()) {

                %>
                <tr>
                    <td><%out.print(Resultado.getString("porcino.Id_porcino"));%></td>
                    <td><%out.print(Resultado.getString("porcino.id_corral"));%></td>
                    <td><%out.print(Resultado.getDate("porcino.fecha_nacimiento_porcino"));%></td>
                    <td><%out.print(Resultado.getDate("reproduccion.fecha_parto"));%></td>
                    <td><%out.print(Resultado.getString("reproduccion.numero_camada"));%></td>

                    <% }%>
            </tbody>  
            
            
            <button> <a href="../Reportes/Reportes.jsp">Volver</a></button>
                   <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    </body>
</html>
