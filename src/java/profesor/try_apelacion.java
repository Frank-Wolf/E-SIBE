/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;
import static admins.regusuario_sip.validatePassword;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import sesion.LoginBean;
import sesion.SesionBean;

/**
 *
 * @author PsysacElrick
 */
public class try_apelacion {
    
    public String execute() {
        Connection conn = null;
                String ret;
                Date date_ini = null, date_fin = null, date_curr = new Date();
                try{
                    String URL = "jdbc:mysql://localhost:3306/prototipo";
                    Class.forName("com.mysql.jdbc.Driver");
                    ResultSet rs=null;
                    conn = DriverManager.getConnection(URL, "root", "root");
                    String sql = "select * from fecha_apelaciones";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    rs=ps.executeQuery(sql);
                    while(rs.next()){
                        date_ini=rs.getDate("fecha_inicio");
                        date_fin=rs.getDate("fecha_fin"); 
                    }
                    ret = SUCCESS;
                }catch (Exception e) {
                    ret = ERROR;
                    System.out.println(e.getMessage());
                } finally {
                if (conn != null) {
                    try {
                        conn.close();
                        } catch (Exception e) {
                        System.out.println(date_curr);
                        }
                    }
                }
                if(date_curr.after(date_ini) && date_curr.before(date_fin))
                    ret = SUCCESS;
                else if(date_curr.before(date_ini) || date_curr.after(date_fin))
                    ret = ERROR;
                //System.out.println(date_curr);
                return ret;
      
   }
    
}
