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
import model.Cliente;

/**
 *
 * @author Rony
 */
public class ClienteDAO {

    public static ArrayList<model.Cliente> listarClientes() {
        Connection con = Conexion.conectar();
        try {
            String SQL = "select * from cliente";

            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<model.Cliente> listaCliente = new ArrayList<>();
            model.Cliente Clie;
            while (resultado.next()) {
                Clie = new model.Cliente();
                Clie.setCod_cliente(resultado.getString("cod_cliente"));
                Clie.setNombres(resultado.getString("nombres"));
                Clie.setApellidos(resultado.getString("apellidos"));
                Clie.setRasonsocial(resultado.getString("rason_social"));
                Clie.setTipo_doc(resultado.getString("cod_tipdoccl"));
                Clie.setDocumento(resultado.getString("documento"));
                Clie.setDireccion(resultado.getString("direccion"));
                Clie.setFono(resultado.getString("telefono"));
                Clie.setEmail(resultado.getString("email"));
                listaCliente.add(Clie);
            }

            return listaCliente;
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

    public static Cliente obCodigo(String id) throws SQLException {
        Connection con = Conexion.conectar();
        Cliente cli = new Cliente();
        try {

            PreparedStatement ps = con.prepareStatement("SELECT * FROM v_cliente WHERE CODIGO=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cli.setCod_cliente(rs.getString(1));
                cli.setNombres(rs.getString(2));
                cli.setApellidos(rs.getString(3));
                cli.setRasonsocial(rs.getString(4));
                cli.setTipo_doc(rs.getString(5));
                cli.setDocumento(rs.getString(6));
                cli.setDireccion(rs.getString(7));
                cli.setFono(rs.getString(8));
                cli.setEmail(rs.getString(9));

            }
            return cli;
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

    public static boolean RegistrarCliente(model.Cliente C) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement sp = con.prepareStatement("{call sp_IngresaCliente(?,?,?,?,?,?,?,?)}");
            sp.setString(1, C.getNombres());
            sp.setString(2, C.getApellidos());
            sp.setString(3, C.getRasonsocial());
            sp.setString(4, C.getTipo_doc());
            sp.setString(5, C.getDocumento());
            sp.setString(6, C.getDireccion());
            sp.setString(7, C.getFono());
            sp.setString(8, C.getEmail());

            if (sp.executeUpdate() > 0) {

                return true;

            } else {
                return false;
            }

        } catch (Exception e) {
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

    public static boolean ModificaCliente(model.Cliente cli) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;
            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaCliente(?,?,?,?,?,?,?,?,?)}");
            ps.setString(1, cli.getCod_cliente());
            ps.setString(2, cli.getNombres());
            ps.setString(3, cli.getApellidos());
            ps.setString(4, cli.getRasonsocial());
            ps.setString(5, cli.getTipo_doc());
            ps.setString(6, cli.getDocumento());
            ps.setString(7, cli.getDireccion());
            ps.setString(8, cli.getFono());
            ps.setString(9, cli.getEmail());
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

    public static boolean eliminacliente(model.Cliente cli) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            CallableStatement sp = con.prepareCall("{call sp_eliminacliente(?)}");
            sp.setString(1, cli.getCod_cliente());
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
    

}
