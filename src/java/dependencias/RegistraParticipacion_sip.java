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
public class RegistraParticipacion_sip extends ActionSupport
{   
    private String id_participacion,Asignatura, fecha_reg;
    private int id_tipo_part_plan,id_usuario;

    public String getId_participacion() {
        return id_participacion;
    }

    public void setId_participacion(String id_participacion) {
        this.id_participacion = id_participacion;
    }

    public String getAsignatura() {
        return Asignatura;
    }

    public void setAsignatura(String Asignatura) {
        this.Asignatura = Asignatura;
    }

    public String getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(String fecha_reg) {
        this.fecha_reg = fecha_reg;
    }

    public int getId_tipo_part_plan() {
        return id_tipo_part_plan;
    }

    public void setId_tipo_part_plan(int id_tipo_part_plan) {
        this.id_tipo_part_plan = id_tipo_part_plan;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
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
        
         String val2="INSERT INTO part_plan_est(id_part,id_tipo_part_plan,fecha,asignatura) VALUES";
         val2+=" ('"+getId_participacion()+"','"+getId_tipo_part_plan()+"',str_to_date(?, '%d-%m-%Y'),'"+getAsignatura()+"')";
             System.out.println(id_usuario);
             PreparedStatement ps3 = conn.prepareStatement (val2);
             ps3.setString(1, fecha_reg);
             
             int res = ps3.executeUpdate();
         
       
         
         String val="INSERT INTO profesor_participa_en_plan(id_usuario,id_part,id_tipo_part_plan,validado,fecha_val) VALUES";
         val+=" ('"+getId_usuario()+"','"+getId_participacion()+"','"+getId_tipo_part_plan()+"',0,str_to_date(?, '%d-%m-%Y'))";
         
         
         
         System.out.println(fecha_reg);
         System.out.println(id_usuario);
         
         PreparedStatement ps2 = conn.prepareStatement (val);
         
         
         ps2.setString(1, fecha_reg);
         
         
         int rs = ps3.executeUpdate();
         int rs2 = ps2.executeUpdate();
                
         
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
