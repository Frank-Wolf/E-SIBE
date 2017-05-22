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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class RegistraApelaciones extends ActionSupport {

   private String date1, date2,username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
   
   Random rand = new Random();
   int  n = rand.nextInt(500) + 1;
   @Override
   public String execute() throws Exception{
      LoginBean lb = new LoginBean();
       lb.getConnection();
       int l = 0;
       /*Verify if the activity date exist*/
       SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yy");
       Date dte1 = formatter.parse(getDate1());
       Date dte2 = formatter.parse(getDate2());
       
       ResultSet rveri = lb.executeQuery("SELECT * FROM fecha_evaluaciones");
       while(rveri.next()){
           if((dte1.after(rveri.getDate("fecha_inicio")) && dte1.before(rveri.getDate("fecha_fin"))) ||
                   (dte1.after(rveri.getDate("fecha_inicio")) && dte1.before(rveri.getDate("fecha_fin")))){
                lb.closeConnection();
                return "denied";
            }
            else{
                l = 0;
            }
       }    
       /*Verify if the activity date exist END*/
       ResultSet rs = lb.executeQuery("SELECT fecha_inicio, fecha_fin FROM fecha_apelaciones");
       while(rs.next()) {
           lb.closeConnection();
           return "existe_evalu";
        }
       int ra = lb.executeUpdate("INSERT INTO fecha_apelaciones (id_fecha, fecha_inicio, fecha_fin, id_usuario) VALUES"
               + "(" + n + ", str_to_date('" + getDate1() + "', '%d-%m-%Y'), str_to_date('" + getDate2() + "', '%d-%m-%Y'), '" + username + "')");
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
