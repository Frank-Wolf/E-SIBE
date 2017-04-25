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
public class valida_proyecto extends ActionSupport
{
    String test;
    private String username, rol_profesor;
    private String id_proyecto;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRol() {
        return rol_profesor;
    }

    public void setRol(String rol_profesor) {
        this.rol_profesor = rol_profesor;
    }

    public String getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(String id_proyecto) {
        this.id_proyecto = id_proyecto;
    }
    
    public String execute() throws Exception {
    
         profesor.LoginBean lb = new profesor.LoginBean();
            lb.getConnection();
            
            if(lb.valida_proyecto(username,id_proyecto))
            {
                System.out.println("Huevos");
                int acepta=lb.executeUpdate("update profesor_tiene_proyecto set validado=1 where id_usuario='"+getUsername()+"';" );
                if(acepta>0)
                {
                    lb.closeConnection();
                    return "test";
                }
                else
                {
                    lb.closeConnection();
                    addFieldError("id_obra","Hay un problema");
                    return "error";
                }
            }


            else
            { 
                addFieldError("id_obra","Hay un problema con tus datos o quizas ya fue registrada");
                lb.closeConnection();
                return "error";
            } 
        }
       
        
     
}
