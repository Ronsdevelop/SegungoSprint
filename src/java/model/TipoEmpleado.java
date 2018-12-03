/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Rony
 */
public class TipoEmpleado implements Serializable{
    private int cod_temp;
    private String templeado;


    public TipoEmpleado() {
        this.cod_temp = 0;
        this.templeado = "";
      
    }    
    

    public TipoEmpleado(int cod_temp, String templeado ) {
        this.cod_temp = cod_temp;
        this.templeado = templeado;
      
    }

    public int getCod_temp() {
        return cod_temp;
    }

    public void setCod_temp(int cod_temp) {
        this.cod_temp = cod_temp;
    }

    public String getTempleado() {
        return templeado;
    }

    public void setTempleado(String templeado) {
        this.templeado = templeado;
    }

   
    

  
    
    
    
    
}
