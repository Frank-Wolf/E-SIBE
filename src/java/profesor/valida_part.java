/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;

/**
 *
 * @author le_as
 */
public class valida_part extends ActionSupport
{
    String test;
    private String username, u_a,id_part;

   public String getU_a() {
        return u_a;
    }

    public void setU_a(String u_a) {
        this.u_a = u_a;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId_part() {
        return id_part;
    }

    public void setId_part(String id_part) {
        this.id_part = id_part;
    }
    public String execute() throws Exception 
    {
        if(id_part.equals(""))
        {
            addFieldError("id_part","Este campo es necesario");
            return ERROR;
        }
        
        if(u_a.equals(""))
        {
            addFieldError("u_a","Este campo es necesario");
            return ERROR;
        }

        
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        
        ResultSet val=lb.executeQuery("select * from part_plan_est where id_part ='"+id_part+"' and u_a='"+u_a+"'");
        while(val.next())
        {
            ResultSet prof_val=lb.executeQuery("select * from profesor_participa_en_plan where id_usuario="+username+" and id_part='"+id_part+"'");
            while(prof_val.next())
            {   
                ResultSet profd=lb.executeQuery("select * from profesor_participa_en_plan where id_usuario="+username+" and id_part='"+id_part+"' and validado=0");
                while(profd.next())
                {
                    lb.executeUpdate("update profesor_participa_en_plan set validado=1 where id_usuario="+username+" and id_part='"+id_part+"'");
                    lb.closeConnection();
                    return SUCCESS;
                }
                
                addFieldError("id_part","Esta Participacion ya fue registrada");
                lb.closeConnection();
                return ERROR;    
            }
            addFieldError("id_part","Esta Participacion no tiene relacion con usted");
            lb.closeConnection();
            return ERROR;
        }
        addFieldError("id_part","Esta Participacion no existe, verifique sus datos");
        lb.closeConnection();
        return ERROR;    
    }
}
