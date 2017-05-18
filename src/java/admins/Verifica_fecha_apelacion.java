/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admins;
import PDF.Reporte_Final;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author PsysacElrick
 */
public class Verifica_fecha_apelacion {
    
    public Verifica_fecha_apelacion(){
    }
    
    public String execute() throws Exception {
        Date date_curr = new Date();
        LoginBean lb = new LoginBean();
        int periodo = 0;
        lb.getConnection();
        ResultSet rperiodo = lb.executeQuery("SELECT * FROM evaluador");
        while(rperiodo.next()){
            periodo = rperiodo.getInt("periodo_actual");
        }
        ResultSet rs=lb.executeQuery("SELECT fecha_fin FROM fecha_apelaciones");
        if(rs.next()){
            int periodo_profesor = periodo + 2;
            int periodo_evaluador = periodo + 1;
            if(date_curr.after(rs.getDate("fecha_fin"))){
                /*Call function to create final report*/
                Reporte_Final a = new Reporte_Final();
                String execute = a.execute();
                /*Call function to create final report*/
                /*Change period to evaluator and profesor with the same*/
                int cambia_periodo = lb.executeUpdate("UPDATE evaluador SET periodo_actual = " + periodo_evaluador);
                int cambia_per_profesor = lb.executeUpdate("UPDATE profesor SET periodo = " + periodo_profesor + " "
                        + "WHERE periodo = " + periodo);
                /*Change period to evaluator and profesor with the same*/
                int val=lb.executeUpdate("DELETE FROM fecha_apelaciones WHERE fecha_fin='"+rs.getDate("fecha_fin")+"'");
                int val2 = lb.executeUpdate("DELETE FROM evaluador_evalua_profesor");
                lb.closeConnection();
                if (val > 0) 
                    return "success_borro";
                else 
                    return "fail"; 
            }
            else{
                lb.closeConnection();
                return "success";
            }
        
        }
        lb.closeConnection();
        return "success";
    }
}
