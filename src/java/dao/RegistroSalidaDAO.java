/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.RegistroSalida;

/**
 *
 * @author Rony
 */
public class RegistroSalidaDAO {
    
      public static boolean RegistroSalida(RegistroSalida rg) {
        Connection con = Conexion.conectar();
        PreparedStatement pst = null;

        try {
            pst = con.prepareStatement("{call sp_IngresaRegistroSalida(?,?,?,?)}");
            pst.setString(1, rg.getCod_registro());
            pst.setString(2, rg.getFechaSalida());
            pst.setString(3, rg.getHoraSalida());
            pst.setString(4, rg.getInsidencias());                 
        
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
