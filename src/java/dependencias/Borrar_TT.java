/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dependencias;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;

/**
 *
 * @author le_as
 */
public class Borrar_TT extends ActionSupport {
         private String id_TT,id_usuario;

    public String getId_tt() {
        return id_TT;
    }

    public void setId_TT(String id_TT) {
        this.id_TT = id_TT;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public Borrar_TT (){}
    
    public String execute() throws Exception {
        int a = 0;
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        
            int val=lb.executeUpdate("DELETE FROM profesor_tiene_tt WHERE id_usuario='"+getId_usuario()+"' and id_TT='"+id_TT+"' and registrado=0");
            int val2=lb.executeUpdate("DELETE FROM tt WHERE id_TT='"+id_TT+"'");
       
        
            
            lb.closeConnection();
            if (val>0 && val2>0) 
                return "borrar_exitoso";
            else 
                return "borrar_fallo"; 
        }
    }
       

