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
public class Borrar_PART extends ActionSupport
{
    private String id_part,id_usuario,asignatura,u_a;

    public String getId_part() {
        return id_part;
    }

    public void setId_part(String id_part) {
        this.id_part = id_part;
    }

    public String getAsignatura() {
        return asignatura;
    }

    public void setAsignatura(String asignatura) {
        this.asignatura = asignatura;
    }

    public String getU_a() {
        return u_a;
    }

    public void setU_a(String u_a) {
        this.u_a = u_a;
    }

    
    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public Borrar_PART(){}
    
    @Override
    public String execute() throws Exception {
        int a = 0;
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        ResultSet as=lb.executeQuery("SELECT COUNT(*) FROM part_plan_est where asignatura='"+asignatura+"' and u_a='"+u_a+"'");
        
        as.next();
        a = as.getInt(1);
        if(a == 1)
        {
            int val2=lb.executeUpdate("DELETE FROM profesor_participa_en_plan WHERE id_part="+id_part+" and id_usuario='"+id_usuario+"' and registrado=0");
            int val=lb.executeUpdate("DELETE FROM part_plan_est WHERE id_part='"+id_part+"' and asignatura='"+asignatura+"' and u_a='"+u_a+"'");
            
            lb.closeConnection();
            return "borrar_exitoso";
        }
        else{
            int val2=lb.executeUpdate("DELETE FROM profesor_participa_en_plan WHERE id_part='"+id_part+"' and id_usuario='"+id_usuario+"' and registrado=0");
            
            lb.closeConnection();
            if (val2>0) 
                return "borrar_exitoso";
            else 
                return "borrar_fallo"; 
        }
    }
}
    