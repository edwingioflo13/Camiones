/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Date;

/**
 *
 * @author t4nk
 */
public class Pedido {
    private int id;
    private Almacen almacen = new Almacen();
    private Tienda tienda = new Tienda();
    private Viaje viaje = new Viaje();
    private float peso;
    private float volumen;
    private Date envio;
    private Date entrega;

    public Pedido() {
    }

    public Pedido(int id, Almacen almacen, Tienda tienda, Viaje viaje, float peso, float volumen, Date envio, Date entrega) {
        this.id = id;
        this.almacen = almacen;
        this.tienda = tienda;
        this.viaje = viaje;
        this.peso = peso;
        this.volumen = volumen;
        this.envio = envio;
        this.entrega = entrega;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Almacen getAlmacen() {
        return almacen;
    }

    public void setAlmacen(Almacen almacen) {
        this.almacen = almacen;
    }

    public Tienda getTienda() {
        return tienda;
    }

    public void setTienda(Tienda tienda) {
        this.tienda = tienda;
    }

    public Viaje getViaje() {
        return viaje;
    }

    public void setViaje(Viaje viaje) {
        this.viaje = viaje;
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

    public Date getEnvio() {
        return envio;
    }

    public void setEnvio(Date envio) {
        this.envio = envio;
    }

    public Date getEntrega() {
        return entrega;
    }

    public void setEntrega(Date entrega) {
        this.entrega = entrega;
    }

    @Override
    public String toString() {
        return "Pedido{" + "id=" + id + ", almacen=" + almacen + ", tienda=" + tienda + ", viaje=" + viaje + ", peso=" + peso + ", volumen=" + volumen + ", envio=" + envio + ", entrega=" + entrega + '}';
    }
    
    
    
}
