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
public class Borrar_reporte extends ActionSupport
{
    private String id_proyecto,id_usuario;

    public String getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(String id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public Borrar_reporte(){}
    
    @Override
    public String execute() throws Exception {
        int a = 0;
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        ResultSet rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto where id_proyecto='"+id_proyecto+"'");
        rs.next();
        a = rs.getInt(1);
        if(a == 1)
        {
            int val=lb.executeUpdate("DELETE FROM profesor_tiene_proyecto WHERE id_usuario='"+getId_usuario()+"' and id_proyecto='"+id_proyecto+"'");
            int val2=lb.executeUpdate("DELETE FROM proyecto WHERE id_proyecto='"+id_proyecto+"'");
            lb.closeConnection();
            return "borrar_exitoso";
        }
        else{
            int val=lb.executeUpdate("DELETE FROM profesor_tiene_proyecto WHERE id_usuario='"+getId_usuario()+"' and id_proyecto='"+id_proyecto+"'");
            
            lb.closeConnection();
            if (val>0) 
                return "borrar_exitoso";
            else 
                return "borrar_fallo"; 
        }
    }
    
}



    
    

    

    
    
    
            
        
      
