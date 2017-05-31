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
import java.util.*;
import java.text.SimpleDateFormat;

public class RegistraEvaluaciones extends ActionSupport {

   private String date1, date2,username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
   Random rand = new Random();
   int  n = rand.nextInt(500) + 1;
   int p = 0, e = 0, d, r;//p -->professor  e---> evaluator    d -->division r --> residue  i -->counter
   int ps = 0;//counter that will be positioning the array
   String[] profesores = new String[100], evaluadores = new String[100];
   @Override
   public String execute() throws Exception{
       LoginBean lb = new LoginBean();
       int l = 0;
       lb.getConnection();
       /*Verify if the activity date exist*/
       SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yy");
       Date dte1 = formatter.parse(getDate1());
       Date dte2 = formatter.parse(getDate2());
       
       ResultSet rveri = lb.executeQuery("SELECT * FROM fecha_actividades");
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
       ResultSet rs, rp, re;//rs --> verification date   rp-->get number of prof re-->get number of evaluator
       int periodo = 0;
       rs = lb.executeQuery("SELECT fecha_inicio, fecha_fin FROM fecha_evaluaciones");
       
       while(rs.next()) {
           lb.closeConnection();
           return "existe_evalu";
        }
       int ra = lb.executeUpdate("INSERT INTO fecha_evaluaciones (id_fecha, fecha_inicio, fecha_fin, id_usuario) VALUES"
               + "(" + n + ", str_to_date('" + getDate1() + "', '%d-%m-%Y'), str_to_date('" + getDate2() + "', '%d-%m-%Y'), '" + username + "')");
       if(ra > 0){
           //llamar a la función que asignará los profesores a los evaluadores
           re = lb.executeQuery("SELECT * FROM evaluador");
           while(re.next()){
               evaluadores[e] = re.getString("id_usuario");
               periodo = re.getInt("periodo_actual");
               e++;
           }
           rp = lb.executeQuery("SELECT * FROM profesor WHERE periodo = " + periodo);
           while(rp.next()){
               profesores[p] = rp.getString("id_usuario");
               p++;
           }
           //System.out.println("");
           d = p / e;//get the division between professors and evaluators
           r = p % e;//get residue of the division
           for(int i = 0; i < e; i++){
               for(int j = 0; j < d; j++){
                   int ri = lb.executeUpdate("INSERT INTO evaluador_evalua_profesor(id_usuario_ev, "
                           + "id_usuario_prof, puntaje_final, periodo) VALUES"
                           + "('" + evaluadores[i] + "', '" + profesores[ps] + "', 0, " + periodo + ")");
                   ps++;
               }
           }
           if(r != 0){
               for(int i = 0; i < r; i++){
                   int ri2 = lb.executeUpdate("INSERT INTO evaluador_evalua_profesor(id_usuario_ev, "
                           + "id_usuario_prof, puntaje_final, periodo) VALUES"
                           + "('" + evaluadores[i] + "', '" + profesores[ps] + "', 0, " + periodo + ")");
                   ps++;
                }
           }
           //Aquí finaliza
           lb.closeConnection();
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
