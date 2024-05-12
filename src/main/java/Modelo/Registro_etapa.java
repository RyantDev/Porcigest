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

public class Registro_etapa {

    private int id_etapa;
    private String nombre_etapa;
    private String descripcion_etapa;

    public Registro_etapa() {
    }

    public int getId_etapa() {
        return id_etapa;
    }

    public void setId_etapa(int id_etapa) {
        this.id_etapa = id_etapa;
    }

    public String getNombre_etapa() {
        return nombre_etapa;
    }

    public void setNombre_etapa(String nombre_etapa) {
        this.nombre_etapa = nombre_etapa;
    }

    public String getDescripcion_etapa() {
        return descripcion_etapa;
    }

    public void setDescripcion_etapa(String descripcion_etapa) {
        this.descripcion_etapa = descripcion_etapa;
    }

    public void InsertarEtapa() {
        Conexion ObjConexion = new Conexion();
        System.out.println("Llega Conexion");
        try {
            ObjConexion.ConexionMySQL();
            System.out.println(this.nombre_etapa);
            String QueryInsertar = "insert into etapa values('" + this.id_etapa + "','" + this.nombre_etapa + "', '" + this.descripcion_etapa + "')";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Error " + e);
        }
    }
    
    public void UpdateEtapa() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryModificarUsuario = "UPDATE etapa SET nombre_etapa  = '" + this.nombre_etapa + "', descripcion_etapa =  '" + this.descripcion_etapa + "'"
                    +  "' WHERE id_etapa = '" + this.id_etapa + " ' ";
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
     
     
     public void EliminarEtapa(String IDPorci){
          Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  etapa  where id_etapa = '" + IDPorci + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
     }
    

    public boolean ValidarInicio() {
        if (this.id_etapa == 0 && this.nombre_etapa == null && this.descripcion_etapa == null) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }
    
    
    
   
    public ResultSet MostrarEtapas() throws SQLException {
        Conexion Conector = new Conexion();
        ResultSet Rs = null;
        try {
            Conector.ConexionMySQL();
            String QueryMostrar = "select * from etapa";
            Rs = Conector.consultar(QueryMostrar);
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(Registro_porcino.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Rs;
    }
}
