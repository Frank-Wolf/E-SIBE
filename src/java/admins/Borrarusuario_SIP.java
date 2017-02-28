/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admins;

/**
 *
 * @author PsysacElrick
 */
import com.opensymphony.xwork2.ActionSupport;

public class Borrarusuario_SIP extends ActionSupport{
    
    private String id_prof;

    public String getId_prof() {
        return id_prof;
    }

    public void setId_prof(String nom_prof) {
        this.id_prof = nom_prof;
    }
    
    public Borrarusuario_SIP() {
    }
    @Override
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("DELETE FROM usuarios WHERE id_prof='"+getId_prof()+"'");
        lb.closeConnection();
        if (val>0) return "borrar_exitoso";
        else return "borrar_fallo"; 
    }   
}
