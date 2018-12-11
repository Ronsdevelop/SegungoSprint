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
public class Limpieza {

    private String cod_Limpieza;
    private String cod_hab;

    private String fecha_lim;
    private String hora_lim;
    private String insidencias;
    private String coc_emplea;

    public Limpieza() {
        this.cod_Limpieza = "";
        this.coc_emplea = "";
        this.fecha_lim = "";
        this.hora_lim = "";
        this.insidencias = "";
        this.cod_hab = "";
    }

    public Limpieza(String cod_Limpieza, String coc_emplea, String fecha_lim, String hora_lim, String insidencias, String cod_hab) {
        this.cod_Limpieza = cod_Limpieza;
        this.coc_emplea = coc_emplea;
        this.fecha_lim = fecha_lim;
        this.hora_lim = hora_lim;
        this.insidencias = insidencias;
        this.cod_hab = cod_hab;
    }

    public String getCod_Limpieza() {
        return cod_Limpieza;
    }

    public void setCod_Limpieza(String cod_Limpieza) {
        this.cod_Limpieza = cod_Limpieza;
    }

    public String getCoc_emplea() {
        return coc_emplea;
    }

    public void setCoc_emplea(String coc_emplea) {
        this.coc_emplea = coc_emplea;
    }

    public String getFecha_lim() {
        return fecha_lim;
    }

    public void setFecha_lim(String fecha_lim) {
        this.fecha_lim = fecha_lim;
    }

    public String getHora_lim() {
        return hora_lim;
    }

    public void setHora_lim(String hora_lim) {
        this.hora_lim = hora_lim;
    }

    public String getInsidencias() {
        return insidencias;
    }

    public void setInsidencias(String insidencias) {
        this.insidencias = insidencias;
    }

    public String getCod_hab() {
        return cod_hab;
    }

    public void setCod_hab(String cod_hab) {
        this.cod_hab = cod_hab;
    }

}
