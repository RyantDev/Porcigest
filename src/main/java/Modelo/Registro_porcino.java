/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Config.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 2499479
 */
public class Registro_porcino {

    private int id_porcino;
    private String genero_porcino;
    private String fecha_nacimiento_porcino;
    private int id_corral;

    public Registro_porcino() {
    }

    public int getId_porcino() {
        return id_porcino;
    }

    public void setId_porcino(int id_porcino) {
        this.id_porcino = id_porcino;
    }

    public String getGenero_porcino() {
        return genero_porcino;
    }

    public void setGenero_porcino(String genero_porcino) {
        this.genero_porcino = genero_porcino;
    }

    public String getFecha_nacimiento_porcino() {
        return fecha_nacimiento_porcino;
    }

    public void setFecha_nacimiento_porcino(String fecha_nacimiento_porcino) {
        this.fecha_nacimiento_porcino = fecha_nacimiento_porcino;
    }

    public int getId_corral() {
        return id_corral;
    }

    public void setId_corral(int id_corral) {
        this.id_corral = id_corral;
    }

    public void InsertarPorcino() {
        try {
            Conexion ObjConexion = new Conexion();
            ObjConexion.ConexionMySQL();

            String QueryInsertar = "insert into porcino values('" + this.id_porcino + "','" + this.genero_porcino + "', '" + this.id_corral + "','" + this.fecha_nacimiento_porcino + " ' )";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet LitadoPorcino() throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select *  from porcino";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

    public ResultSet LitadoPorcinoHembras() throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select *  from porcino where genero_porcino = 'Femenino'" ;
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

    public ResultSet LitadoPorcinoMachos() throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select *  from porcino where genero_porcino =  'Masculino'";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

    public void UpdatePorcinos() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryModificarUsuario = "UPDATE porcino SET genero_porcino = '" + this.genero_porcino + "', id_corral =  '" + this.id_corral + "', fecha_nacimiento_porcino =  '" + this.fecha_nacimiento_porcino
                    + "' WHERE id_porcino = '" + this.id_porcino + " ' ";
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

    public void EliminarUsuario(String IDPorci) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  porcino  where id_porcino = '" + IDPorci + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public boolean ValidarInicio() {
        if (this.id_porcino == 0 && this.genero_porcino == null && this.fecha_nacimiento_porcino == null && this.id_corral == 0) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }

    public ResultSet MostrarPorcinos() throws SQLException {
        Conexion Conector = new Conexion();
        ResultSet Rs = null;
        try {
            Conector.ConexionMySQL();
            String QueryMostrar = "select * from porcino";
            Rs = Conector.consultar(QueryMostrar);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_porcino.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_porcino.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_porcino.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_porcino.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Rs;
    }
}
