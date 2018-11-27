
package dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NivelDAO {
    public static boolean registrarNivel(model.Niveles n) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            PreparedStatement sp = con.prepareStatement("{call sp_ingresanivel(?)}");
            sp.setString(1, n.getNom_nivel());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }
public static ArrayList<model.Niveles> listarniveles() {
        try {
            String SQL = "select * from niveles";
            Connection con = Conexion.conectar();
            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<model.Niveles> lista = new ArrayList<>();
            model.Niveles niv;
            while (resultado.next()) {
                niv = new model.Niveles();
                niv.setCod_nivel(resultado.getString("cod_nivel"));
                niv.setNom_nivel(resultado.getString("nom_nivel"));
                
                lista.add(niv);
            }
            return lista;
        } catch (SQLException ex) {
            return null;
        }
    }

    public static boolean eliminanivel(model.Niveles niv) {
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            CallableStatement sp = con.prepareCall("{call sp_eliminanivel(?)}");
            sp.setString(1, niv.getCod_nivel());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public static model.Niveles getIdnivel(String id) throws SQLException {
       model.Niveles niv = new model.Niveles();
        try {
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("select * from niveles where cod_nivel=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                niv.setCod_nivel(rs.getString(1));
                niv.setNom_nivel(rs.getString(2));
                
                con.close();

            }
        } catch (SQLException ex) {

        }
        return niv;
    }
public static boolean modificarNivel(model.Niveles niv) {
        try {
            CallableStatement cs=null;
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_modificanivel(?,?)}");
            ps.setString(1,niv.getCod_nivel());
            ps.setString(2,niv.getNom_nivel());
           
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

