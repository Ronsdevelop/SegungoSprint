package model;

import java.io.Serializable;

public class Empleados implements Serializable {

    private String cod_empleados;
    private String nombres;
    private String apellidos;
    private String dni;
    private String username;
    private String password;
    private String telefono;
    private String email;
    private int estado;
    private int cod_tipoem;

    public Empleados() {
        this.nombres = "";
        this.apellidos = "";
        this.dni = "";
        this.username = "";
        this.password = "";
        this.telefono = "";
        this.email = "";
        this.estado = 0;
        this.cod_tipoem = 0;
    }

    public Empleados(String cod_empleados, String nombres, String apellidos, String dni, String username, String password, String telefono, String email, int estado, int cod_tipoem) {
        this.cod_empleados = cod_empleados;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.username = username;
        this.password = password;
        this.telefono = telefono;
        this.email = email;
        this.estado = estado;
        this.cod_tipoem = cod_tipoem;
    }

    public String getCod_empleados() {
        return cod_empleados;
    }

    public void setCod_empleados(String cod_empleados) {
        this.cod_empleados = cod_empleados;
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

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public int getCod_tipoem() {
        return cod_tipoem;
    }

    public void setCod_tipoem(int cod_tipoem) {
        this.cod_tipoem = cod_tipoem;
    }

    

}
