/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import com.mysql.jdbc.Connection;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Richard
 */
public class TipoHabitacionDAO {

    public static boolean RegistrarTipoHabitacion(model.TipoHabitacion th) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement ps = con.prepareStatement("{call sp_IngresaTipoHabitacion(?,?)}");
            ps.setString(1, th.getTipo_habitacion());
            ps.setString(2, th.getDescripcion());
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

    public static ArrayList<model.TipoHabitacion> ListaTipoHAbitacion() {
        Connection con = Conexion.conectar();
        try {
            String SQL = "select * from tipo_habitacion";

            PreparedStatement ps = con.prepareCall(SQL);
            ResultSet resultado = ps.executeQuery();
            ArrayList<model.TipoHabitacion> Lista = new ArrayList<>();
            model.TipoHabitacion th;
            while (resultado.next()) {
                th = new model.TipoHabitacion();
                th.setCod_tipoh(resultado.getString("cod_tipoh"));
                th.setTipo_habitacion(resultado.getString("tipo_habitacion"));
                th.setDescripcion(resultado.getString("descripcion"));
                Lista.add(th);
            }
            return Lista;
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

    public static boolean EliminarTipoHabitacion(model.TipoHabitacion th) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            CallableStatement sp = con.prepareCall("{call sp_EliminaTipoHabitacion(?)}");
            sp.setString(1, th.getCod_tipoh());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
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

    public static model.TipoHabitacion CodTipoHabitacion(String cod) {
        Connection con = Conexion.conectar();
        model.TipoHabitacion th = new model.TipoHabitacion();
        try {

            PreparedStatement ps = con.prepareStatement("select * from tipo_habitacion where cod_tipoh=?");
            ps.setString(1, cod);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                th.setCod_tipoh(rs.getString(1));
                th.setTipo_habitacion(rs.getString(2));
                th.setDescripcion(rs.getString(3));

            }
            return th;
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

    public static boolean ModificarTipoHabitacion(model.TipoHabitacion th) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaTipoHabitacion(?,?,?)}");
            ps.setString(1, th.getCod_tipoh());
            ps.setString(2, th.getTipo_habitacion());
            ps.setString(3, th.getDescripcion());
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

    public static String getTipo(String cod) {
        java.sql.Connection con = Conexion.conectar();
        try {
            String SQL = "SELECT `tipo_habitacion` FROM `tipo_habitacion` WHERE `cod_tipoh` = ?";

            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, cod);
            ResultSet resultado = st.executeQuery();
            while (resultado.next()) {
                return resultado.getString("tipo_habitacion");
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
}
