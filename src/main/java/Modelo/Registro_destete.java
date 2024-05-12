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
public class Registro_destete {
    private String id_destete;
    private int id_porcino;
    private String preparacion_destete;
    private String problema_salud;
    private String alimentacion;
    private String necesidad_nutricional;
  
    private String fecha_destete;

    public String getId_destete() {
        return id_destete;
    }

    public void setId_destete(String id_destete) {
        this.id_destete = id_destete;
    }

    public String getPreparacion_destete() {
        return preparacion_destete;
    }

    public void setPreparacion_destete(String preparacion_destete) {
        this.preparacion_destete = preparacion_destete;
    }

   
    public String getProblema_salud() {
        return problema_salud;
    }

    public void setProblema_salud(String problema_salud) {
        this.problema_salud = problema_salud;
    }

    public String getAlimentacion() {
        return alimentacion;
    }

    public void setAlimentacion(String alimentacion) {
        this.alimentacion = alimentacion;
    }

    public String getNecesidad_nutricional() {
        return necesidad_nutricional;
    }

    public void setNecesidad_nutricional(String necesidad_nutricional) {
        this.necesidad_nutricional = necesidad_nutricional;
    }


    public String getFecha_destete() {
        return fecha_destete;
    }

    public void setFecha_destete(String fecha_destete) {
        this.fecha_destete = fecha_destete;
    }

    public int getId_porcino() {
        return id_porcino;
    }

    public void setId_porcino(int id_porcino) {
        this.id_porcino = id_porcino;
    }
    
    
    public boolean ValidarInicio(){
        if(this.id_porcino == 0 && this.preparacion_destete == null && this.problema_salud == null && this.alimentacion == null && this.necesidad_nutricional== null && this.fecha_destete == null){
            return true;
        }else{
            return false;
        }
    }
    
    
    public void InsertarDestete() {
        try {
            Conexion Conectar = new Conexion();
            Conectar.ConexionMySQL();
            String QueryInsertar = "insert into destete (id_porcino, preparacion_destete, problema_salud, alimentacion, necesidad_nutricional, muertos, fecha_destete) values ('" + this.id_porcino + "', ' " + this.preparacion_destete + "', '" + this.problema_salud + " ', '" + this.alimentacion + "' , '" + necesidad_nutricional + "','" + fecha_destete + "')";
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
           String QueryInsertar = "UPDATE destete SET id_porcino='" + this.id_porcino + "', preparacion_destete='" + this.preparacion_destete + "', problemas_salud='" + this.problema_salud + "',alimentaacion='" + this.alimentacion
                   + "', necesidad_nutriconal='" + necesidad_nutricional + "',fecha_destete='" + fecha_destete
                   + "' WHERE id_destete='" + this.id_destete + "'";

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
            String QueryInsertar = "Delete from precebo where id_destete = '" + IDPrecio + "'";
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
            String QueryListado = "select * from destete";
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
