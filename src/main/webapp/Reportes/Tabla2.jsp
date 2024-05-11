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
        <title>JSP Page</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx-style/0.13.2/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.4/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.13/jspdf.plugin.autotable.min.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/modal-estilo.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    </head>
    <body>
        <div class="barra">
            <div class="export-buttons">
                <button id="btnexcell" onclick="exportToExcel('uno')" class="icon-button">
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
                    <th>ID Reproduccion</th>
                    <th>Numero Camada</th>
                    <th>Fecha Parto</th>
                    <th>Nacidos Vivos</th>
                    <th>Nacidos Muertos</th>
                    <th>Raza</th>
                    <th>Promedio Peso</th>
                </tr>
            </thead>
            <tbody>  
                <%
                    Conexion ObjectoConexion = new Conexion();
                    ObjectoConexion.ConexionMySQL();
                    String QueryListadoCerdasDisp = "SELECT * from reproduccion, lote WHERE  (reproduccion.id_padre = '" + request.getParameter("IDPorcino") + "' OR reproduccion.id_madre = '" + request.getParameter("IDPorcino") + "') AND reproduccion.id_reproduccion = lote.id_reproduccion;";
                    ResultSet Resultado = ObjectoConexion.consultar(QueryListadoCerdasDisp);
                    while (Resultado.next()) {
                %>
                <tr>
                    <td><%out.print(Resultado.getString("id_reproduccion"));%></td>
                    <td><%out.print(Resultado.getString("cantidad_camada"));%></td>
                    <td><%out.print(Resultado.getString("fecha_parto"));%></td>
                    <td><%out.print(Resultado.getString("nacidos_vivos"));%></td>
                    <td><%out.print(Resultado.getString("nacidos_muertos"));%></td>
                    <td><%out.print(Resultado.getString("raza_lote"));%></td>
                    <td><%out.print(Resultado.getString("promedio_peso"));%></td>
                </tr>
                <% }%>
            </tbody>
        </table>


        <button> <a href="../Reportes/Reportes.jsp">Volver</a></button>
        <script src="../javascript/ExportarImprimirPDF.js" type="text/javascript"></script>
    </body>
</html>
