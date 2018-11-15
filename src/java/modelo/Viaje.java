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
    private Camion camion = new Camion();
    private String ruta;
    private float peso;
    private float volumen;
    private String nombreTienda;
    private String nombreAlmacen;
    private String placaCamion;
    

    public Viaje() {
    }

    public Viaje(int id, String ruta) {
        this.id = id;
        this.ruta = ruta;
    }

    public Viaje(int id, String ruta, float peso, float volumen, String nombreTienda, String nombreAlmacen, String placaCamion) {
        this.id = id;
        this.ruta = ruta;
        this.peso = peso;
        this.volumen = volumen;
        this.nombreTienda = nombreTienda;
        this.nombreAlmacen = nombreAlmacen;
        this.placaCamion = placaCamion;
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

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getVolumen() {
        return volumen;
    }

    public void setVolumen(float volumen) {
        this.volumen = volumen;
    }

    public String getNombreTienda() {
        return nombreTienda;
    }

    public void setNombreTienda(String nombreTienda) {
        this.nombreTienda = nombreTienda;
    }

    public String getNombreAlmacen() {
        return nombreAlmacen;
    }

    public void setNombreAlmacen(String nombreAlmacen) {
        this.nombreAlmacen = nombreAlmacen;
    }

    public String getPlacaCamion() {
        return placaCamion;
    }

    public void setPlacaCamion(String placaCamion) {
        this.placaCamion = placaCamion;
    }
    
    

}
