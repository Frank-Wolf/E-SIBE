/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cofaa;

import admins.LoginBean;
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author PsysacElrick
 */
public class registra_evaluacion extends ActionSupport{
    private String num_profesor;
    
    public registra_evaluacion() {
    }
    //@Override
    public String execute() throws Exception {
        Date date_curr = new Date();
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int rs=lb.executeUpdate("UPDATE evaluador_evalua_profesor SET fecha_ev = '" + date_curr +"' WHERE id_usuario_prof = "
                + getNum_profesor());
        lb.closeConnection();
        if (rs > 0)
            return "success";
        else
            return "fail";
      //return ret;
    }

    public String getNum_profesor() {
        return num_profesor;
    }

    public void setNum_profesor(String num_profesor) {
        this.num_profesor = num_profesor;
    }
    
}
