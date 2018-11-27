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

/**
 *
 * @author Richard
 */
public class HabitacionDAO {

    public static boolean registrarhabitacion(model.Habitacion h) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            CallableStatement sp = con.prepareCall("{call sp_ingresahabitacion(?,?,?,?,?,?)}");
            sp.setString(1, h.getCod_tipohabitacion());
            sp.setString(2, h.getCod_nivel());
            sp.setString(3, h.getNumero());
            sp.setString(4, h.getObservaciones());
            sp.setString(5, h.getDisponible());
            sp.setString(6, h.getReserva());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }
public static ArrayList<model.Habitacion> listahabitacion() {
        try {
            String SQL = "select * from habitaciones";
            Connection con = Conexion.conectar();
            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<model.Habitacion> lista = new ArrayList<>();
            model.Habitacion hab;
            while (resultado.next()) {
                hab = new model.Habitacion();
                hab.setCod_habitacion(resultado.getString("cod_habitacion"));
                hab.setCod_tipohabitacion(resultado.getString("cod_tipohabitacion"));
                hab.setCod_nivel(resultado.getString("cod_nivel"));
                hab.setNumero(resultado.getString("numero"));
                hab.setObservaciones(resultado.getString("observaciones"));
                hab.setDisponible(resultado.getString("disponible"));
                hab.setReserva(resultado.getString("reserva"));
                
                lista.add(hab);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }

    public static boolean eliminahabitacion(model.Habitacion hab) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            CallableStatement sp = con.prepareCall("{call sp_eliminahabitacion(?)}");
            sp.setString(1, hab.getCod_habitacion());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public static model.Habitacion codhabitacion(String id) throws SQLException {
       model.Habitacion hab = new model.Habitacion();
        try {
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("select * from habitaciones where cod_habitacion=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                hab.setCod_habitacion(rs.getString(1));
                hab.setCod_tipohabitacion(rs.getString(2));
                hab.setCod_nivel(rs.getString(3));
                hab.setNumero(rs.getString(4));
                hab.setObservaciones(rs.getString(5));
                hab.setDisponible(rs.getString(6));
                hab.setReserva(rs.getString(7));
                con.close();

            }
        } catch (SQLException ex) {

        }
        return hab;
    }
     public static boolean Modificahabitacion(model.Habitacion hab) {
        try {
            CallableStatement cs=null;
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_modificahabitacion(?,?,?,?,?,?,?)}");
            ps.setString(1,hab.getCod_habitacion());
            ps.setString(2,hab.getCod_tipohabitacion());
            ps.setString(3,hab.getCod_nivel());
            ps.setString(4,hab.getNumero());
            ps.setString(5,hab.getObservaciones());
            ps.setString(6,hab.getDisponible());
            ps.setString(7,hab.getReserva());
            if (ps.executeUpdate()>0) {
                return true;
            }else{
                return false;
            }
        } catch (SQLException ex) {

        }
        return false;
    }
}


