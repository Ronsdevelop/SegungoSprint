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
import model.DocumentoCliente;

/**
 *
 * @author Rony
 */
public class TipoDocDAO {

    public static boolean RegistraTipoDoc(DocumentoCliente T) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement sp = con.prepareStatement("{call sp_IngresaTipoDocCliente(?)}");
            sp.setString(1, T.getTipodocum());
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

    public static ArrayList<DocumentoCliente> ListarDoc() {
        Connection con = Conexion.conectar();
        try {
            String SQL = "select * from tipo_doccliente";

            PreparedStatement st = con.prepareCall(SQL);
            ResultSet resultado = st.executeQuery();
            ArrayList<DocumentoCliente> listaDoc = new ArrayList<>();
            DocumentoCliente Doc;
            while (resultado.next()) {
                Doc = new DocumentoCliente();
                Doc.setCod_tipodoc(resultado.getString("cod_tipdoccl"));
                Doc.setTipodocum(resultado.getString("documento"));
                listaDoc.add(Doc);
            }
            return listaDoc;
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

    public static String getDoc(String cod) {
        Connection con = Conexion.conectar();
        try {
            String SQL = "SELECT documento FROM tipo_doccliente WHERE cod_tipdoccl=?";

            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, cod);
            ResultSet resultado = st.executeQuery();
            while (resultado.next()) {
                return resultado.getString("documento");
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

    public static boolean ModificaTipoDocumento(DocumentoCliente Doc) {
        Connection con = Conexion.conectar();
        try {
            CallableStatement cs = null;

            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaDocCliente(?,?)}");
            ps.setString(1, Doc.getCod_tipodoc());
            ps.setString(2, Doc.getTipodocum());

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

    public static boolean EliminaDoc(DocumentoCliente doc) {
        Connection con = Conexion.conectar();
        try {
            PreparedStatement ps = con.prepareStatement("{call sp_EliminaDocCliente(?)}");
            ps.setString(1, doc.getCod_tipodoc());
            if (ps.executeUpdate() > 0) {
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
    
    public static int nroFila(String doc){
        
        Connection con = Conexion.conectar();
        try {
            PreparedStatement sp = con.prepareStatement("{call sp_DevuelveFila(?)}");           
            sp.setString(1, doc);
             ResultSet rs = sp.executeQuery();
             if (rs.next()) {
                 return rs.getInt(1);
                
            }
             return 0;
            
        } catch (Exception e) {
            return 0;
        }finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                }
            }
        }
    }

}
