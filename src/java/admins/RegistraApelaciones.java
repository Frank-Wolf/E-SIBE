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
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.util.Random;

public class RegistraApelaciones extends ActionSupport {

   private String date1, date2;
   Random rand = new Random();
   int  n = rand.nextInt(500) + 1;
   @Override
   public String execute() throws Exception{
      LoginBean lb = new LoginBean();
       lb.getConnection();
       ResultSet rs = lb.executeQuery("SELECT fecha_inicio, fecha_fin FROM fecha_apelaciones");
       while(rs.next()) {
           lb.closeConnection();
           return "existe_evalu";
        }
       int ra = lb.executeUpdate("INSERT INTO fecha_apelaciones (id_fecha, fecha_inicio, fecha_fin) VALUES"
               + "(" + n + ", str_to_date('" + getDate1() + "', '%d-%m-%Y'), str_to_date('" + getDate2() + "', '%d-%m-%Y'))");
       if(ra > 0){
           lb.closeConnection();
           //llamar a la función que asignará los profesores a los evaluadores
           return "success";
       }
       else{
           lb.closeConnection();
           return "fail";
        }
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
