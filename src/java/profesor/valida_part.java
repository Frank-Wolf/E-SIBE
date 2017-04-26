/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import com.opensymphony.xwork2.ActionSupport;

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
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();

            int acepta=lb.executeUpdate("update profesor_participa_en_plan set validado=1 where id_usuario='"+username+"' and  id_part='"+id_part+"' and validado=0" );
            if(acepta>0)
            {
                lb.closeConnection();
                return "test";
            }
            else
            {
                lb.closeConnection();
                addFieldError("id_alumno","Hay un problema");
                return "error";
            }
    }
  
}
