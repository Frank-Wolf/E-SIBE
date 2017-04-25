/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dependencias;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.*;
import java.beans.PropertyVetoException;
import java.io.IOException;

import java.util.Random;

/**
 *
 * @author le_as
 */
public class RegistraObra extends ActionSupport
{   
    private String id_obra,nom_obra;
    private int id_tipo_obra,id_usuario;

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    private String fecha_registro;

    public String getNom_obra() {
        return nom_obra;
    }

    public void setNom_obra(String nom_obra) {
        this.nom_obra = nom_obra;
    }

    public String getId_obra() {
        return id_obra;
    }

    public void setId_obra(String id_obra) {
        this.id_obra = id_obra;
    }

    public int getId_tipo_obra() {
        return id_tipo_obra;
    }

    public void setId_tipo_obra(int id_tipo_obra) {
        this.id_tipo_obra = id_tipo_obra;
    }

    public String getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(String fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    
    
   Random rand = new Random();
   int  n = rand.nextInt(500) + 1;
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
      String ret = SUCCESS;
      Connection conn = null;
        LoginBean lb = new LoginBean();
        lb.getConnection();
   
        try {
         String URL = "jdbc:mysql://localhost:3306/esibe";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(URL, "root", "root");
         
         if(lb.valida_prof_obra(id_obra))
         {
             System.out.println(id_usuario);
             System.out.println(id_usuario);
             System.out.println(id_usuario);
             System.out.println(id_usuario);
             System.out.println(id_usuario);
             
              String val2="INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val) VALUES";
         val2+=" ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date(?, '%d-%m-%Y'))";
             System.out.println(id_usuario);
             PreparedStatement ps3 = conn.prepareStatement (val2);
             ps3.setString(1, fecha_registro);
             
             int res = ps3.executeUpdate();
         }
         else{
         String sql = "insert into obra (id_obra,id_tipo_obra, nom_obra, fecha_registro) values ";//probar con select*
         sql+=" ('"+getId_obra()+"','"+getId_tipo_obra()+"','"+getNom_obra()+"',str_to_date(?, '%d-%m-%Y'))";
         
         String val="INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val) VALUES";
         val+=" ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date(?, '%d-%m-%Y'))";
         
         
         
         System.out.println(fecha_registro);
         System.out.println(id_usuario);
         PreparedStatement ps = conn.prepareStatement(sql);
         PreparedStatement ps2 = conn.prepareStatement (val);
         
         ps.setString(1, fecha_registro);
         ps2.setString(1, fecha_registro);
         
         
         int rs = ps.executeUpdate();
         int rs2 = ps2.executeUpdate();
         }       
         
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
    
    
    
}
