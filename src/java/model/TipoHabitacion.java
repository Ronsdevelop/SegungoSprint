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
public class TipoHabitacion implements Serializable {

    private String cod_tipoh;
    private String tipo_habitacion;
    private String descripcion;

    public TipoHabitacion() {
        this.cod_tipoh = "";
        this.tipo_habitacion = "";
        this.descripcion = "";
    }

    public TipoHabitacion(String tipo_habitacion, String descripcion) {
        this.tipo_habitacion = tipo_habitacion;
        this.descripcion = descripcion;
    }

    public String getCod_tipoh() {
        return cod_tipoh;
    }

    public void setCod_tipoh(String cod_tipoh) {
        this.cod_tipoh = cod_tipoh;
    }

    public String getTipo_habitacion() {
        return tipo_habitacion;
    }

    public void setTipo_habitacion(String tipo_habitacion) {
        this.tipo_habitacion = tipo_habitacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

}
