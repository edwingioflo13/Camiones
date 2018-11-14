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
public class Camion {
    private String placa;
    private float volumen;
    private float peso;
    private String estado;
    private Chofer chofer = new Chofer();

    public Camion() {
    }

    public Camion(String placa, float volumen, float peso, String estado) {
        this.placa = placa;
        this.volumen = volumen;
        this.peso = peso;
        this.estado = estado;
    }

    public Camion(String placa, float volumen, float peso, String estado, Chofer chofer) {
        this.placa = placa;
        this.volumen = volumen;
        this.peso = peso;
        this.estado = estado;
        this.chofer = chofer;
    }
    
    

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public float getVolumen() {
        return volumen;
    }

    public void setVolumen(float volumen) {
        this.volumen = volumen;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Chofer getChofer() {
        return chofer;
    }

    public void setChofer(Chofer chofer) {
        this.chofer = chofer;
    }

    @Override
    public String toString() {
        return "Camion{" + "placa=" + placa + ", volumen=" + volumen + ", peso=" + peso + ", estado=" + estado + ", chofer=" + chofer + '}';
    }

    
    
}
