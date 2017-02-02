/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author le_as
 */
public class LoginAction extends ActionSupport {
     String usuario, password;

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
       @Override
    public String execute()
    {
        
        if(usuario.equals("Profesor"))
        {
            if(usuario.equals(password))
            {
             return "Profesor";
            }

            else {return "ERROR";}
        }
        else if(usuario.equals("Admin"))
        {
            if(usuario.equals(password))
            {
             return "Admin";
            }

            else {return "ERROR";}
        }
        
        else {return "ERROR";} 
    }
    
    public void validate()
    {
        if(usuario.equals(getPassword()))
        {
            
        }
        else
        {
            addActionError("huevos tu no eres ");
        }
    }
    
}


