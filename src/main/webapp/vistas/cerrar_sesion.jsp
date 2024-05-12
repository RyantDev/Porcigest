<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page session="true" %>



<!DOCTYPE html>
<html>
    <head><meta http-equiv="Cache-Control" content="no-store" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%

            HttpSession sessione = request.getSession(false);
            if (sessione != null) {
                sessione.invalidate();
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);

                response.sendRedirect(request.getContextPath() + "/index.jsp");
            }


        %>     
            <script type="text/javascript">  
window.location.replace("/proyecto_final/index.jsp");
        </script>
 
    </body>
</html>
