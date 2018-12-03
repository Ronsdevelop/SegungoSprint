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
import model.EstadoHabitacion;

/**
 *
 * @author Richard
 */
public class EstadoHabitacionDAO {
    public static boolean RegistrarEstadoHabitacion(model.EstadoHabitacion est) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_IngresaEstadoHabitacion(?)}");
            ps.setString(1, est.getEstado_habitacion());
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
        
    }
    
    public static ArrayList<model.EstadoHabitacion> ListaEstadoHabitacion() {
        try {
            String SQL = "select * from estado_habitacion";
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareCall(SQL);
            ResultSet resultado = ps.executeQuery();
            ArrayList<model.EstadoHabitacion> Lista = new ArrayList<>();
            model.EstadoHabitacion est;
            while (resultado.next()) {
                est = new model.EstadoHabitacion();
                est.setCod_estado(resultado.getString("cod_estado"));
                est.setEstado_habitacion(resultado.getString("estado_habitacion"));
                Lista.add(est);
            }
            return Lista;
        } catch (SQLException ex) {
            return null;
        }
    }
    
    public static boolean EliminarEstadoHabitacion(model.EstadoHabitacion est) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            CallableStatement sp = con.prepareCall("{call sp_EliminaEstadoHabitacion(?)}");
            sp.setString(1, est.getCod_estado());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            return false;
        }
    }
    
    public static EstadoHabitacion CodEstadoHabitacion(String cod) {
        model.EstadoHabitacion est = new model.EstadoHabitacion();
        try {
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("select * from estado_habitacion where cod_estado=?");
            ps.setString(1, cod);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                est.setCod_estado(rs.getString(1));
                est.setEstado_habitacion(rs.getString(2));
                con.close();
            }
        } catch (SQLException ex) {
        }
        return est;
    }
    
    public static boolean ModificarEstadoHabitacion(model.EstadoHabitacion est) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaEstadoHabitacion(?,?)}");
            ps.setString(1, est.getCod_estado());
            ps.setString(2, est.getEstado_habitacion());
            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            
        }
        return false;
    }
    
    public static  String getEstado(String cod){
        try {
            String consulta = ("SELECT `estado_habitacion` FROM `estado_habitacion` WHERE `cod_estado` = ?");
            Connection con = Conexion.conectar();
            PreparedStatement sp = con.prepareStatement(consulta);
            sp.setString(1, cod);
            ResultSet res = sp.executeQuery();
            while (res.next()) {                
                return res.getString("estado_habitacion");
            }
            return"--";
        } catch (Exception e) {
            return"--";
        }
    }
}
