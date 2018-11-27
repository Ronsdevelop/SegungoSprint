package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Empleados;
import model.TipoEmpleado;

public class Consultas extends Conexion {
    
    public Empleados getUsuario(String usuario, String clave) throws SQLException {
        PreparedStatement pst = null;
        ResultSet rs = null;
        Connection con = Conexion.conectar();
        String consulta = "select * from empleados where username= ? and password= ? and  estado='1'";
        pst = con.prepareStatement(consulta);
        pst.setString(1, usuario);
        pst.setString(2, clave);
        rs = pst.executeQuery();
        Empleados Em = null;
        if (rs.next()) {
            Em = new Empleados();
            Em.setCod_empleado(rs.getString(1));
            Em.setNombres(rs.getString(2));
            Em.setApellidos(rs.getString(3));
            Em.setCod_tipoempleado(rs.getString(10));
            
        }
        con.close();
        return Em;
    }
    
    public TipoEmpleado getCargo(String cod) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = Conexion.conectar();
        String Cons = "select * from tipo_empleado where cod_tipoem= ? ";
        ps = con.prepareStatement(Cons);
        ps.setString(1, cod);
        rs = ps.executeQuery();
        TipoEmpleado Tip = null;
        if (rs.next()) {
            Tip = new TipoEmpleado();
            Tip.setCod_temp(cod);
            Tip.setTempleado(rs.getString(2));
            
        }
        con.close();
        return Tip;
        
    }
    
}
