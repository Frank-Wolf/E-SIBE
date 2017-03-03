/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sesion;

/**
 *
 * @author le_as
 */
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map; //tenemos una entrada y nos va a dar una salida
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.interceptor.SessionAware;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Login_Action extends ActionSupport implements SessionAware{
    
    public Login_Action() {
    }
    private String usuario;
    private String pass;
    private String type;
    private Map<String, Object> sessionMap;
     
    
    @Override
    public void setSession(Map<String, Object> sessionMap) //recuperar la sesion
    {
    this.sessionMap = sessionMap;
    }    
    
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
     
    
    @Override
    public String execute() throws Exception {
        String ret = SUCCESS;
      Connection conn = null;
      
         if (usuario == null || usuario.trim().equals("") || pass.trim().equals("") || pass== null )
        {   
            if(usuario == null || usuario.trim().equals(""))
            {   
                addFieldError("usuario","Por favor escribe tu No. de empleado");
            }
            if(pass == null || pass.trim().equals(""))
            {   
                addFieldError("pass","Por favor escribe tu password");
            }
             return "test";///probar con cofaa
        }
       
      
//         
//        if (pass == null || pass.trim().equals(""))
//        {
//             addFieldError("pass","Contraseña erronea... ¿a quien quieres engañar ?");
//             return "test";
//        }
        
        SesionBean sb=new SesionBean();
        LoginBean lb=new LoginBean();
        if(lb.validateUser(usuario, pass))
        {
            type=sb.getUser(usuario, pass);
            sessionMap.put("username", usuario);
            sessionMap.put("type",type);
            if(type.equals("Profesor"))
                return "profesor";
            if(type.equals("usuario_sip"))
                return "usuario_sip";
            if(type.equals("usuario_inda"))
                return "usuario_inda";
            if(type.equals("usuario_catt"))
                return "usuario_catt";
            if(type.equals("usuario_ua"))
                return "usuario_ua";
            if(type.equals("usuario_ss"))
                return "usuario_ss";
            if(type.equals("usuario_repua"))
                return "usuario_repua";
            if(type.equals("usuario_cofaa"))
                return "usuario_cofaa";
            //administradores
            if(type.equals("admin_sip"))
                return "admin_sip";
            if(type.equals("admin_inda"))
                return "admin_inda";
            if(type.equals("admin_cofaa"))
                return "admin_cofaa";
            if(type.equals("admin_prof"))
                return "admin_prof";
            if(type.equals("admin_escom"))
                return "admin_escom";
            else
            {
                addFieldError("password","tus datos son erróneos");
                return "test";       
            }
                
        }
        else
            {
                addFieldError("usuario","tus datos son erróneos");
                return "test";       
            }
    }
        
       
    
}

