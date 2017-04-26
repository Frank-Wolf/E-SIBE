/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package email;

/**
 *
 * @author PsysacElrick
 */
import static com.opensymphony.xwork2.Action.ERROR;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class send_email extends ActionSupport {

   private int token;
   private String usuario;
   private String from="e.sibe2017a031@gmail.com";
   private String password="e_sibe031";
   private String to;
   private String subject="Sistema de recuperación de contraseñas de E-SIBE";
   private String body="Ingrese al siguiente link para cambiar su contraseña: http://localhost:8084/login/actualiza_pass.jsp?token=";//text where we gonna put the password
   private String e_address;

   static Properties properties = new Properties();
   static
   {
      properties.put("mail.smtp.host", "smtp.gmail.com");
      properties.put("mail.smtp.socketFactory.port", "465");
      properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.port", "465");
   }

   public String execute() 
   {
       //first, lets make a database connection
       Connection conn = null;
       String ret;
       try{
           String URL = "jdbc:mysql://localhost:3306/esibe";
           Class.forName("com.mysql.jdbc.Driver");
           ResultSet rs=null;
           conn = DriverManager.getConnection(URL, "root", "root");
           String sql = "SELECT * FROM usuario WHERE id_usuario="+usuario;//we look for the specific user
           PreparedStatement ps = conn.prepareStatement(sql);
           rs=ps.executeQuery(sql);
            while(rs.next()){
           e_address =rs.getString("email");
           token=rs.getInt("token");
            }
           ret = "test";
                }catch (Exception e) {
                    addFieldError("usuario","Su No. de empleado es incorrecto, intente nuevamente");
                    ret = ERROR;
                    System.out.println(e.getMessage());
                } finally {
                if (conn != null) {
                    try {
                        conn.close();
                        } catch (Exception e) {
                            
                        ret = ERROR;
                        }
                    }
                }
       to=e_address;
       //end connection to mysql
       body=body+token;/*user_password*/
       System.out.println(body);
       System.out.println(e_address);
       //now let's send the email 
       try
       {
           Session session = Session.getDefaultInstance(properties,  
            new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication 
            getPasswordAuthentication() {
            return new 
            PasswordAuthentication(from, password);
            }});

         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress(from));
         message.setRecipients(Message.RecipientType.TO, 
            InternetAddress.parse(to));
         message.setSubject(subject);
         message.setText(body);
         Transport.send(message);
      }
      catch(Exception e)
      {
         ret = ERROR;
         e.printStackTrace();
      }
      return ret;
   }

   public String getFrom() {
      return from;
   }

   public void setFrom(String from) {
      this.from = from;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getTo() {
      return to;
   }

   public void setTo(String to) {
      this.to = to;
   }

   public String getSubject() {
      return subject;
   }

   public void setSubject(String subject) {
      this.subject = subject;
   }

   public String getBody() {
      return body;
   }

   public void setBody(String body) {
      this.body = body;
   }

   public static Properties getProperties() {
      return properties;
   }

   public static void setProperties(Properties properties) {
      send_email.properties = properties;
   }
   
   public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getE_address() {
        return e_address;
    }

    public void setE_address(String e_address) {
        this.e_address = e_address;
    }


    public int getToken() {
        return token;
    }

    public void setToken(int token) {
        this.token = token;
    }
}
