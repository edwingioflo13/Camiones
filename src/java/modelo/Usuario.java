/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author t4nk
 */
public class Usuario {
    private String id;
    private String pass;
    private String nombre;
    private String apellido;

    public Usuario() {
    }

    public Usuario(String id, String pass, String nombre, String apellido) {
        this.id = id;
        this.pass = pass;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", pass=" + pass + ", nombre=" + nombre + ", apellido=" + apellido + '}';
    }
    
    
    
}
