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
public class Registro_lote {
    private String id_reproduccion;
    private int id_lote;
    private String raza;
    private String fecha_nacimiento;
    private String promedio_peso;
    private int cantidad_camada;
    private int id_corral;

    public Registro_lote() {
    }

    public int getId_lote() {
        return id_lote;
    }

    public void setId_lote(int id_lote) {
        this.id_lote = id_lote;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getPromedio_peso() {
        return promedio_peso;
    }

    public void setPromedio_peso(String promedio_peso) {
        this.promedio_peso = promedio_peso;
    }

    public int getCantidad_camada() {
        return cantidad_camada;
    }

    public void setCantidad_camada(int cantidad_camada) {
        this.cantidad_camada = cantidad_camada;
    }

    public int getId_corral() {
        return id_corral;
    }

    public void setId_corral(int id_corral) {
        this.id_corral = id_corral;
    }

    public void InsertarLote() {
        try {
            Conexion ObjConexion = new Conexion();
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "insert into lote values('" + this.id_reproduccion + "', "+ this.id_lote + "','" + this.raza + "', '" + this.fecha_nacimiento + "', '" + this.promedio_peso + "','" + this.cantidad_camada + "','"
                    + this.id_corral + "')";
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
    
    public void UpdateLote() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
             String QueryModificarLLave = "UPDATE corral_porcino  SET id_corral = '" + this.id_corral   + "' Where id_corral = ' " +  this.id_corral + " ' ";
            String QueryModificarUsuario = "UPDATE lote SET raza_lote = '" + this.raza + "', fecha_nacimiento =  '" + this.fecha_nacimiento + "', promedio_peso =  '" + this.promedio_peso
                    +  " ' , cantidad_camada =  '" + this.cantidad_camada  + " ',id_corral = '" + this.id_corral + "' WHERE id_lote = '" + this.id_lote + " ' ";
            ObjConexion.actualizar(QueryModificarUsuario);
            ObjConexion.actualizar(QueryModificarLLave);
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
     
     
     public void EliminarLote(String IdLote){
          Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  lote  where id_lote = '" + IdLote + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
     }

    public ResultSet ConsultaIDLote() throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select id_corral , id_corral from lote";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        } finally {
            Conectar.cerrar();
        }
        return Rs;
    }

    public boolean ValidarInicio() {
        if (this.id_lote == 0 && this.raza == null && this.fecha_nacimiento == null && this.promedio_peso == null && this.cantidad_camada == 0 && this.id_corral == 0) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }

    public ResultSet MostrarLote() throws SQLException {
        Conexion Conector = new Conexion();
        ResultSet Rs = null;
        try {
            Conector.ConexionMySQL();
            String QueryMostrar = "select * from lote";
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
