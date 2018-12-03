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
        try {
            CallableStatement cs = null;
            Connection con = Conexion.conectar();
            PreparedStatement sp = con.prepareStatement("{call sp_IngresaTipoDocCliente(?)}");
            sp.setString(1, T.getTipodocum());
            if (sp.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            return false;
        }
    }

    public static ArrayList<DocumentoCliente> ListarDoc() {
        try {
            String SQL = "select * from tipo_doccliente";
            Connection con = Conexion.conectar();
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
        }

    }

    public static String getDoc(String cod) {
        try {
            String SQL = "SELECT documento FROM tipo_doccliente WHERE cod_tipdoccl=?";
            Connection con = Conexion.conectar();
            PreparedStatement st = con.prepareStatement(SQL);
            st.setString(1, cod);
            ResultSet resultado = st.executeQuery();
            while (resultado.next()) {
             return resultado.getString("documento");
            }
         return "--";
        } catch (Exception e) {
            return "--";
        }

    }
    
    
    public static boolean ModificaTipoDocumento(DocumentoCliente Doc){
          try {
            CallableStatement cs = null;
            Connection con = dao.Conexion.conectar();
            PreparedStatement ps = con.prepareStatement("{call sp_ActualizaDocCliente(?,?)}");
            ps.setString(1, Doc.getCod_tipodoc());
            ps.setString(2, Doc.getTipodocum());      

            if (ps.executeUpdate() > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {

        }
        return false; 
    }

}
