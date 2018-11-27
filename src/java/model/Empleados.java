package model;

import java.io.Serializable;

public class Empleados implements Serializable {

    private String cod_empleado;
    private String nombres;
    private String cod_tipoempleado;
    private String apellidos;
    private String dni;
    private String usuario;
    private String clave;
    private String fono;
    private String email;
    private String estado;

    public Empleados() {
        this.cod_empleado = "";
        this.nombres = "";
        this.apellidos = "";   
        this.fono = "";
        this.email = "";
        this.cod_tipoempleado = "";
        this.usuario = "";
        this.clave = "";
        this.estado = "";
    }

    public Empleados(String cod_empleado, String nombres, String cod_tipoempleado, String apellidos, String dni, String usuario, String clave, String fono, String email, String estado) {
        this.cod_empleado = cod_empleado;
        this.nombres = nombres;
        this.cod_tipoempleado = cod_tipoempleado;
        this.apellidos = apellidos;
        this.dni = dni;
        this.usuario = usuario;
        this.clave = clave;
        this.fono = fono;
        this.email = email;
        this.estado = estado;
    }

    public String getCod_empleado() {
        return cod_empleado;
    }

    public void setCod_empleado(String cod_empleado) {
        this.cod_empleado = cod_empleado;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getCod_tipoempleado() {
        return cod_tipoempleado;
    }

    public void setCod_tipoempleado(String cod_tipoempleado) {
        this.cod_tipoempleado = cod_tipoempleado;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
