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
import java.sql.ResultSet;

public class Borrarusuario_cofaa extends ActionSupport{
    
    private String id_usuario;

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String nom_prof) {
        this.id_usuario = nom_prof;
    }
    
    public Borrarusuario_cofaa() {
    }
    @Override
    public String execute() throws Exception {
        int a = 0;
        LoginBean lb = new LoginBean();
        lb.getConnection();
        ResultSet rs = lb.executeQuery("SELECT COUNT(*) FROM evaluador");
        rs.next();
        a = rs.getInt(1);
        if(a == 1)
            return "Al_menos_uno";
        else{
            int val2=lb.executeUpdate("DELETE FROM evaluador WHERE id_usuario='" + getId_usuario() + "'");
            int val=lb.executeUpdate("DELETE FROM usuario WHERE id_usuario='"+getId_usuario()+"'");
            lb.closeConnection();
            if (val>0) 
                return "borrar_exitoso";
            else 
                return "borrar_fallo"; 
        }
            
        
    }   
}

