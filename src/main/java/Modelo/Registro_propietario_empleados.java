/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author 2499479
 */
public class Registro_propietario_empleados {

    private int cedula_empleado;
    private String nombre_empleado;
    private int telefono_empleado;

    public Registro_propietario_empleados() {
    }

    public int getCedula_empleado() {
        return cedula_empleado;
    }

    public void setCedula_empleado(int cedula_empleado) {
        this.cedula_empleado = cedula_empleado;
    }

    public String getNombre_empleado() {
        return nombre_empleado;
    }

    public void setNombre_empleado(String nombre_empleado) {
        this.nombre_empleado = nombre_empleado;
    }

    public int getTelefono_empleado() {
        return telefono_empleado;
    }

    public void setTelefono_empleado(int telefono_empleado) {
        this.telefono_empleado = telefono_empleado;
    }

    public boolean ValidarInicio() {
        if (this.cedula_empleado == 0 && this.nombre_empleado == null && this.telefono_empleado == 0) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }
}
