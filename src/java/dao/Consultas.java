package dao;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import model.Empleados;
import model.TipoEmpleado;

public class Consultas extends Conexion {

    private CallableStatement Cst;
    private ResultSet R;

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
            Em.setCod_empleados(rs.getString(1));
            Em.setNombres(rs.getString(2));
            Em.setApellidos(rs.getString(3));
            Em.setCod_tipoem(rs.getInt(10));
        }
        con.close();
        return Em;
    }

    public TipoEmpleado getCargo(int cod) throws SQLException {
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = Conexion.conectar();
        String Cons = "select * from tipo_empleado where cod_tipoem= ? ";
        ps = con.prepareStatement(Cons);
        ps.setInt(1, cod);
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

    public DefaultTableModel ListaHabOcupadas(Connection Cn) {
        try {

            DefaultTableModel c;
            String[] Titulos = {"Cliente:", "Nro Documento:", "Habitacion:", "Tipo Habitacion:", "F. Ingreso:", "H. Ingreso:"};
            Cst = Cn.prepareCall("call sp_HabitacionesOcupadas;");
            Cn.setAutoCommit(false);
            R = Cst.executeQuery();
            c = new DefaultTableModel(null, Titulos);
            while (R.next()) {
                Object dato[] = new Object[6];
                for (int i = 0; i < 6; i++) {
                    dato[i] = R.getString(i + 1);
                }
                c.addRow(dato);
            }
            Cn.close();
            return c;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            return null;
        }

    }

    public DefaultTableModel Listaniveles(Connection Cn) {
        try {
            DefaultTableModel c;
            String[] Titulos = {"codnivel", "niveles:"};
            Cst = Cn.prepareCall("SELECT piso,cod_nivel FROM nivel;");
            Cn.setAutoCommit(false);
            R = Cst.executeQuery();
            c = new DefaultTableModel(null, Titulos);
            while (R.next()) {
                Object dato[] = new Object[2];
                for (int j = 0; j < 2; j++) {
                    dato[j] = R.getString(j + 1);
                }
                c.addRow(dato);
            }
            Cn.close();
            return c;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            return null;
        }

    }

    public DefaultTableModel Listaestado(Connection Cn) {
        try {
            DefaultTableModel c;
            String[] Titulos = {"codestado", "estado:"};
            Cst = Cn.prepareCall("SELECT cod_estado,estado_habitacion FROM estado_habitacion;");
            Cn.setAutoCommit(false);
            R = Cst.executeQuery();
            c = new DefaultTableModel(null, Titulos);
            while (R.next()) {
                Object dato[] = new Object[2];
                for (int j = 0; j < 2; j++) {
                    dato[j] = R.getString(j + 1);
                }
                c.addRow(dato);
            }
            Cn.close();
            return c;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            return null;
        }

    }

    public DefaultTableModel Lishabitacion(Connection Cn) {
        try {
            DefaultTableModel c;
            String[] Titulos = {"numero", "codnivel:", "codestado:", "codigo:", "precio:", "tipohabita:"};
            Cst = Cn.prepareCall("SELECT numero,cod_nivel,cod_estado,cod_habitacion,precio, cod_tipoh FROM habitacion;");
            Cn.setAutoCommit(false);
            R = Cst.executeQuery();
            c = new DefaultTableModel(null, Titulos);
            while (R.next()) {
                Object dato[] = new Object[6];
                for (int j = 0; j < 6; j++) {
                    dato[j] = R.getString(j + 1);
                }
                c.addRow(dato);
            }
            Cn.close();
            return c;
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex);
            return null;
        }

    }

    public DefaultTableModel RegistroEntrada(Connection con) {
        try {
            DefaultTableModel T;
            String[] Titulos = { "cod_registro:", "cliente:", "fehaingreso:", "horaingreso:","numero:"};
            Cst = con.prepareCall("call sp_retornaRegistroHabitacion;");
          
            con.setAutoCommit(false);
            R = Cst.executeQuery();
            T = new DefaultTableModel(null, Titulos);
            while (R.next()) {
                Object dato[] = new Object[5];
                for (int i = 0; i < 5; i++) {
                    dato[i] = R.getString(i + 1);
                }
                T.addRow(dato);
            }
            con.close();
            return T;
        } catch (SQLException e) {
            return null;
        }

    }

    public ArrayList<String> RegistroEntrada2() {
        Connection con = Conexion.conectar();
        try {

            ResultSet res = null;
            PreparedStatement pst = con.prepareStatement("{call sp_retornaRegistroHabitacion}");
        
            res = pst.executeQuery();
            ArrayList<String> list = new ArrayList<>();
            while (res.next()) {
                list.add(res.getString(1));
                list.add(res.getString(2));
                list.add(res.getString(3));
                list.add(res.getString(4));

            }
            return list;

        } catch (SQLException e) {
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

}
