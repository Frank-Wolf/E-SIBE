/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import sesion.*;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.Date;
import java.sql.ResultSet;
import sesion.LoginBean;

/**
 *
 * @author PsysacElrick
 */
public class try_apelacion {
    
    public String execute() throws Exception {
                String ret = null;
                Date date_ini = null, date_fin = null, date_curr = new Date();
                LoginBean lb = new LoginBean();
                lb.getConnection();
                ResultSet rs = lb.executeQuery("SELECT * FROM fecha_apelaciones");
                while(rs.next()){
                    date_ini=rs.getDate("fecha_inicio");
                    date_fin=rs.getDate("fecha_fin"); 
                }
                ret = ERROR;
                if(date_ini == null)
                    return ret;
                else if(date_curr.after(date_ini) && date_curr.before(date_fin))
                    ret = SUCCESS;
                else if(date_curr.before(date_ini) || date_curr.after(date_fin))
                    ret = ERROR;
                //System.out.println(date_curr);
                return ret;

   }
    
}
