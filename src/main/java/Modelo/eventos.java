package Modelo;

import Config.Conexion;

import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

public class eventos {

    private String nombre_evento;
    private String descripcion_evento;
    private String fecha_evento;

    public eventos() {

    }

    public String getNombre_evento() {
        return nombre_evento;
    }

    public void setNombre_evento(String nombre_evento) {
        this.nombre_evento = nombre_evento;
    }

    public String getDescripcion_evento() {
        return descripcion_evento;
    }

    public void setDescripcion_evento(String descripcion_evento) {
        this.descripcion_evento = descripcion_evento;
    }

    public String getFecha_evento() {
        return fecha_evento;
    }

    public void setFecha_evento(String fecha_evento) {
        this.fecha_evento = fecha_evento;
    }

    public void insertarEvento() {
        Conexion ObjConexion = new Conexion();

        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "insert into eventos values('" + this.nombre_evento + "','" + this.descripcion_evento + "', '" + this.fecha_evento + "')";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public void EliminarEvento(String Nombre) {
        Conexion ObjConexion = new Conexion();
        try {
            String QueryInsertar = "DELETE  FROM  eventos where nombre_evento = '" + Nombre + "";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public void ModificarEvento() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryModificarUsuario = "UPDATE eventos SET descripcion_evento = '" + this.descripcion_evento + "',fecha_evento =  '" + this.fecha_evento + " ' "
                    + "WHERE nombre_evento = '" + this.nombre_evento + "'";
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
    }

    public boolean ValidarInicio() {
        if (this.nombre_evento == null && this.descripcion_evento == null && this.fecha_evento == null) {
            return false;
        } else {
            return true;
        }
    }

    public ResultSet listado_evento() throws SQLException {
        Conexion Con = new Conexion();
        ResultSet Rs = null;
        try {
            Con.ConexionMySQL();
            Rs = Con.consultar("select *  from eventos");

        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;

    }

}
