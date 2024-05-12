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
public class Registro_alimentacion {

    private String id_alimentacion;
    private int id_alimento;
    private int id_lote;
    private String semana;
    private String dia_1;
    private String dia_2;
    private String dia_3;
    private String dia_4;
    private String dia_5;
    private String dia_6;
    private String dia_7;
    private String fecha_I;

    public int getId_alimento() {
        return id_alimento;
    }

    public void setId_alimento(int id_alimento) {
        this.id_alimento = id_alimento;
    }

    public String getDia_1() {
        return dia_1;
    }

    public void setDia_1(String dia_1) {
        this.dia_1 = dia_1;
    }

    public String getDia_2() {
        return dia_2;
    }

    public void setDia_2(String dia_2) {
        this.dia_2 = dia_2;
    }

    public String getDia_3() {
        return dia_3;
    }

    public void setDia_3(String dia_3) {
        this.dia_3 = dia_3;
    }

    public String getDia_4() {
        return dia_4;
    }

    public void setDia_4(String dia_4) {
        this.dia_4 = dia_4;
    }

    public String getDia_5() {
        return dia_5;
    }

    public void setDia_5(String dia_5) {
        this.dia_5 = dia_5;
    }

    public String getDia_6() {
        return dia_6;
    }

    public void setDia_6(String dia_6) {
        this.dia_6 = dia_6;
    }

    public String getDia_7() {
        return dia_7;
    }

    public void setDia_7(String dia_7) {
        this.dia_7 = dia_7;
    }

    public String getFecha_I() {
        return fecha_I;
    }

    public void setFecha_I(String fecha_I) {
        this.fecha_I = fecha_I;
    }
    private String fecha_F;
    private String promedio_semanal;
    private String promedio_diario;

    public Registro_alimentacion() {

    }

    public int getId_lote() {
        return id_lote;
    }

    public void setId_lote(int id_lote) {
        this.id_lote = id_lote;
    }

    public String getSemana() {
        return semana;
    }

    public void setSemana(String semana) {
        this.semana = semana;
    }

    public String getFecha_F() {
        return fecha_F;
    }

    public void setFecha_F(String fecha_F) {
        this.fecha_F = fecha_F;
    }

    public String getPromedio_semanal() {
        return promedio_semanal;
    }

    public void setPromedio_semanal(String promedio_semanal) {
        this.promedio_semanal = promedio_semanal;
    }

    public String getPromedio_diario() {
        return promedio_diario;
    }

    public void setPromedio_diario(String promedio_diario) {
        this.promedio_diario = promedio_diario;
    }

    public String getId_alimentacion() {
        return id_alimentacion;
    }

    public void setId_alimentacion(String id_alimentacion) {
        this.id_alimentacion = id_alimentacion;
    }

    public void InsertarAlimentacionCorral() throws SQLException {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "INSERT INTO alimentacion (id_lote, id_alimento, semana, dia_1, dia_2, dia_3, dia_4, dia_5, dia_6, dia_7, fecha_I, fecha_F, promedio_semanal, promedio_diario) VALUES ( ' " + this.id_lote + " ' , ' " + id_alimento + " ' , '" + this.semana + "', '" + this.dia_1 + "', '" + this.dia_2 + "', '" + this.dia_3 + "', '" + this.dia_4 + "', '" + this.dia_5 + "', '" + this.dia_6 + "', '" + this.dia_7 + "', '" + this.fecha_I + "', '" + this.fecha_F + "', '" + this.promedio_semanal + "', '" + this.promedio_diario + "')";

            int suma = Integer.parseInt(this.dia_1)
                    + Integer.parseInt(this.dia_2)
                    + Integer.parseInt(this.dia_3)
                    + Integer.parseInt(this.dia_4)
                    + Integer.parseInt(this.dia_5)
                    + Integer.parseInt(this.dia_6)
                    + Integer.parseInt(this.dia_7);
           String queryUpdateAlimento = "UPDATE alimento SET cantidad_alimento = cantidad_alimento - " + suma + " WHERE id_alimento = '" + this.id_alimento + " ' ";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.actualizar(queryUpdateAlimento);
            ObjConexion.cerrar();
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

    public ResultSet MostrarAlimentacion() throws SQLException {
        Conexion Conector = new Conexion();
        ResultSet Rs = null;
        try {
            Conector.ConexionMySQL();
            String QueryMostrar = "select * from alimentacion";
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

    public void UpdateAlimentacion() {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            System.out.println(this.id_alimentacion);
            String QueryModificarUsuario = "UPDATE alimentacion SET id_lote = '" + this.id_lote + "', semana = '" + this.semana + "', dia_1 = '" + this.dia_1
                    + "', dia_2 = '" + this.dia_2 + "', dia_3 = '" + this.dia_3
                    + "', dia_4 = '" + this.dia_4 + "', dia_5 = '" + this.dia_5
                    + "', dia_6 = '" + this.dia_6 + "', dia_7 = '" + this.dia_7
                    + "', fecha_I = '" + this.fecha_I + "', fecha_F = '" + this.fecha_F
                    + "', promedio_semanal = '" + this.promedio_semanal + "', promedio_diario = '" + this.promedio_diario
                    + "' WHERE id_alimentacion = '" + this.id_alimentacion + "'";
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

    public void EliminarAlimentacion(String IDEliminar) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  alimentacion  where id_alimentacion = '" + IDEliminar + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public boolean ValidarInicio() {
        System.out.println(this.fecha_I);
        if (this.id_lote == 0 && this.id_alimento == 0 && this.semana == null && this.dia_1 == null && this.dia_2 == null && this.dia_3 == null && this.dia_4 == null && this.dia_5 == null && this.dia_6 == null && this.dia_7 == null && this.fecha_I == null && this.fecha_F == null && this.promedio_semanal == null && this.promedio_diario == null) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }

    }
}
