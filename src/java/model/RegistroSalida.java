/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Rony
 */
public class RegistroSalida {

    private String cod_registro;
    private String fechaSalida;
    private String horaSalida;
    private String Insidencias;

    public RegistroSalida() {
        this.cod_registro = "";
        this.fechaSalida = "";
        this.horaSalida = "";
        this.Insidencias = "";
    }

    public RegistroSalida(String cod_registro, String fechaSalida, String horaSalida, String Insidencias) {
        this.cod_registro = cod_registro;
        this.fechaSalida = fechaSalida;
        this.horaSalida = horaSalida;
        this.Insidencias = Insidencias;
    }

    public String getCod_registro() {
        return cod_registro;
    }

    public void setCod_registro(String cod_registro) {
        this.cod_registro = cod_registro;
    }

    public String getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(String fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getInsidencias() {
        return Insidencias;
    }

    public void setInsidencias(String Insidencias) {
        this.Insidencias = Insidencias;
    }

}
