/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Empleados;

/**
 *
 * @author Richard
 */
public class EmpleadosDAO {

    public static boolean RegistrarEmpleados(model.Empleados emp) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_IngresaEmpleados(?,?,?,?,?,?,?,?,?)}");
            ps.setString(1, emp.getNombres());
            ps.setString(2, emp.getApellidos());
            ps.setString(3, emp.getDni());
            ps.setString(4, emp.getUsername());
            ps.setString(5, emp.getPassword());
            ps.setString(6, emp.getTelefono());
            ps.setString(7, emp.getEmail());
            ps.setInt(8, emp.getEstado());
            ps.setInt(9, emp.getCod_tipoem());
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public static ArrayList<model.Empleados> ListaEmpleados() {
        try {
            String SQL = "select * from empleados";
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareCall(SQL);
            ResultSet resultado = ps.executeQuery();
            ArrayList<model.Empleados> Lista = new ArrayList<>();
            model.Empleados emp;
            while (resultado.next()) {
                emp = new model.Empleados();
                emp.setCod_empleados(resultado.getString("cod_empleados"));
                emp.setNombres(resultado.getString("nombres"));               
                emp.setApellidos(resultado.getString("apellidos"));
                emp.setDni(resultado.getString("dni"));
                emp.setUsername(resultado.getString("username"));
                emp.setPassword(resultado.getString("password"));
                emp.setTelefono(resultado.getString("telefono"));
                emp.setEmail(resultado.getString("email"));
                emp.setEstado(resultado.getInt("estado"));
                 emp.setCod_tipoem(resultado.getInt("cod_tipoem"));

                Lista.add(emp);
            }
            return Lista;
        } catch (SQLException ex) {
            return null;
        }
    }

    public static boolean EliminarEmpleados(model.Empleados emp) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            CallableStatement sp = con.prepareCall("{call sp_EliminaEmpleados(?)}");
            sp.setString(1, emp.getCod_empleados());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            return false;
        }
    }

    public static Empleados CodEmpleados(String cod) {
        model.Empleados emp = new model.Empleados();
        try {
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("select * from empleados where cod_empleados=?");
            ps.setString(1, cod);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                emp.setCod_empleados(rs.getString(1));
                emp.setNombres(rs.getString(2));
                emp.setApellidos(rs.getString(3));
                emp.setDni(rs.getString(4));
                emp.setUsername(rs.getString(5));
                emp.setPassword(rs.getString(6));
                emp.setTelefono(rs.getString(7));
                emp.setEmail(rs.getString(8));
                emp.setEstado(rs.getInt(9));
                emp.setCod_tipoem(rs.getInt(10));

                con.close();
            }
        } catch (SQLException ex) {
        }
        return emp;
    }

    public static boolean ModificarEmpleados(model.Empleados emp) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaEmpleados(?,?,?,?,?,?,?,?,?,?)}");
            ps.setString(1, emp.getCod_empleados());
            ps.setString(2, emp.getNombres());           
            ps.setString(3, emp.getApellidos());
            ps.setString(4, emp.getDni());
            ps.setString(5, emp.getUsername());
            ps.setString(6, emp.getPassword());
            ps.setString(7, emp.getTelefono());
            ps.setString(8, emp.getEmail());
            ps.setInt(9, emp.getEstado());
             ps.setInt(10, emp.getCod_tipoem());

            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {

        }
        return false;
    }
}
