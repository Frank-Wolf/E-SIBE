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
public class Borrar_Evento extends ActionSupport {
        private String id_publicacion,id_usuario,id_evento;

    public String getId_evento() {
        return id_evento;
    }

    public void setId_evento(String id_evento) {
        this.id_evento = id_evento;
    }

    public String getId_publicacion() {
        return id_publicacion;
    }

    public void setId_publicacion(String id_publicacion) {
        this.id_publicacion = id_publicacion;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
    public Borrar_Evento(){}
    
    public String execute() throws Exception {
        int a = 0;
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        ResultSet rs = lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_pub where id_evento='"+id_evento+"'");
        rs.next();
        a = rs.getInt(1);
        System.out.println(a);
        if(a == 1)
        {
            int val=lb.executeUpdate("DELETE FROM profesor_tiene_pub WHERE id_usuario="+id_usuario+" and id_publicacion='"+id_publicacion+"' and id_evento='"+id_evento+"'");
            int val2=lb.executeUpdate("DELETE FROM publicacion WHERE id_publicacion='"+id_publicacion+"' and id_evento='"+id_evento+"'");
            int val22=lb.executeUpdate("DELETE FROM profesor_participa_ev WHERE id_usuario="+id_usuario+"  and id_evento='"+id_evento+"'");
            int val3=lb.executeUpdate("DELETE FROM evento_academico WHERE id_evento='"+id_evento+"'");
            lb.closeConnection();
            return "borrar_exitoso";
        }
        else{
            int val=lb.executeUpdate("DELETE FROM profesor_tiene_pub WHERE id_usuario="+id_usuario+" and id_publicacion='"+id_publicacion+"'");
            int val22=lb.executeUpdate("DELETE FROM profesor_participa_ev WHERE id_usuario="+id_usuario+"  and id_evento='"+id_evento+"'");
            lb.closeConnection();
            if (val>0) 
                return "borrar_exitoso";
            else 
                return "borrar_fallo"; 
        }
    }
}
