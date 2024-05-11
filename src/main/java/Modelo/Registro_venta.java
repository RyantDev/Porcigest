/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.Date;

public class Registro_venta {
 
 private int id_venta;   
 private double promedio_kg_venta;
 private int numero_porcinos_venta;
 private Date fecha_venta;

    public Registro_venta() {
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public double getPromedio_kg_venta() {
        return promedio_kg_venta;
    }

    public void setPromedio_kg_venta(double promedio_kg_venta) {
        this.promedio_kg_venta = promedio_kg_venta;
    }

    public int getNumero_porcinos_venta() {
        return numero_porcinos_venta;
    }

    public void setNumero_porcinos_venta(int numero_porcinos_venta) {
        this.numero_porcinos_venta = numero_porcinos_venta;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }
 
 public boolean ValidarInicio() {
        if(this.id_venta == 0 && this.promedio_kg_venta == 0 && this.numero_porcinos_venta == 0 && this.fecha_venta == null) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    } 
}
