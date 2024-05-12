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
 * @author 57314
 */
public class Registro_precebo {
    private String id_precebo;
    private String id_lote;
    private String fecha_Inicio_P;
    private String cantidad_porcino;
    private String tipo_dieta;
    private String condicion_ambiental;
    private String salud_porcinos;

    public Registro_precebo() {
    }

    public String getId_precebo() {
        return id_precebo;
    }

    public void setId_precebo(String id_precebo) {
        this.id_precebo = id_precebo;
    }
    
    public String getId_lote() {
        return id_lote;
    }

    public void setId_lote(String id_lote) {
        this.id_lote = id_lote;
    }

    public String getFecha_Inicio_P() {
        return fecha_Inicio_P;
    }

    public void setFecha_Inicio_P(String fecha_Inicio_P) {
        this.fecha_Inicio_P = fecha_Inicio_P;
    }

    

    public String getCantidad_porcino() {
        return cantidad_porcino;
    }

    public void setCantidad_porcino(String cantidad_porcino) {
        this.cantidad_porcino = cantidad_porcino;
    }

    public String getTipo_dieta() {
        return tipo_dieta;
    }

    public void setTipo_dieta(String tipo_dieta) {
        this.tipo_dieta = tipo_dieta;
    }

    public String getCondicion_ambiental() {
        return condicion_ambiental;
    }

    public void setCondicion_ambiental(String condicion_ambiental) {
        this.condicion_ambiental = condicion_ambiental;
    }

  
    public String getSalud_porcinos() {
        return salud_porcinos;
    }

    public void setSalud_porcinos(String salud_porcinos) {
        this.salud_porcinos = salud_porcinos;
    }
    
    public boolean ValidarInicio() {
        if (this.id_lote == "" && this.fecha_Inicio_P == null && this.cantidad_porcino == ""  && this.tipo_dieta == "" && this.condicion_ambiental == ""  && this.salud_porcinos == "") {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }
    

    public void InsertarPrecebo() {
        try {
            Conexion Conectar = new Conexion();
            Conectar.ConexionMySQL();
            System.out.println("Metodo Insertar Precebo");
            String QueryInsertar = "insert into precebo (id_lote, fecha_inicio_P, cantidad_porcino, tipo_dieta, condicion_ambiental, salud_porcinos) values ('" + this.id_lote + "', ' " + this.fecha_Inicio_P + "', '" + this.cantidad_porcino + " ', '" + this.tipo_dieta + "' , '" + condicion_ambiental + "','" + salud_porcinos + "')";
            Conectar.actualizar(QueryInsertar);
            Conectar.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void UpdatePrecebo() {
        try {
            Conexion Conectar = new Conexion();
            Conectar.ConexionMySQL();
            System.out.println("A" + this.id_lote + "Id PRECEBO" + this.id_precebo);
           String QueryInsertar = "UPDATE precebo SET id_lote='" + this.id_lote + "', fecha_inicio_P='" + this.fecha_Inicio_P + "', cantidad_porcino='" + this.cantidad_porcino + "', tipo_dieta='" + this.tipo_dieta + "', condicion_ambiental='" + condicion_ambiental + "', salud_porcinos='" + salud_porcinos + "' WHERE id_precebo='" + this.id_precebo + "'";

            Conectar.actualizar(QueryInsertar);
            Conectar.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
       public void EliminarPrecebo(String IDPrecio) {
        try {
            Conexion Conectar = new Conexion();
            Conectar.ConexionMySQL();
            String QueryInsertar = "Delete  from precebo where id_precebo = '" + IDPrecio + "'";
            Conectar.actualizar(QueryInsertar);
            Conectar.cerrar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
   
    public ResultSet ListadoPrecebo() {
        ResultSet Rs = null;
        try {
            Conexion Conectar = new Conexion();
            Conectar.ConexionMySQL();
            String QueryListado = "select * from precebo ";
            Rs = Conectar.consultar(QueryListado);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(Registro_precebo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Rs;
    }

}
