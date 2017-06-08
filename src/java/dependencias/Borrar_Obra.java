/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dependencias;

import java.sql.ResultSet;

/**
 *
 * @author le_as
 */
public class Borrar_Obra {
        private String id_obra,id_usuario;

    public String getId_obra() {
        return id_obra;
    }

    public void setId_obra(String id_obra) {
        this.id_obra = id_obra;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public Borrar_Obra(){}
    
    public String execute() throws Exception {
        int a = 0;
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        ResultSet rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_obra where id_obra='"+id_obra+"'");
        rs.next();
        a = rs.getInt(1);
        if(a == 1)
        {
            int val=lb.executeUpdate("DELETE FROM profesor_tiene_obra WHERE id_usuario='"+getId_usuario()+"' and id_obra='"+id_obra+"' and registrado=0");
            int val2=lb.executeUpdate("DELETE FROM obra WHERE id_obra='"+id_obra+"'");
            lb.closeConnection();
            return "borrar_exitoso";
        }
        else{
            int val=lb.executeUpdate("DELETE FROM profesor_tiene_obra WHERE id_usuario='"+getId_usuario()+"' and id_obra='"+id_obra+"' and registrado=0");
            
            lb.closeConnection();
            if (val>0) 
                return "borrar_exitoso";
            else 
                return "borrar_fallo"; 
        }
    }
    
}
