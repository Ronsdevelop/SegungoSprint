/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author Rony
 */
public class RegistroHabitacion implements Serializable{
    private String cod_registro;
    private String cod_cliente;
    private String cod_habitacion;
    private String cod_empleado;
    private String fechaIngreso;
    private String horaIngreso;
    private int adultos;
    private int ninos;
    private String cod_reserva;
    
    public RegistroHabitacion() {
        
    }

    public RegistroHabitacion(String cod_registro, String cod_cliente, String cod_habitacion, String cod_empleado, String fechaIngreso, String horaIngreso, int adultos, int ninos, String cod_reserva) {
        this.cod_registro = cod_registro;
        this.cod_cliente = cod_cliente;
        this.cod_habitacion = cod_habitacion;
        this.cod_empleado = cod_empleado;
        this.fechaIngreso = fechaIngreso;
        this.horaIngreso = horaIngreso;
        this.adultos = adultos;
        this.ninos = ninos;
        this.cod_reserva = cod_reserva;
    }

    public String getCod_registro() {
        return cod_registro;
    }

    public void setCod_registro(String cod_registro) {
        this.cod_registro = cod_registro;
    }

    public String getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(String cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public String getCod_habitacion() {
        return cod_habitacion;
    }

    public void setCod_habitacion(String cod_habitacion) {
        this.cod_habitacion = cod_habitacion;
    }

    public String getCod_empleado() {
        return cod_empleado;
    }

    public void setCod_empleado(String cod_empleado) {
        this.cod_empleado = cod_empleado;
    }

    public String getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public String getHoraIngreso() {
        return horaIngreso;
    }

    public void setHoraIngreso(String horaIngreso) {
        this.horaIngreso = horaIngreso;
    }

    public int getAdultos() {
        return adultos;
    }

    public void setAdultos(int adultos) {
        this.adultos = adultos;
    }

    public int getNinos() {
        return ninos;
    }

    public void setNinos(int ninos) {
        this.ninos = ninos;
    }

    public String getCod_reserva() {
        return cod_reserva;
    }

    public void setCod_reserva(String cod_reserva) {
        this.cod_reserva = cod_reserva;
    }
    
    
            
    
}
