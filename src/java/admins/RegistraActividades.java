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
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.sql.*;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Random;

public class RegistraActividades extends ActionSupport {

   private String date1, date2,username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
   
   
   Random rand = new Random();
   int  n = rand.nextInt(500) + 1;
   public String execute() {
      String ret = SUCCESS;
      Connection conn = null;
      try {
         String URL = "jdbc:mysql://localhost:3306/esibe";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(URL, "root", "root");
         String sql = "insert into fecha_actividades (id_fecha, fecha_inicio, fecha_fin,id_usuario) values ";//probar con select*
         sql+=" (?, str_to_date(?, '%d-%m-%Y'), str_to_date(?, '%d-%m-%Y'),'"+username+"')";
         System.out.println(date1);
         System.out.println(username);
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setInt(1, n);
         ps.setString(2, date1);
         ps.setString(3, date2);
         
         int rs = ps.executeUpdate();
      } catch (Exception e) {
         ret = ERROR;
         System.out.println(e.getMessage());
      } finally {
         if (conn != null) {
            try {
               conn.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
         }
      }
      return ret;
   }
   public String getDate1() {
        return date1;
   }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public String getDate2() {
        return date2;
    }

    public void setDate2(String date2) {
        this.date2 = date2;
    }
    

}

