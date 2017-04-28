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
import org.apache.struts2.interceptor.SessionAware;//Session control
import org.apache.struts2.dispatcher.SessionMap;//Session control
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class Login_Action extends ActionSupport implements SessionAware{
    
    private String usuario;
    private String pass;
    private String type;
    //private Map<String, Object> sessionMap;
    SessionMap<String, String> sessionMap;
    
    @Override
    public void setSession(Map map) {
        sessionMap=(SessionMap)map;  
        sessionMap.put("login","true");  
        } 
     
    
    /*@Override
    public void setSession(Map<String, Object> sessionMap) //recuperar la sesion
    {
    this.sessionMap = sessionMap;
    } */   
    
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
        LoginBean lb=new LoginBean(), ln = new LoginBean();
        if(lb.validateUser(usuario, pass))
        {
            type=sb.getUser(usuario, pass);
            sessionMap.put("username", usuario);
            sessionMap.put("type",type);
            ////////////////////////Proceso para determinar a qué interfaz irá el profesor
            if(type.equals("11")){//Veremos, por medio de validaciones a las fechas 
                //existentes en la base de datos, a qué interfaz será dirigido el profesor
                //Connection conn = null;
                //String ret;
                Date date_ini = null, date_fin = null, date_curr = new Date();
                ln.getConnection();
                ResultSet rs = ln.executeQuery("SELECT * FROM fecha_actividades");
                while(rs.next()){
                        date_ini=rs.getDate("fecha_inicio");
                        date_fin=rs.getDate("fecha_fin"); 
                    }
                ret = "profesor_noac";
                ln.closeConnection();
                if(date_ini == null)
                    return ret;
                if(date_curr.after(date_ini) && date_curr.before(date_fin))
                    ret = "profesor";
                else if(date_curr.before(date_ini) || date_curr.after(date_fin))
                    ret = "profesor_noac";
                //System.out.println(date_curr);
                return ret;
            }
            /////////////////////////////aquí termina el proceso del profesor
            
            //administradores
            if(type.equals("1")) //antes: admin_cofaa
                return "admin_cofaa";
            
            if(type.equals("2")) //antes: admin_sip
                return "admin_sip";
            
            if(type.equals("3")) //antes: admin_inda
                return "admin_inda";
            
            if(type.equals("4")) //antes: admin_prof
                return "admin_prof";
            
            if(type.equals("5")) //antes: admin_escom
                return "admin_escom";
            if(type.equals("13")) //antes: admin_escom
                return "admin_DES";
            if(type.equals("12")) //antes: admin_escom
                return "admin_DEMS";
            // Usuarios
            if(type.equals("6")) //antes:usuario_cofaa
                return "usuario_cofaa";
            
            if(type.equals("7")) //antes:usuario_sip
                return "usuario_sip";
            
            if(type.equals("8")) //antes: usuario_inda
                return "usuario_inda";
            
            if(type.equals("9")) //antes: usuario_catt
                return "usuario_catt";
            if(type.equals("usuario_ua"))
                return "usuario_ua";
            if(type.equals("10")) //antes: usuario_ss
                return "usuario_ss";
            if(type.equals("usuario_repua"))
                return "usuario_repua";
            
            if(type.equals("15"))
                return "usuario_DES";
            if(type.equals("14"))
                return "usuario_DEMS";
            
            else
            {
                addFieldError("password"," Tus datos son erróneos ");
                return "test";       
            }
                
        }
        else
            {
                addFieldError("usuario","Tus datos son erróneos");
                return "test";       
            }
    }
    
        public String logout(){ 
            sessionMap.invalidate();  
            return "test";  
        }  
        
       
    
}

