/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import model.Limpieza;

/**
 *
 * @author Rony
 */
public class LimpiezaDAO {
    
     public static boolean RegistroLimpieza(Limpieza Lim) {
        Connection con = Conexion.conectar();
        PreparedStatement pst = null;

        try {
            pst = con.prepareStatement("{call sp_RegistraLimpieza(?,?,?,?,?)}");
            pst.setString(1, Lim.getCoc_emplea());
            pst.setString(2, Lim.getFecha_lim());
            pst.setString(3, Lim.getHora_lim());
            pst.setString(4, Lim.getInsidencias());                 
            pst.setString(5, Lim.getCod_hab());                 
        
            if(pst.executeUpdate() > 0) {
                return true;
            }else{
                return false;
            }

        } catch (SQLException e) {
            return false;
        }finally{
            try {
                if (con != null) {
                    con.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
            }
        }

    }
    
}
