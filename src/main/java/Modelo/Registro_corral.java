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

public class Registro_corral {

    private int id_corral;
    private String nombre_corral;
    private int capacidad_corral;

    public Registro_corral() {
    }

    public int getId_corral() {
        return id_corral;
    }

    public void setId_corral(int id_corral) {
        this.id_corral = id_corral;
    }

    public String getNombre_corral() {
        return nombre_corral;
    }

    public void setNombre_corral(String nombre_corral) {
        this.nombre_corral = nombre_corral;
    }

    public int getCapacidad_corral() {
        return capacidad_corral;
    }

    public void setCapacidad_corral(int capacidad_corral) {
        this.capacidad_corral = capacidad_corral;
    }

    public void InsertarCorral() throws SQLException {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "insert into corral_porcino values('" + this.id_corral + "','" + this.nombre_corral + "','" + this.capacidad_corral + "')";
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
    
    public void UpdateCorral() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryModificarUsuario = "UPDATE corral_porcino SET nombre_corral = '" + this.nombre_corral + "', capacidad_corral =  '" + this.capacidad_corral +   " ' "
                    + "WHERE id_corral = '" + this.id_corral + "'";
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

    public void EliminarCorral(String IDcorral) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  corral_porcino  where id_corral = '" + IDcorral + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }
    

    public ResultSet ConsultaIDCorral() throws SQLException {
         Conexion Conectar = new Conexion();
          ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select * from corral_porcino";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }

public boolean ValidarInicio() {
        if(this.id_corral == 0 && this.nombre_corral == null && this.capacidad_corral == 0) {
            return false;
        } else {
            return true;
        }
    }    
    
}
