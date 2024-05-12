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
 * @author 57314
 */
public class registro_alimento {
    private int id_alimento;
    private String  nombre_alimento;
    private int cantidad_alimento;
    private String observacion;

    public int getId_alimento() {
        return id_alimento;
    }

    public void setId_alimento(int id_alimento) {
        this.id_alimento = id_alimento;
    }



    public String getNombre_alimento() {
        return nombre_alimento;
    }

    public void setNombre_alimento(String nombre_alimento) {
        this.nombre_alimento = nombre_alimento;
    }

    public int getCantidad_alimento() {
        return cantidad_alimento;
    }

    public void setCantidad_alimento(int cantidad_alimento) {
        this.cantidad_alimento = cantidad_alimento;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }


    public void InsertarAlimento() throws SQLException {
    Conexion ObjConexion = new Conexion();
    try {
        ObjConexion.ConexionMySQL();
        String QueryInsertar = "INSERT INTO alimento (id_alimento, nombre_alimento, cantidad_alimento, observacion) VALUES('" + this.id_alimento + "','" + this.nombre_alimento + "','" + this.cantidad_alimento + "','" + this.observacion + "')";
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

public void EliminarAlimento(String id_alimento) {
    Conexion ObjConexion = new Conexion();
    try {
        ObjConexion.ConexionMySQL();
        String QueryEliminar = "DELETE FROM alimento WHERE id_alimento = '" + id_alimento + "'";
        ObjConexion.actualizar(QueryEliminar);
        ObjConexion.cerrar();
    } catch (Exception e) {
        System.out.println("Algo Fallo en la conexion" + e);
    }
}

public void UpdateAlimento() {
    Conexion ObjConexion = new Conexion();
    try {
        ObjConexion.ConexionMySQL();
        System.out.println(this.id_alimento);
 
        String QueryModificarAlimento = "UPDATE alimento SET nombre_alimento = '" + this.nombre_alimento + "', cantidad_alimento = '" + this.cantidad_alimento + "', observacion =  '" + this.observacion
                + "' WHERE id_alimento = '" + this.id_alimento + "'";
        ObjConexion.actualizar(QueryModificarAlimento);
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

public ResultSet ListadoAlimento() throws SQLException {
    Conexion Conectar = new Conexion();
    ResultSet Rs = null;
    try {
        Conectar.ConexionMySQL();
        String QueryConsulta = "SELECT * FROM alimento";
        Rs = Conectar.consultar(QueryConsulta);
    } catch (Exception e) {
        System.out.println("Ocurrio un error " + e);
    }
    return Rs;
}

public boolean ValidarInicio() {
    if (this.id_alimento == 0 && this.nombre_alimento == null && this.cantidad_alimento == 0 && this.observacion == null) {
        return false;
    } else {
        System.out.println("falso");
        return true;
    }
}

    
    
    
}
