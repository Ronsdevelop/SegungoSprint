/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.net.ConnectException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Habitacion;

/**
 *
 * @author Richard
 */
public class HabitacionDAO {

    public static boolean RegistrarHabitacion(model.Habitacion hab) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;
            
            PreparedStatement ps = con.prepareStatement("{call sp_IngresaHabitacion(?,?,?,?,?)}");
            ps.setString(1, hab.getNumero());
            ps.setFloat(2, hab.getPrecio());
            ps.setString(3, hab.getDescripcion());
            ps.setString(4, hab.getCod_tipoh());
            ps.setString(5, hab.getCod_nivel());

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

    public static ArrayList<model.Habitacion> ListaHabitacion() {
         Connection con = Conexion.conectar();
        try {
            String SQL = "select * from habitacion";
           
            PreparedStatement ps = con.prepareCall(SQL);
            ResultSet resultado = ps.executeQuery();
            ArrayList<model.Habitacion> Lista = new ArrayList<>();
            model.Habitacion hab;
            while (resultado.next()) {
                hab = new model.Habitacion();
                hab.setCod_habitacion(resultado.getString("cod_habitacion"));
                hab.setNumero(resultado.getString("numero"));
                hab.setPrecio(resultado.getFloat("precio"));
                hab.setDescripcion(resultado.getString("descripcion"));
                hab.setCod_tipoh(resultado.getString("cod_tipoh"));
                hab.setCod_nivel(resultado.getString("cod_nivel"));
                hab.setCod_estado(resultado.getString("cod_estado"));
                Lista.add(hab);
            }
           
            return Lista;
        } catch (SQLException ex) {
            return null;
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public static boolean EliminarHabitacion(model.Habitacion hab) {
         Connection con = Conexion.conectar();
        try {

           
            CallableStatement sp = con.prepareCall("{call sp_EliminaHabitacion(?)}");
            sp.setString(1, hab.getCod_habitacion());
            if (sp.executeUpdate() > 0) {
             
                return true;
            } else {
             
                return false;
            }
        } catch (SQLException e) {
            return false;
        }
         finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public static Habitacion CodHabitacion(String cod) {
        model.Habitacion hab = new model.Habitacion();
            Connection con = Conexion.conectar();
        try {
        
            PreparedStatement ps = con.prepareStatement("select * from habitacion where cod_habitacion=?");
            ps.setString(1, cod);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                hab.setCod_habitacion(rs.getString(1));
                hab.setNumero(rs.getString(2));
                hab.setPrecio(rs.getFloat(3));
                hab.setDescripcion(rs.getString(4));
                hab.setCod_tipoh(rs.getString(5));
                hab.setCod_nivel(rs.getString(6));
                hab.setCod_estado(rs.getString(7));
              
            }
            return hab;
            
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

    public static boolean ModificarHabitacion(model.Habitacion hab) {
         Connection con = Conexion.conectar();
        try {

           
            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaHabitacion(?,?,?,?,?,?,?)}");
            ps.setString(1, hab.getCod_habitacion());
            ps.setString(2, hab.getNumero());
            ps.setFloat(3, hab.getPrecio());
            ps.setString(4, hab.getDescripcion());
            ps.setString(5, hab.getCod_tipoh());
            ps.setString(6, hab.getCod_nivel());
            ps.setString(7, hab.getCod_estado());
            if (ps.executeUpdate() > 0) {
             
                return true;
            } else {
              
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
        finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    public static int CantHabitacion() {
        Connection con = Conexion.conectar();
        try {
            String SQL = "SELECT COUNT(numero) as Cantidad FROM habitacion";

            PreparedStatement st = con.prepareStatement(SQL);
            ResultSet resultado = st.executeQuery();
            while (resultado.next()) {
              
                return resultado.getInt("Cantidad");
            }
           
            return 0;
        } catch (Exception e) {
            return 0;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    public static int HabReservadas() {
        Connection con = Conexion.conectar();
        try {

            PreparedStatement sp = con.prepareCall("call sp_CanHabReservadas");
            ResultSet res = sp.executeQuery();
            while (res.next()) {
               
                return res.getInt(1);
            }
          
            return 0;
        } catch (Exception e) {
            return 0;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

    public static int HabDisponibles() {
        Connection con = Conexion.conectar();
        try {

            PreparedStatement sp = con.prepareStatement("call sp_CantHabDisponibles");
            ResultSet res = sp.executeQuery();
            while (res.next()) {
         
                return res.getInt(1);
            }
            
            return 0;
        } catch (Exception e) {
            return 0;
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }

    }

    public static int HabOcupadas() {
        Connection con = Conexion.conectar();
        try {

            PreparedStatement sp = con.prepareStatement("call sp_CantHabOcupadas");
            ResultSet res = sp.executeQuery();
            while (res.next()) {

                return res.getInt(1);
            }

            return 0;
        } catch (SQLException e) {
            return 0;
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
