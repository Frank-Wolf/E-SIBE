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
public class RegistraProyecto extends ActionSupport
{   
    private String id_proyecto,nom_proyecto,actividad;
    private int id_usuario,id_alumno;

    public String getActividad() {
        return actividad;
    }

    public void setActividad(String actividad) {
        this.actividad = actividad;
    }
    

    public int getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(int id_alumno) {
        this.id_alumno = id_alumno;
    }
    private String fecha_reg;

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }
    private String rol;

    public String getNom_proyecto() {
        return nom_proyecto;
    }

    public void setNom_proyecto(String nom_proyecto) {
        this.nom_proyecto = nom_proyecto;
    }

    public String getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(String id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(String fecha_reg) {
        this.fecha_reg = fecha_reg;
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
         
         if(lb.valida_prof_proyecto(id_proyecto))
         {
             System.out.println(id_usuario);
             System.out.println(id_usuario);
             System.out.println(id_usuario);
             System.out.println(id_usuario);
             System.out.println(id_alumno);
             
              String val2="INSERT INTO profesor_tiene_proyecto(id_usuario,id_proyecto,id_alumno,rol_profesor,validado,fecha_val) VALUES";
         val2+=" ('"+getId_usuario()+"','"+getId_proyecto()+"',0,'"+getRol()+"',0,str_to_date(?, '%d-%m-%Y'))";
             System.out.println(id_usuario);
             PreparedStatement ps3 = conn.prepareStatement (val2);
             ps3.setString(1, fecha_reg);
             
             int res = ps3.executeUpdate();
         }
         else{
         String sql = "insert into proyecto (id_proyecto,id_alumno, nom_proyecto, fecha_reg) values ";//probar con select*
         sql+=" ('"+getId_proyecto()+"','0','"+getNom_proyecto()+"',str_to_date(?, '%d-%m-%Y'))";
         
         String val="INSERT INTO profesor_tiene_proyecto(id_usuario,id_proyecto,id_alumno,rol_profesor,validado,fecha_val) VALUES";
         val+=" ('"+id_usuario+"','"+id_proyecto+"','"+id_alumno+"','"+rol+"',0,str_to_date(?, '%d-%m-%Y'))";
         
         actividad="profesor_tiene_proyecto";
         System.out.println(id_usuario);
         System.out.println(id_proyecto);
         System.out.println(id_alumno);
         System.out.println(rol);
         PreparedStatement ps = conn.prepareStatement(sql);
         PreparedStatement ps2 = conn.prepareStatement (val);
         
         ps.setString(1, fecha_reg);
         ps2.setString(1, fecha_reg);
         
         
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
