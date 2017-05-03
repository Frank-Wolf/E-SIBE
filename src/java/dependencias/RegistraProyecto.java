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
    
    
    
    
   
   public  String execute() throws IOException, SQLException, PropertyVetoException 
   {
    
        if(id_proyecto.equals(""))
        {
            addFieldError("id_proyecto","Este campo es necesario");
            return ERROR;
        }
        
        if(nom_proyecto.equals(""))
        {
            addFieldError("nom_proyecto","Este campo es necesario");
            return ERROR;
        }
        
        if(id_usuario==0)
        {
            addFieldError("id_usuario","Este campo es necesario");
            return ERROR;
        }
       
        if(rol.equals("-1"))
        {
            addFieldError("rol","Este campo es necesario");
            return ERROR;
        }
        
        LoginBean lb = new LoginBean();
        lb.getConnection();
        ResultSet pr=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        
        System.out.println(id_usuario);
        while(pr.next())
        {   
            ResultSet pro=lb.executeQuery("select * from proyecto where id_proyecto='"+id_proyecto+"'");
            System.out.println("Verificando proyecto");
            while(pro.next())
            {
                System.out.println("Proyecto encontrado");
                ResultSet or= lb.executeQuery("select * from profesor_tiene_proyecto where id_usuario="+id_usuario+" "
                        + "and id_proyecto='"+id_proyecto+"'");
                
                while(or.next())
                {
                    if(id_proyecto.equals(or.getString("id_proyecto")) && id_usuario==or.getInt("id_usuario"))
                    {
                        System.out.println("Este wey ya habia registrado este proyecto");
                        addFieldError("id_proyecto","Este proyecto ya habia sido registrado");
                        lb.closeConnection();
                        return ERROR;
                    }
                    else
                    {
                        System.out.println("Aqui falla");
                        lb.executeUpdate("insert into profesor_tiene_proyecto (id_usuario,id_proyecto,id_alumno,id_rol_profesor,validado) values("+id_usuario+",'"+id_proyecto+"',0,'"+rol+"',0)");
                        lb.closeConnection();
                        return SUCCESS;
                    }
                }
                lb.closeConnection();
                addFieldError("id_proyecto","PROBLEM");
                return ERROR;
            }

            lb.executeUpdate("insert into proyecto(id_proyecto,nom_proyecto,fecha_reg) values('"+id_proyecto+"','"+nom_proyecto+"',str_to_date('"+fecha_reg+"','%d-%m-%Y'))");
            lb.executeUpdate("insert into profesor_tiene_proyecto (id_usuario,id_proyecto,id_alumno,rol_profesor,validado) values("+id_usuario+",'"+id_proyecto+"',0,'"+rol+"',0)");
            lb.closeConnection();
            return SUCCESS;
        }
            
//<<<<<<< Upstream, based on origin/master
        System.out.println("Profesor no encontrado");
        lb.closeConnection();
        addFieldError("id_usuario","El id del profesor no coincide con algun registro en el sistema");
        return ERROR;
    }            
  
//>>>>>>> 7836515 
}


