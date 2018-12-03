/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Richard
 */
public class EstadoHabitacion {

    private String cod_estado;
    private String estado_habitacion;

    public EstadoHabitacion() {
        this.estado_habitacion = "";
    }

    public EstadoHabitacion(String estado_habitacion) {
        this.estado_habitacion = estado_habitacion;
    }

    public String getCod_estado() {
        return cod_estado;
    }

    public void setCod_estado(String cod_estado) {
        this.cod_estado = cod_estado;
    }

    public String getEstado_habitacion() {
        return estado_habitacion;
    }

    public void setEstado_habitacion(String estado_habitacion) {
        this.estado_habitacion = estado_habitacion;
    }

}
