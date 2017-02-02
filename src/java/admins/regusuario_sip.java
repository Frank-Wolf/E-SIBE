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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.opensymphony.xwork2.ActionSupport;

public class regusuario_sip extends ActionSupport {

   private String user;
   private int matricula;
   private String u_a;
   private int periodo;
   private String password;
   private String idTypeUsuario;


   public String execute() {
      String ret = SUCCESS;
      Connection conn = null;

      try {
         String URL = "jdbc:mysql://localhost:3306/prototipo";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(URL, "root", "root");
         String sql = "INSERT INTO usuarios(nom_prof, id_prof, u_a, periodo, password, idTypeUsuario) VALUES";//probar con select*
         sql+="(?, ?, ?, ?, ?, ?)";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, user);
         ps.setInt(2, matricula);
         ps.setString(3, u_a);
         ps.setInt(4, periodo);
         ps.setString(5, password);
         ps.setString(6, idTypeUsuario);
         int rs = ps.executeUpdate();
         ret=SUCCESS;
      } catch (Exception e) {
         ret = ERROR;
         System.out.println(e.getMessage());
      } finally {
         if (conn != null) {
            try {
               conn.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
         }
      }
      return ret;
   }

    public int getMatricula() {
        return matricula;
    }

    public void setMatricula(int matricula) {
        this.matricula = matricula;
    }

    public String getU_a() {
        return u_a;
    }

    public void setU_a(String u_a) {
        this.u_a = u_a;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public String getIdTypeUsuario() {
        return idTypeUsuario;
    }

    public void setIdTypeUsuario(String idTypeUsuario) {
        this.idTypeUsuario = idTypeUsuario;
    }
        public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

