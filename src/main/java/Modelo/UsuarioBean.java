/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;


public class UsuarioBean {

    public UsuarioBean(String usuario, String password , String tipo) {
        this.usuario = usuario;
        this.password = password;
        this.tipo=tipo;
    }
    private String usuario;
    private String password;
    private String tipo;
    
    

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
public String getTipo(){
    return tipo;
}
public void setTipo(String tipo){
    
    this.tipo= tipo;
    
}
public boolean ValidarInicio() {
        if(this.usuario == null && this.password == null && this.tipo == null) {
            return false;
        } else {
            System.out.println("falso");
            return true;
        }
    }       
}
