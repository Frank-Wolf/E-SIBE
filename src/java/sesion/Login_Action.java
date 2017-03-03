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
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



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
            ////////////////////////Proceso para determinar a qué interfaz irá el profesor
            if(type.equals("Profesor")){//Veremos, por medio de validaciones a las fechas 
                //existentes en la base de datos, a qué interfaz será dirigido el profesor
                //Connection conn = null;
                //String ret;
                Date date_ini = null, date_fin = null, date_curr = new Date();
                try{
                    String URL = "jdbc:mysql://localhost:3306/prototipo";
                    Class.forName("com.mysql.jdbc.Driver");
                    ResultSet rs=null;
                    conn = DriverManager.getConnection(URL, "root", "root");
                    String sql = "select * from fecha_actividades";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    rs=ps.executeQuery(sql);
                    while(rs.next()){
                        date_ini=rs.getDate("fecha_inicio");
                        date_fin=rs.getDate("fecha_fin"); 
                    }
                    ret = "profesor";
                }catch (Exception e) {
                    ret = "error";
                    System.out.println(e.getMessage());
                } finally {
                if (conn != null) {
                    try {
                        conn.close();
                        } catch (Exception e) {
                        System.out.println(date_curr);
                        }
                    }
                }
                if(date_curr.after(date_ini) && date_curr.before(date_fin))
                    ret = "profesor";
                else if(date_curr.before(date_ini) || date_curr.after(date_fin))
                    ret = "profesor_noac";
                //System.out.println(date_curr);
                return ret;
            }
            /////////////////////////////aquí termina el proceso del profesor
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

