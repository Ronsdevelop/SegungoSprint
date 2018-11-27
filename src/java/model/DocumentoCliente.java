
package model;


public class DocumentoCliente {

    private String cod_tipodoc;

    public DocumentoCliente() {
        this.cod_tipodoc = "";
        this.tipodocum = "";
    }

    public DocumentoCliente(String cod_tipodoc, String tipodocum) {
        this.cod_tipodoc = cod_tipodoc;
        this.tipodocum = tipodocum;
    }
    private String tipodocum;

    public String getCod_tipodoc() {
        return cod_tipodoc;
    }

    public void setCod_tipodoc(String cod_tipodoc) {
        this.cod_tipodoc = cod_tipodoc;
    }

    public String getTipodocum() {
        return tipodocum;
    }

    public void setTipodocum(String tipodocum) {
        this.tipodocum = tipodocum;
    }

}
