/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dependencias;

import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author PsysacElrick
 */
public class verifica_fechaEva {
    public verifica_fechaEva(){
    }
    public String execute() throws Exception {
        Date date_curr = new Date();
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        ResultSet rs=lb.executeQuery("SELECT * FROM fecha_evaluaciones");
        while(rs.next()){
            if(date_curr.after(rs.getDate("fecha_fin")) || date_curr.before(rs.getDate("fecha_inicio"))){
                lb.closeConnection();
                return "denied";
            }
            else{
                lb.closeConnection();
                return "success";
            }
        
        }
        lb.closeConnection();
        return "denied";
            
    } 
}

