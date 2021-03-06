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
import java.sql.ResultSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class regusuario_cofaa extends ActionSupport{
    
   private String user;
   private int matricula;
   private String u_a,aux;
   private int periodo = 0;
   private String password;
   private String email;
   private String idTypeUsuario;
   private int counter;
    
    public regusuario_cofaa() {
    }
    
   private static Pattern pswNamePtrn = Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%_-]).{6,15})");
   public static String validatePassword(String paswrd){//
         
        Matcher mtch = pswNamePtrn.matcher(paswrd);
        if(mtch.matches()){
            return SUCCESS;
        }
        else
            return "test";
    }
   
    public String execute() throws Exception {
        
        aux=Integer.toString(matricula);
        System.out.println(aux);
        String ret = SUCCESS;
      if (user == null || user.trim().equals(""))
      {
         addFieldError("user", "El nombre es requerido");
         return "test";
      }
      
      if(matricula == 0)
      {
          addFieldError("matricula","El No. de empleado es requerido");
         return "test";
      }
      
      
      
      if(Integer.toString(matricula).length() > 10)
      {
          addFieldError("matricula","El No. de empleado es erróneo");
       return "test";
      }
      
      ret = validatePassword(password);
      if(ret == "test"){
          addFieldError("password", "La contraseña debe tener al menos 6 caracteres, "
                  + "máximo 15 y un alfanumérico, caracter especial y un número");
          return "test";
      }
      System.out.println(counter);
      if(counter>=30){
          addFieldError("user", "El número máximo de usuarios es de 3");
          return "test";
      }
      
      if(u_a.equals("-1"))
      {
          addFieldError("u_a", "Dependencia necesaria");
          return "test";
      }
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int aux = 0, periodo = 0;
        ResultSet rs = lb.executeQuery("SELECT * FROM evaluador");
        while(rs.next()){
            periodo = rs.getInt("periodo_actual");
            if(periodo > aux)
                aux = periodo;
            else
                aux = aux;
        }
        int val=lb.executeUpdate("INSERT INTO usuario(id_usuario,id_type_usuario,nom_usuario,email, password,u_a,token) "
                + "VALUES ('"+getMatricula()+"', "+getIdTypeUsuario()+", '"+getUser()+"','"+getEmail()+"' , '"+getPassword()+"', '"+getU_a()+"',1);");
        int val2=lb.executeUpdate("INSERT INTO evaluador (id_usuario, periodo_actual) VALUES ('" + getMatricula() + "', " + periodo + ")");
        lb.closeConnection();
        if (val > 0) 
            return "test";
        else 
            return "test"; 
    }   
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
   
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getU_a() {
        return u_a;
    }

    public void setU_a(String u_a) {
        this.u_a = u_a;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getIdTypeUsuario() {
        return idTypeUsuario;
    }

    public void setIdTypeUsuario(String idTypeUsuario) {
        this.idTypeUsuario = idTypeUsuario;
    }

    public int getCounter() {
        return counter;
    }

    public void setCounter(int counter) {
        this.counter = counter;
    }
}
