<%-- 
    Document   : ListadoDePorcinosPorLote
    Created on : 9/12/2023, 5:50:48 p. m.
    Author     : 57314
--%>

<%@page import="Config.Conexion"%>
<%@page import="java.sql.ResultSet"%>
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
    <body>

        <table id="tabla" class="table table-bordered order-table">
            <thead>
                <tr>
                    <th>ID Lote </th>
                    <th>ID Etapa </th>
                    <th>Cantidad Camada Nacida </th>
                    <th>Porcinos Fallecidos Del Lote</th>
                    <th>Cantidad Actual De Porcinos</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    Conexion ObjectoConexion = new Conexion();

                    ObjectoConexion.ConexionMySQL();

                    String QueryListadoPorLote = "SELECT l.* , m.*, COALESCE(SUM(m.cerdos_fallecidos), 0) AS total_cerdos_fallecidos, " +
                                 "(l.cantidad_camada - COALESCE(SUM(m.cerdos_fallecidos), 0)) AS nueva_cantidad_camada " +
                                 "FROM lote l " +
                                 "LEFT JOIN muertos m ON l.id_lote = m.id_lote " +
                                 "GROUP BY l.id_lote, l.cantidad_camada";

                    ResultSet Resultado = ObjectoConexion.consultar(QueryListadoPorLote);
                    while (Resultado.next()) {

                %>
                <tr>
                    
                    <td><%out.print(Resultado.getString("id_lote"));%></td>
                    <td><%out.print(Resultado.getString("m.id_etapa"));%></td>
                    <td><%out.print(Resultado.getString("cantidad_camada"));%></td>
                    <td><%out.print(Resultado.getString("total_cerdos_fallecidos"));%></td>
                    <td><%out.print(Resultado.getString("nueva_cantidad_camada"));%></td>

                    <% }%>
            </tbody>  
            <button> <a href="../Reportes/Reportes.jsp">Volver</a></button>
            <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    </body>
</html>
