package Modelo;

import Config.Conexion;

import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class logeo_granja {

    private int cedula_usuario;
    private String nombre_usuario;
    private String correo_usuario;
    private String direccion_usuario;
    private String usuario_clave;
    private String contrasena_clave;
    private String tipo_rol;
    private String fecha_usuario;
    public static String Cedula;

    public logeo_granja() {
    }

    public int getCedula_usuario() {
        return cedula_usuario;
    }

    public void setCedula_usuario(int cedula_usuario) {
        this.cedula_usuario = cedula_usuario;
    }

    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }

    public String getCorreo_usuario() {
        return correo_usuario;
    }

    public void setCorreo_usuario(String correo_usuario) {
        this.correo_usuario = correo_usuario;
    }

    public String getDireccion_usuario() {
        return direccion_usuario;
    }

    public void setDireccion_usuario(String direccion_usuario) {
        this.direccion_usuario = direccion_usuario;
    }

    public String getFecha_usuario() {
        return fecha_usuario;
    }

    public void setFecha_usuario(String fecha_usuario) {
        this.fecha_usuario = fecha_usuario;
    }

    public String getUsuario_clave() {
        return usuario_clave;
    }

    public void setUsuario_clave(String usuario_clave) {
        this.usuario_clave = usuario_clave;
    }

    public String getContrasena_clave() {
        return contrasena_clave;
    }

    public void setContrasena_clave(String contrasena_clave) {
        this.contrasena_clave = contrasena_clave;
    }

    public String getTipo_rol() {
        return tipo_rol;
    }

    public void setTipo_rol(String tipo_rol) {
        this.tipo_rol = tipo_rol;
    }

    public boolean validarlogeo() {
        Conexion ObjConexion = new Conexion();

        int Contador;
        boolean EstadoValidar = true;
        try {
            ObjConexion.ConexionMySQL();
            String QueryConsultar = "select * from usuarios where usuario_clave = '" + this.usuario_clave + "' and contrasena_clave='" + this.contrasena_clave + "'";
            ResultSet RsC = ObjConexion.consultar(QueryConsultar);
            Contador = ObjConexion.contar(RsC);
            if (Contador == 0) {
                EstadoValidar = false;
            }
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
        return EstadoValidar;
    }

    public void insertarusuarioRol() {
        Conexion ObjConexion = new Conexion();
        int ValorTipo = 0;
        //      System.out.println(this.tipo_rol);
        try {
            ObjConexion.ConexionMySQL();
            System.out.println("Tipo Rol " + this.tipo_rol);
            if (this.tipo_rol.equals("Administrador")) {
                ValorTipo = 1;
            } else if (this.tipo_rol.equals("Empleado")) {
                ValorTipo = 2;
            }
            System.out.println(ValorTipo);
            String QueryInsertar = "insert into usuarios values('" + this.cedula_usuario + " ',' " + this.nombre_usuario + "', '" + this.correo_usuario + "', '" + this.direccion_usuario + "','" + this.usuario_clave + "','"
                    + this.contrasena_clave + "', '" + ValorTipo + "','" + this.fecha_usuario + "')";

            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion aaa" + e);
        }
    }

    public boolean UpdateUsuarios(String cedula) {
        Conexion ObjConexion = new Conexion();
        boolean Estado = false;
        int ValorTipoRol = 0;
        try {
            ObjConexion.ConexionMySQL();
            System.out.println("a " + this.tipo_rol);
            if (this.tipo_rol.equals("Administrador")) {
                ValorTipoRol = 1;
            } else if (this.tipo_rol.equals("Empleado")) {
                ValorTipoRol = 2;
            } else if (this.tipo_rol.equals("Super Admin")) {
                ValorTipoRol = 3;
            } else {
                ValorTipoRol = 2;
            }
            Estado = true;

            String QueryModificarUsuario = "UPDATE usuarios SET nombre_usuario = '" + this.nombre_usuario + "', correo_usuario =  '" + this.correo_usuario + "', direccion_usuario =  '" + this.direccion_usuario
                    + "', usuario_clave = '" + this.usuario_clave + "', contrasena_clave = '" + this.contrasena_clave + "', tipo_rol = '" + ValorTipoRol + "', fecha_usuario = '" + this.fecha_usuario + "' "
                    + "WHERE cedula_usuario = '" + this.cedula_usuario + "'";
            ObjConexion.actualizar(QueryModificarUsuario);
            ObjConexion.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(logeo_granja.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(logeo_granja.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(logeo_granja.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(logeo_granja.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Estado;
    }

    public ResultSet ListadoMegaAdmin() throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select *  from usuarios where cedula_usuario != 1004925521";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

    public ResultSet LitadoUsuariosAdmin() throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select * from usuarios where tipo_rol = 2";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

    public ResultSet ConsultarCorreo(String Correo) throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        System.out.println("Hola");
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select *  from usuarios where correo_usuario = '" + Correo + "'";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

    public void UpdateCambio() {
        Conexion ObjConexion = new Conexion();
        int ValorTipo = 0;
        try {
            ObjConexion.ConexionMySQL();
            System.out.println(ValorTipo);
            String QueryInsertar = "Update usuario set contrasena_clave = '" + this.contrasena_clave + "' where cedula_usuario = '" + this.cedula_usuario + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public boolean EliminarAdmin( String cedula) {
        Conexion ObjConexion = new Conexion();
        boolean Estado = false;

        try {
            ObjConexion.ConexionMySQL();
                // Compara la cédula del usuario actual con la cédula proporcionada
                if (Cedula.equals(cedula)) {
                    Estado = true;
                } else {
                    String QueryInsertar = "DELETE FROM usuarios WHERE cedula_usuario = '" + cedula + "'";
                    ObjConexion.actualizar(QueryInsertar);
                }
           
            ObjConexion.cerrar();

        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }

        return Estado;
    }

    public Boolean validarCambioContraseña() {
        boolean EstadoCambio = false;
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryVerificar = "select * from usuarios where cedula_usuario = '" + this.cedula_usuario + "' and usuario_clave = '" + this.contrasena_clave + "'";
            ResultSet RsBuscar = ObjConexion.consultar(QueryVerificar);
            if (RsBuscar.next()) {
                EstadoCambio = true;
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return EstadoCambio;
    }

    public String validarTipoRol() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryVerificar = "select * from usuarios where usuario_clave = '" + this.usuario_clave + "'";
            ResultSet RsBuscar = ObjConexion.consultar(QueryVerificar);
            while (RsBuscar.next()) {
                Cedula = RsBuscar.getString("cedula_usuario");
                System.out.println(RsBuscar.getString("correo_usuario"));
                if (RsBuscar.getInt("tipo_rol") == 1) {
                    return "Administrador";
                } else if (RsBuscar.getInt("tipo_rol") == 2) {
                    return "Empleado";
                } else if (RsBuscar.getInt("tipo_rol") == 3) {
                    return "SuperAdmin";
                }
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return "";
    }

    public boolean ValidarInicio() {
        if (this.cedula_usuario == 0 && this.nombre_usuario == null && this.correo_usuario == null && this.direccion_usuario == null && this.usuario_clave == null && this.tipo_rol == null && this.contrasena_clave == null && this.fecha_usuario == null) {
            return false;
        } else {
            return true;
        }
    }

    public boolean ValidarInicioContraseña() {
        if (this.usuario_clave.equals("") && this.contrasena_clave.equals("")) {
            return false;
        } else {
            return true;
        }
    }

}
