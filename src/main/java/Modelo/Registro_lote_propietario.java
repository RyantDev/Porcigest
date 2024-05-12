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
public class Registro_lote_propietario {

    private int id_lote;
    private int id_corral;
    private int cedula_propietario;

    public Registro_lote_propietario() {
    }

    public int getId_lote() {
        return id_lote;
    }

    public void setId_lote(int id_lote) {
        this.id_lote = id_lote;
    }

    public int getId_corral() {
        return id_corral;
    }

    public void setId_corral(int id_corral) {
        this.id_corral = id_corral;
    }

    public int getCedula_propietario() {
        return cedula_propietario;
    }

    public void setCedula_propietario(int cedula_propietario) {
        this.cedula_propietario = cedula_propietario;
    }

    public void InsertarLotePropieratio() {
        try {
            Conexion ObjConexion = new Conexion();
            ObjConexion.ConexionMySQL();
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "insert into lote_propietario values('" + this.id_lote + "','" + this.id_corral + "', '" + this.cedula_propietario + "')";
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

    public ResultSet ListadoPropietarioXLote () throws SQLException {
        Conexion Conectar = new Conexion();
        ResultSet Rs = null;
        try {
            Conectar.ConexionMySQL();
            String QueryConsulta = "select * from lote_propietario";
            Rs = Conectar.consultar(QueryConsulta);
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }
    

    public boolean ValidarInicio() {
        if (this.id_lote == 0 && this.id_corral == 0 && this.cedula_propietario == 0) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }

}
