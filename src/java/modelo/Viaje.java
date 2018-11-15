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
public class Viaje {
    private int id;
    private Camion camion=new Camion();
    private String ruta;

    public Viaje() {
    }

    public Viaje(int id, String ruta) {
        this.id = id;
        this.ruta = ruta;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Camion getCamion() {
        return camion;
    }

    public void setCamion(Camion camion) {
        this.camion = camion;
    }

    public String getRuta() {
        return ruta;
    }

    public void setRuta(String ruta) {
        this.ruta = ruta;
    }

    @Override
    public String toString() {
        return "Viaje{" + "id=" + id + ", camion=" + camion + ", ruta=" + ruta + '}';
    }
    
    
    
}
