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
public class Cliente implements Serializable{
    private String cod_cliente;
    private String nombres;
    private String apellidos;
    private String rasonsocial;
    private String tipo_doc;
    private String documento;
    private String direccion;
    private String fono;
    private String email;   


    public Cliente() {
        this.cod_cliente = "";
        this.nombres = "";
        this.apellidos = "";
        this.rasonsocial = "";
        this.tipo_doc = "";
        this.documento = "";
        this.direccion = "";
        this.fono = "";
        this.email = "";
     
    }

    public Cliente(String cod_cliente, String nombres, String apellidos, String rasonsocial, String tipo_doc, String documento, String direccion, String fono, String email) {
        this.cod_cliente = cod_cliente;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.rasonsocial = rasonsocial;
        this.tipo_doc = tipo_doc;
        this.documento = documento;
        this.direccion = direccion;
        this.fono = fono;
        this.email = email;
    }

    public String getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(String cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getRasonsocial() {
        return rasonsocial;
    }

    public void setRasonsocial(String rasonsocial) {
        this.rasonsocial = rasonsocial;
    }

    public String getTipo_doc() {
        return tipo_doc;
    }

    public void setTipo_doc(String tipo_doc) {
        this.tipo_doc = tipo_doc;
    }

    public String getDocumento() {
        return documento;
    }

    public void setDocumento(String documento) {
        this.documento = documento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getFono() {
        return fono;
    }

    public void setFono(String fono) {
        this.fono = fono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}

    