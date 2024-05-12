package Modelo;

import Config.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Reproduccion {
    private int id_reproduccion;
    private int numero_camada;
    private int id_padre;
    private int id_madre;
    private String fecha_parto;
    private int nacidos_vivos;
    private int nacidos_muertos;
    private String fecha_destete;
    private String observacion;

    public Reproduccion() {

    }

    public int getId_reproduccion() {
        return id_reproduccion;
    }

    public void setId_reproduccion(int id_reproduccion) {
        this.id_reproduccion = id_reproduccion;
    }

    public int getNumero_camada() {
        return numero_camada;
    }

    public void setNumero_camada(int numero_camada) {
        this.numero_camada = numero_camada;
    }

    public int getId_padre() {
        return id_padre;
    }

    public void setId_padre(int id_padre) {
        this.id_padre = id_padre;
    }

    public int getId_madre() {
        return id_madre;
    }

    public void setId_madre(int id_madre) {
        this.id_madre = id_madre;
    }
    
    

    public int getId_camada() {
        return numero_camada;
    }

    public void setId_camada(int id_camada) {
        this.numero_camada = id_camada;
    }

    public String getFecha_parto() {
        return fecha_parto;
    }

    public void setFecha_parto(String fecha_parto) {
        this.fecha_parto = fecha_parto;
    }

    public int getNacidos_vivos() {
        return nacidos_vivos;
    }

    public void setNacidos_vivos(int nacidos_vivos) {
        this.nacidos_vivos = nacidos_vivos;
    }

    public int getNacidos_muertos() {
        return nacidos_muertos;
    }

    public void setNacidos_muertos(int nacidos_muertos) {
        this.nacidos_muertos = nacidos_muertos;
    }

    public String getFecha_destete() {
        return fecha_destete;
    }

    public void setFecha_destete(String fecha_destete) {
        this.fecha_destete = fecha_destete;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public boolean ValidarInicio() {
        if (this.numero_camada == 0 && this.fecha_parto == null && this.nacidos_vivos == 0 && this.nacidos_muertos == 0 && this.fecha_destete == null
                && this.observacion == null && this.id_madre == 0 && this.id_padre == 0) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }

    public void InsertarReproduccion() {
        try {
            Conexion ObjConexion = new Conexion();
            ObjConexion.ConexionMySQL();
           String QueryInsertar = "INSERT INTO reproduccion (numero_camada, fecha_parto, id_madre, id_padre, nacidos_vivos, nacidos_muertos, fecha_destete, observacion) VALUES ('" + this.numero_camada + "', '" + this.fecha_parto + "', '" + this.id_madre + "', '" + this.id_padre + "', '" + this.nacidos_vivos + "', '" + this.nacidos_muertos + "', '" + this.fecha_destete + "', '" + this.observacion + "')";

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

    public void EliminarReproduccion(String ID) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "DELETE FROM  reproduccion  where id_reproduccion = '" + ID + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

    public void UpdateReproduccion(String ID) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            System.out.println("Aqui" + this.id_madre);
           String QueryModificarUsuario = "UPDATE reproduccion SET fecha_parto = '" + this.fecha_parto + " ',id_madre= '" + this.id_madre + "',id_padre= '" + this.id_padre + "', nacidos_vivos = '" + this.nacidos_vivos
                    + "', nacidos_muertos = '" + this.nacidos_muertos
                    + "', fecha_destete = '" + this.fecha_destete
                    + "', observacion = '" + this.observacion
                    + "' WHERE id_reproduccion = '" + ID + "'";

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

    public ResultSet listado_Reproduccion() throws SQLException {
        Conexion Con = new Conexion();
        ResultSet Rs = null;
        try {
            Con.ConexionMySQL();
            Rs = Con.consultar("select *  from reproduccion");
        } catch (Exception e) {
            System.out.println("Ocurrio un error " + e);
        }
        return Rs;
    }
    
    

}
