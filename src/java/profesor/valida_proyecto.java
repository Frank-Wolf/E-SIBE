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
        
        if(id_proyecto.equals(""))
        {
            addFieldError("id_proyecto","Este campo es necesario");
            return ERROR;
        }
        
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        
        ResultSet pr=lb.executeQuery("select * from profesor_tiene_proyecto where id_usuario="+username+" and id_proyecto='"+id_proyecto+"'");
        while(pr.next())
        {   
            if(pr.getInt("validado")==1)
            {
                addFieldError("id_proyecto","Este Proyecto ya habia sido validado");
                lb.closeConnection();
                return ERROR;
            }
            else
            {
                lb.executeUpdate("update profesor_tiene_proyecto set validado=1 where id_usuario='"+getUsername()+"'and id_proyecto='"+id_proyecto+"'" );
                lb.closeConnection();
                return SUCCESS;
            }
        }
                    
        addFieldError("id_proyecto","No se encontro vinculo entre usted y el proyecto, comuniquese a SIP");
        lb.closeConnection();
        return "error";
            
    } 
}
