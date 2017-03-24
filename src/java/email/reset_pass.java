/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package email;

import com.opensymphony.xwork2.ActionSupport;
import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

/**
 *
 * @author PsysacElrick
 */
public class reset_pass extends ActionSupport {

   private String password;
   private String password2;
   private String token;
   Random rand = new Random();
   int token2 = rand.nextInt(500);

   @Override
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
       admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("UPDATE usuarios SET password='"+getPassword()+"', token='"+token2+"' WHERE token='"+getToken()+"'");
        if(val>0) 
            return "test";
        else 
            return "error";
   }
   
   public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword2() {
        return password2;
    }

    public void setPassword2(String password2) {
        this.password2 = password2;
    }
    
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
