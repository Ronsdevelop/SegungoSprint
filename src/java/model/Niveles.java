
package model;

import java.io.Serializable;

public class Niveles implements Serializable{
    private String cod_nivel;
    private String nom_nivel;

public Niveles() {
        this.cod_nivel = "";
        this.nom_nivel = "";
}

    public Niveles(String cod_nivel, String nom_nivel) {
        this.cod_nivel = cod_nivel;
        this.nom_nivel = nom_nivel;
    }

    
    public String getCod_nivel() {
        return cod_nivel;
    }

    public void setCod_nivel(String cod_nivel) {
        this.cod_nivel = cod_nivel;
    }

    public String getNom_nivel() {
        return nom_nivel;
    }

    public void setNom_nivel(String nom_nivel) {
        this.nom_nivel = nom_nivel;
    }

    
}
