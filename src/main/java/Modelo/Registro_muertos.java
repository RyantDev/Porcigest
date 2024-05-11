/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Config.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 2499479
 */
public class Registro_muertos {

    private int id_muerto;
    private int id_lote;
    private int id_etapa;
    private String fecha_muerte;
    private String descripcion_muerte;

    public Registro_muertos() {
    }

    public int getId_lote() {
        return id_lote;
    }

    public void setId_lote(int id_lote) {
        this.id_lote = id_lote;
    }

    public String getFecha_muerte() {
        return fecha_muerte;
    }

    public void setFecha_muerte(String fecha_muerte) {
        this.fecha_muerte = fecha_muerte;
    }

    public int getId_etapa() {
        return id_etapa;
    }

    public void setId_etapa(int id_etapa) {
        this.id_etapa = id_etapa;
    }

    public String getDescripcion_muerte() {
        return descripcion_muerte;
    }

    public void setDescripcion_muerte(String descripcion_muerte) {
        this.descripcion_muerte = descripcion_muerte;
    }

    public int getId_muerto() {
        return id_muerto;
    }

    public void setId_muerto(int id_muerto) {
        this.id_muerto = id_muerto;
    }
    
    
    
    public void InsertarMuertos() throws SQLException {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "insert into muertos (id_lote, id_etapa, fecha_muerte, descripcion_muerte) values('" + this.id_lote + "','" + this.id_etapa + "','" + this.fecha_muerte + " ' , '" + this.descripcion_muerte + "')";
            ObjConexion.actualizar(QueryInsertar);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ObjConexion.cerrar();
        }
    }
    
      public void EliminarMuertos(String ID) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  muertos  where id_muerto = '" + ID + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public void UpdateMuertos() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            System.out.println(this.id_muerto);
            System.out.println("Holaa ID lOTE " + this.id_lote);
            String QueryModificarUsuario = "UPDATE muertos SET id_lote = '" + id_lote + "',id_etapa =  ' " + this.id_etapa + " ', fecha_muerte =  '" + this.fecha_muerte + "', descripcion_muerte =  '" + this.descripcion_muerte
                    + "' WHERE id_muerto= '" + this.id_muerto + " ' ";
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
    
    
    
    

    public ResultSet LitadoMuertos() throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select *  from muertos";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

    public boolean ValidarInicio() {
        if (this.id_lote == 0 && this.fecha_muerte == null && this.id_etapa == 0 && this.descripcion_muerte == null) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }
}
