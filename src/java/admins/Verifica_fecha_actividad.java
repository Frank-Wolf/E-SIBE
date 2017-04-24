/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admins;

import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author PsysacElrick
 */
public class Verifica_fecha_actividad {
    
    public Verifica_fecha_actividad(){
    }
    
    public String execute() throws Exception {
        Date date_curr = new Date();
        LoginBean lb = new LoginBean();
        lb.getConnection();
        ResultSet rs=lb.executeQuery("SELECT fecha_fin FROM fecha_actividades");
        while(rs.next()){
            if(date_curr.after(rs.getDate("fecha_fin"))){
                int val=lb.executeUpdate("DELETE FROM fecha_actividades WHERE fecha_fin='"+rs.getDate("fecha_fin")+"'");
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
