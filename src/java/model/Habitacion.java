/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Richard
 */
public class Habitacion implements Serializable {

    private String cod_habitacion;
    private String numero;
    private float precio;
    private String descripcion;
    private String cod_tipoh;
    private String cod_nivel;
    private String cod_estado;

    public Habitacion() {
        this.numero = "";
        this.precio = 0;
        this.descripcion = "";
        this.cod_tipoh = "";
        this.cod_nivel = "";
        this.cod_estado = "";
    }

    public Habitacion(String numero, float precio, String descripcion, String cod_tipoh, String cod_nivel, String cod_estado) {
        this.numero = numero;
        this.precio = precio;
        this.descripcion = descripcion;
        this.cod_tipoh = cod_tipoh;
        this.cod_nivel = cod_nivel;
        this.cod_estado = cod_estado;
    }

    public String getCod_habitacion() {
        return cod_habitacion;
    }

    public void setCod_habitacion(String cod_habitacion) {
        this.cod_habitacion = cod_habitacion;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCod_tipoh() {
        return cod_tipoh;
    }

    public void setCod_tipoh(String cod_tipoh) {
        this.cod_tipoh = cod_tipoh;
    }

    public String getCod_nivel() {
        return cod_nivel;
    }

    public void setCod_nivel(String cod_nivel) {
        this.cod_nivel = cod_nivel;
    }

    public String getCod_estado() {
        return cod_estado;
    }

    public void setCod_estado(String cod_estado) {
        this.cod_estado = cod_estado;
    }

}
