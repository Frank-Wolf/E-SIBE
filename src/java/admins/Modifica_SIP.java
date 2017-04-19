/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admins;

/**
 *
 * @author PsysacElrick
 */
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Modifica_SIP extends ActionSupport {
    private String id;
    private String usuario;
    private String matricula;
    private String password;
    String ret = "modificar_exitoso";

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    private static Pattern pswNamePtrn = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%_-]).{6,15})");
    
    public static String validatePassword(String paswrd){//
         
        Matcher mtch = pswNamePtrn.matcher(paswrd);
        if(mtch.matches()){
            return "modificar_exitoso";
        }
        else
            return "test";
    }
    
    
    public Modifica_SIP() {
    }
    @Override 
    public String execute() throws Exception {
        if (usuario == null || usuario.trim().equals(""))
      {
         addFieldError("user", "El nombre es obligatorio");
         return "test";///probar con cofaa
      }
      ret = validatePassword(password);
      if(ret == "test"){
          addFieldError("password", "La contraseña debe tener al menos 6 caracteres, "
                  + "máximo 15 y un alfanumérico, un caracter especial y un número");
          return ret;
      }
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("UPDATE usuario SET nom_usuario='"+getUsuario()+"',id_usuario='"+getMatricula()+"', password='"+getPassword()+"' WHERE id_usuario='"+getId()+"'");
        if(val>0) return ret;
        else return "modificar_fallo";
    }
    
}
