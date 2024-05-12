/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Config;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

public class ControladorUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario_clave");
        String contrasena = request.getParameter("contrasena_clave");

        try {
            Conexion con = new Conexion();
            con.ConexionMySQL();

            // Utilizar una consulta preparada para evitar la inyección SQL
            String query = "SELECT * FROM usuarios WHERE usuario_clave=? AND contrasena_clave=?";
            ResultSet rs = con.consultarPreparado(query, usuario, contrasena);

            if (rs.next()) {
                int tipoDeRol = rs.getInt("tipo_rol");

                HttpSession sesion = request.getSession();
                sesion.setAttribute("user", rs.getString("usuario_clave"));

                if (tipoDeRol == 1) {
                    request.getRequestDispatcher("Inicio_Admin.jsp").forward(request, response);
                } else if (tipoDeRol == 2) {
                    request.getRequestDispatcher("Inicio_Usuario.jsp").forward(request, response);
                } else if (tipoDeRol == 3) {
                    request.getRequestDispatcher("Inicio_Admin_1.jsp").forward(request, response);
                }
            } else {

                response.sendRedirect("PaginaDeError.jsp");
            }

        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(ControladorUsuario.class.getName()).log(Level.SEVERE, null, ex);
            // Manejar la excepción según sea necesario
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
