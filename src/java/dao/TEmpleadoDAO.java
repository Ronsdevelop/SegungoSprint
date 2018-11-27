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
 * @author Rony
 */
public class TEmpleadoDAO {

    public static boolean RegistraTipoEmpl(model.TipoEmpleado tp) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            PreparedStatement sp = con.prepareStatement("{call sp_ingresatipoempleados(?,?)}");
            sp.setString(1, tp.getTempleado());
            /*sp.setString(2, tp.getDescripcion()); */
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public static ArrayList<model.TipoEmpleado> ListaTiposEm() {
        try {
            String SQL = "select * from tipoempleados";
            Connection con = Conexion.conectar();
            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<model.TipoEmpleado> lista = new ArrayList<>();
            model.TipoEmpleado TipE;
            while (resultado.next()) {
                TipE = new model.TipoEmpleado();
                TipE.setCod_temp(resultado.getString("cod_tipoempleado"));
                TipE.setTempleado(resultado.getString("tipo"));
                /*TipE.setDescripcion(resultado.getString("descripcion")); */

                lista.add(TipE);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }

    public static boolean EliminaTipoEmp(model.TipoEmpleado tp) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            CallableStatement sp = con.prepareCall("{call sp_eliminatipoempleados(?)}");
            sp.setString(1, tp.getCod_temp());

            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public static model.TipoEmpleado Cod_Tipo(String id) throws SQLException {
        model.TipoEmpleado TP = new model.TipoEmpleado();
        try {
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("select * from tipoempleados where cod_tipoempleado=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                TP.setCod_temp(rs.getString(1));
                TP.setTempleado(rs.getString(2));
                /*TP.setDescripcion(rs.getString(3)); */

                con.close();

            }
        } catch (SQLException ex) {

        }
        return TP;
    }

    public static boolean ModificaTipoEm(model.TipoEmpleado TP) {
        try {
            CallableStatement cs = null;
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_modificatipoempleados(?,?,?)}");
            ps.setString(1, TP.getCod_temp());
            ps.setString(2, TP.getTempleado());
            /*ps.setString(3, TP.getDescripcion()); */

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
