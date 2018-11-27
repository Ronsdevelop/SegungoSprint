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
    private String cod_temp;
    private String templeado;


    public TipoEmpleado() {
        this.cod_temp = "";
        this.templeado = "";
      
    }    
    

    public TipoEmpleado(String cod_temp, String templeado ) {
        this.cod_temp = cod_temp;
        this.templeado = templeado;
      
    }

    public String getCod_temp() {
        return cod_temp;
    }

    public void setCod_temp(String cod_temp) {
        this.cod_temp = cod_temp;
    }

    public String getTempleado() {
        return templeado;
    }

    public void setTempleado(String templeado) {
        this.templeado = templeado;
    }

   
    

  
    
    
    
    
}
