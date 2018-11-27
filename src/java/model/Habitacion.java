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
    private String cod_tipohabitacion;
    private String cod_nivel;
    private String numero;
    private String observaciones;
    private String disponible;
    private String reserva;

    public Habitacion() {
        this.cod_habitacion = "";
        this.cod_tipohabitacion = "";
        this.cod_nivel = "";
        this.numero = "";
        this.observaciones = "";
        this.disponible = "";
        this.reserva = "";
    }

    public Habitacion(String cod_habitacion, String cod_tipohabitacion, String cod_nivel, String numero, String observaciones, String disponible, String reserva) {
        this.cod_habitacion = cod_habitacion;
        this.cod_tipohabitacion = cod_tipohabitacion;
        this.cod_nivel = cod_nivel;
        this.numero = numero;
        this.observaciones = observaciones;
        this.disponible = disponible;
        this.reserva = reserva;
    }

    public String getCod_habitacion() {
        return cod_habitacion;
    }

    public void setCod_habitacion(String cod_habitacion) {
        this.cod_habitacion = cod_habitacion;
    }

    public String getCod_tipohabitacion() {
        return cod_tipohabitacion;
    }

    public void setCod_tipohabitacion(String cod_tipohabitacion) {
        this.cod_tipohabitacion = cod_tipohabitacion;
    }

    public String getCod_nivel() {
        return cod_nivel;
    }

    public void setCod_nivel(String cod_nivel) {
        this.cod_nivel = cod_nivel;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public String getDisponible() {
        return disponible;
    }

    public void setDisponible(String disponible) {
        this.disponible = disponible;
    }

    public String getReserva() {
        return reserva;
    }

    public void setReserva(String reserva) {
        this.reserva = reserva;
    }

}
