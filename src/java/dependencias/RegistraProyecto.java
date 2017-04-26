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
    
    
    
    
   
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
        
        LoginBean lb = new LoginBean();
        lb.getConnection();
   
        
         if(lb.valida_prof_proyecto(id_proyecto))
         {
             int p_p = lb.executeUpdate("INSERT INTO profesor_tiene_proyecto(id_usuario,id_proyecto,id_alumno,rol_profesor,"
                + "validado,fecha_val) VALUES ('"+getId_usuario()+"','"+getId_proyecto()+"',0,'"+getRol()+"',0,str_to_date('"+fecha_reg+"', '%d-%m-%Y'))");
             
             if(p_p<1)
             {
                lb.closeConnection();
                 return  ERROR;
             }    
         }
         else
         {
            int proyecto = lb.executeUpdate("insert into proyecto (id_proyecto, nom_proyecto, fecha_reg) values"
                 + " ('"+getId_proyecto()+"','"+getNom_proyecto()+"',str_to_date('"+fecha_reg+"', '%d-%m-%Y'))");
            
            int p_t_p = lb.executeUpdate("INSERT INTO profesor_tiene_proyecto(id_usuario,id_proyecto,id_alumno,"
                    + "rol_profesor,validado,fecha_val) VALUES ('"+id_usuario+"','"+id_proyecto+"','"+id_alumno+"','"+rol+"',0,str_to_date('"+fecha_reg+"', '%d-%m-%Y'))");
         }       
         lb.closeConnection();
         return SUCCESS;    
    }   
}
