package Modelo;

import Config.Conexion;
import java.sql.ResultSet;

public class Cambiar_Contraseña {

    private String contraseña_antigua;
    private String contraseña_nueva;
    private String confirmar_contraseña;

    public Cambiar_Contraseña() {
    }

    public String getContraseña_antigua() {
        return contraseña_antigua;
    }

    public void setContraseña_antigua(String contraseña_antigua) {
        this.contraseña_antigua = contraseña_antigua;
    }

    public String getContraseña_nueva() {
        return contraseña_nueva;
    }

    public void setContraseña_nueva(String contraseña_nueva) {
        this.contraseña_nueva = contraseña_nueva;
    }

    public String getConfirmar_contraseña() {
        return confirmar_contraseña;
    }

    public void setConfirmar_contraseña(String confirmar_contraseña) {
        this.confirmar_contraseña = confirmar_contraseña;
    }

    public boolean ValidarInicioContraseña(String ContraseñaAntigua, String ContraseñaNueva, String confirmarContraseña) {
        if (ContraseñaAntigua.equals("") && ContraseñaNueva.equals("") && confirmarContraseña.equals("")) {
            return false;
        } else {
            return true;
        }
    }

    public Boolean validarCambioContraseña(String contraseñaAntigua) {
        boolean EstadoCambio = false;
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryVerificar = "select * from usuarios where contrasena_clave = '" + contraseñaAntigua + "'";
            ResultSet RsBuscar = ObjConexion.consultar(QueryVerificar);
            if (RsBuscar.next()) {
                EstadoCambio = true;
            }
        } catch (Exception e) {
            System.out.println("Error" + e);
        }
        return EstadoCambio;
    }

    public void UpdateCambio(String contraseñaNueva) {
        Conexion ObjConexion = new Conexion();
        try {
            ObjConexion.ConexionMySQL();
            String QueryInsertar = "Update usuarios set contrasena_clave = '" + contraseñaNueva + "' where  cedula_usuario = '" + logeo_granja.Cedula + "'";
            ObjConexion.actualizar(QueryInsertar);
            ObjConexion.cerrar();
        } catch (Exception e) {
            System.out.println("Algo Fallo en la conexion" + e);
        }
    }

}
