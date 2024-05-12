package Config;

import Modelo.logeo_granja;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class seguridad extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        String usuario = request.getParameter("usuario_clave");
        String contrasena = request.getParameter("contrasena_clave");

        try {
            Conexion con = new Conexion();
            con.ConexionMySQL();

            String query = "SELECT * FROM usuarios WHERE usuario_clave=? AND contrasena_clave=?";

            ResultSet rs = con.consultarPreparado(query, usuario, contrasena);

            if (rs.next()) {

                String tipoDeRol = rs.getString("tipo_rol");

                HttpSession sesion = request.getSession();
                sesion.setAttribute("user", rs.getString("usuario_clave"));
                sesion.setAttribute("cedula_user", rs.getString("cedula_usuario"));
            

              

                switch (Integer.parseInt(tipoDeRol)) {
                    case 1:
                        request.getRequestDispatcher("Inicio_Admin.jsp").forward(request, response);
                        break;
                    case 2:
                        request.getRequestDispatcher("Inicio_Usuario.jsp").forward(request, response);
                        break;
                    case 3:
                        request.getRequestDispatcher("Inicio_Admin_1.jsp").forward(request, response);
                        break;
                    default:
                        break;
                }
            } else {
            
                
                
                
                     response.sendRedirect("/proyecto_final/vistas/errorpageuser.html");
            }

        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(seguridad.class.getName()).log(Level.SEVERE, null, ex);

        }
    }
}
