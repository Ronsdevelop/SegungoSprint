/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.RegistroHabitacion;

/**
 *
 * @author Rony
 */
public class RegistroHabitacionDAO {

    public static boolean RegistraHabitacion(RegistroHabitacion rg) {
        Connection con = Conexion.conectar();
        PreparedStatement pst = null;

        try {
            pst = con.prepareStatement("{call sp_IngresaRegistroHabitacion(?,?,?,?,?,?,?)}");
            pst.setString(1, rg.getCod_cliente());
            pst.setString(2, rg.getCod_habitacion());
            pst.setString(3, rg.getCod_empleado());
            pst.setString(4, rg.getFechaIngreso());
            pst.setString(5, rg.getHoraIngreso());
            pst.setInt(6, rg.getAdultos());
            pst.setInt(7, rg.getNinos());
        
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
