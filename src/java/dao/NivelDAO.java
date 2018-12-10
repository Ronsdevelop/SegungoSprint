package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NivelDAO {

    public static boolean registrarNivel(model.Niveles n) {
        Connection con = Conexion.conectar();
        try {
           
          
            PreparedStatement sp = con.prepareStatement("{call sp_IngresaNivel(?)}");
            sp.setString(1, n.getNom_nivel());
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

    public static ArrayList<model.Niveles> listarniveles() {
        Connection con = Conexion.conectar();
        try {
            String SQL = "select * from nivel";
          
            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<model.Niveles> lista = new ArrayList<>();
            model.Niveles niv;
            while (resultado.next()) {
                niv = new model.Niveles();
                niv.setCod_nivel(resultado.getString("cod_nivel"));
                niv.setNom_nivel(resultado.getString("piso"));

                lista.add(niv);
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

    public static boolean eliminanivel(model.Niveles niv) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;
           
            CallableStatement sp = con.prepareCall("{call sp_EliminaNivel(?)}");
            sp.setString(1, niv.getCod_nivel());
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

    public static model.Niveles getIdnivel(String id) throws SQLException {
        Connection con = Conexion.conectar();
        model.Niveles niv = new model.Niveles();
        try {        
            
            PreparedStatement ps = con.prepareStatement("select * from nivel where cod_nivel=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                niv.setCod_nivel(rs.getString(1));
                niv.setNom_nivel(rs.getString(2));

            }
            return niv;
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

    public static boolean modificarNivel(model.Niveles niv) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaNivel(?,?)}");
            ps.setString(1, niv.getCod_nivel());
            ps.setString(2, niv.getNom_nivel());

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

    public static String getPiso(String cod) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            String consulta = ("SELECT piso FROM nivel WHERE cod_nivel = ?");
            PreparedStatement ps = con.prepareStatement(consulta);
            ps.setString(1, cod);
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                return res.getString("piso");
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

    public static int CanNiveles() {
        Connection con = Conexion.conectar();
        try {

            String SQL = ("SELECT COUNT(piso) AS PISOS FROM nivel");
            PreparedStatement sp = con.prepareStatement(SQL);
            ResultSet rs = sp.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
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

}
