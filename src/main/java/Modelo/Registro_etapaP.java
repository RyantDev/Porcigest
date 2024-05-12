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
public class Registro_etapaP {
   private String id_etapa_porcino;
    private int id_etapa;
    private int id_lote;
    private String  fecha_inicial;
    private String fecha_final;
    private double peso_inicial;
    private double peso_final;
    private String estado;

    public Registro_etapaP() {
    }

    public int getId_etapa() {
        return id_etapa;
    }

    public void setId_etapa(int id_etapa) {
        this.id_etapa = id_etapa;
    }

    public int getId_lote() {
        return id_lote;
    }

    public void setId_lote(int id_lote) {
        this.id_lote = id_lote;
    }

    public String getFecha_inicial() {
        return fecha_inicial;
    }

    public void setFecha_inicial(String fecha_inicial) {
        this.fecha_inicial = fecha_inicial;
    }

    public String getFecha_final() {
        return fecha_final;
    }

    public void setFecha_final(String fecha_final) {
        this.fecha_final = fecha_final;
    }

    public String getId_etapa_porcino() {
        return id_etapa_porcino;
    }

    public void setId_etapa_porcino(String id_etapa_porcino) {
        this.id_etapa_porcino = id_etapa_porcino;
    }
    
    

    public double getPeso_inicial() {
        return peso_inicial;
    }

    public void setPeso_inicial(double peso_inicial) {
        this.peso_inicial = peso_inicial;
    }

    public double getPeso_final() {
        return peso_final;
    }

    public void setPeso_final(double peso_final) {
        this.peso_final = peso_final;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void InsertarEtapaPorcino() throws SQLException {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "insert into etapa_porcino values('" + this.id_etapa + "','" + this.id_lote + "', '" + this.fecha_inicial + "', '" + this.fecha_final + "', '" + this.peso_inicial + "', '" + this.peso_final + "', '" + this.estado + "')";
            ObjConexion.actualizar(QueryInsertar);
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(Registro_lote.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            ObjConexion.cerrar();
        }
    }

    public void EliminarEtapa_Porcino(String ID) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  etapa-porcino  where id_etapa_porcino = '" + ID + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public void UpdateEtapa_Porcino() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryModificarUsuario = "UPDATE etapa_porcino SET id_etapa = '" + this.id_etapa + " ',fecha_inicial= '" + this.fecha_inicial + "',fecha_final= '" + this.fecha_final + "', peso_inicial = '" + this.peso_inicial
                    + "', peso_final = '" + this.peso_final
                    + "', estado = '" + this.estado
                    + "' WHERE id_etapa_porcino = '" + id_etapa_porcino + "'";
            ObjConexion.actualizar(QueryModificarUsuario);
            ObjConexion.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_etapaP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_etapaP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_etapaP.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_etapaP.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet MostrarEtapa() throws SQLException {
        Conexion Conector = new Conexion();
        ResultSet Rs = null;
        try {
            Conector.ConexionMySQL();
            String QueryMostrar = "select * from etapa_porcino";
            Rs = Conector.consultar(QueryMostrar);
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(Registro_etapaP.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Rs;

    }
    
    
     
    

    public boolean ValidarInicio() {
        if (this.id_etapa == 0 && this.id_lote == 0 && this.fecha_inicial == null && this.fecha_final == null && this.peso_inicial == 0 && this.peso_final == 0 && this.estado == null) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }

}
