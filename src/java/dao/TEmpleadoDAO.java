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
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement sp = con.prepareStatement("{call sp_IngresaTipoEmpleado(?)}");
            sp.setString(1, tp.getTempleado());

            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public static ArrayList<model.TipoEmpleado> ListaTiposEm() {
        Connection con = Conexion.conectar();
        try {
            String SQL = "select * from tipo_empleado";

            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<model.TipoEmpleado> lista = new ArrayList<>();
            model.TipoEmpleado TipE;
            while (resultado.next()) {
                TipE = new model.TipoEmpleado();
                TipE.setCod_temp(resultado.getInt("cod_tipoem"));
                TipE.setTempleado(resultado.getString("tipo_emleado"));

                lista.add(TipE);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public static boolean EliminaTipoEmp(model.TipoEmpleado tp) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            CallableStatement sp = con.prepareCall("{call sp_eliminatipoempleados(?)}");
            sp.setInt(1, tp.getCod_temp());

            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public static String Cod_Tipo(int id) throws SQLException {
        Connection con = Conexion.conectar();
        model.TipoEmpleado TP = new model.TipoEmpleado();
        try {

            PreparedStatement ps = con.prepareStatement("select * from tipo_empleado where cod_tipoem=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString("tipo_emleado");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public static boolean ModificaTipoEm(model.TipoEmpleado TP) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement ps = con.prepareStatement("{call sp_modificatipoempleados(?,?,?)}");
            ps.setInt(1, TP.getCod_temp());
            ps.setString(2, TP.getTempleado());

            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;

        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }

    }
}
