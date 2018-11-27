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

    public static ArrayList<model.Empleados> listarEmpleados() {
        try {
            String SQL = "select * from empleados";
            Connection con = Conexion.conectar();
            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<model.Empleados> listaEmpleado = new ArrayList<>();
            model.Empleados emp;
            while (resultado.next()) {
                emp = new model.Empleados();
                emp.setCod_empleado(resultado.getString("cod_empleado"));
                emp.setNombres(resultado.getString("nombres"));
                /*emp.setAppaterno(resultado.getString("appaterno"));
                emp.setApmaterno(resultado.getString("apmaterno")); */
                emp.setFono(resultado.getString("fono"));
                emp.setEmail(resultado.getString("email"));
                emp.setCod_tipoempleado(resultado.getString("cod_tipoempleado"));
                emp.setUsuario(resultado.getString("usuario"));
                emp.setClave(resultado.getString("clave"));
                emp.setEstado(resultado.getString("estado"));
                listaEmpleado.add(emp);
            }
            return listaEmpleado;
        } catch (SQLException ex) {
            return null;
        }
    }

    public static boolean RegistrarEmpleado(model.Empleados em) {
        try {
            CallableStatement cs = null;
            Connection con = dao.Conexion.conectar();
            PreparedStatement sp = con.prepareStatement("{call sp_ingresaempleados(?,?,?,?,?,?,?,?,?)}");
            sp.setString(1, em.getNombres());
            /*sp.setString(2, em.getAppaterno());
            sp.setString(3, em.getApmaterno()); */
            sp.setString(4, em.getFono());
            sp.setString(5, em.getEmail());
            sp.setString(6, em.getCod_tipoempleado());
            sp.setString(7, em.getUsuario());
            sp.setString(8, em.getClave());
            sp.setString(9, em.getEstado());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }

    }

    public static Empleados idCodigo(String id) throws SQLException {
        Empleados emp = new Empleados();
        try {
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM empleados WHERE cod_empleado=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                emp.setCod_empleado(rs.getString(1));
                emp.setNombres(rs.getString(2));
               /* emp.setAppaterno(rs.getString(3));
                emp.setApmaterno(rs.getString(4)); */
                emp.setFono(rs.getString(5));
                emp.setEmail(rs.getString(6));
                emp.setCod_tipoempleado(rs.getString(7));
                emp.setUsuario(rs.getString(8));
                emp.setClave(rs.getString(9));
                emp.setEstado(rs.getString(10));
                con.close();

            }
        } catch (SQLException ex) {

        }
        return emp;
    }

    public static boolean ModificaEmpleado(model.Empleados em) {
        try {
            CallableStatement cs = null;
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_modificaempleados(?,?,?,?,?,?,?,?,?,?)}");
            ps.setString(1, em.getCod_empleado());
            ps.setString(2, em.getNombres());
            /*ps.setString(3, em.getAppaterno());
            ps.setString(4, em.getApmaterno()); */
            ps.setString(5, em.getFono());
            ps.setString(6, em.getEmail());
            ps.setString(7, em.getCod_tipoempleado());
            ps.setString(8, em.getUsuario());
            ps.setString(9, em.getClave());
            ps.setString(10, em.getEstado());
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {

        }
        return false;
    }

    public static boolean eliminaempleado(model.Empleados emp) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            CallableStatement sp = con.prepareCall("{call sp_eliminaempleados(?)}");
            sp.setString(1, emp.getCod_empleado());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

}
