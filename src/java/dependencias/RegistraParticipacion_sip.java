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
    private String id_participacion,Asignatura, fecha_reg,u_a;
    private int registrado;

    public int getRegistrado() {
        return registrado;
    }

    public void setRegistrado(int registrado) {
        this.registrado = registrado;
    }

    public String getU_a() {
        return u_a;
    }

    public void setU_a(String u_a) {
        this.u_a = u_a;
    }
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


   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
       
       if(id_tipo_part_plan<1)
       {
           addFieldError("id_tipo_part_plan","Este campo es necesario");
           return ERROR;
       }
       
        if(id_usuario==0)
       {
           addFieldError("id_usuario","Este campo es necesario");
           return ERROR;
       }
       
       if(id_participacion.equals(""))
       {
           addFieldError("id_part","Este campo es necesario");
           return ERROR;
       }
       
       if(u_a.equals(""))
       {
           addFieldError("u_a","Este campo es necesario");
           return ERROR;
       }
       
       if(fecha_reg.equals(""))
       {
           addFieldError("fecha_reg","Este campo es necesario");
           return ERROR;
       }
       
       if(Asignatura.equals(""))
       {
           addFieldError("Asignatura","Este campo es necesario");
           return ERROR;
       }

       String ret = SUCCESS;
       System.out.println(id_tipo_part_plan);
   
        LoginBean lb = new LoginBean();
        lb.getConnection();
        ResultSet pd= lb.executeQuery("select * from part_plan_est where u_a='"+u_a+"' and id_part='"+id_participacion+"' and asignatura='"+Asignatura+"'");
        while(pd.next())
        {
            ResultSet actualiza= lb.executeQuery("select * from profesor_participa_en_plan where id_part='"+id_participacion+"' and id_usuario="+id_usuario+" and registrado=0");
            while(actualiza.next())
            {
                lb.executeUpdate("update profesor_participa_en_plan set registrado=1 ");
                lb.closeConnection();
                return SUCCESS;

            }
        }
        
        ResultSet prof=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        while(prof.next())
        {
         
            ResultSet part=lb.executeQuery("select * from part_plan_est where id_part='"+id_participacion+"'");
            
            while(part.next())
            {
                ResultSet prof_en=lb.executeQuery("select * from profesor_participa_en_plan where id_usuario="+id_usuario+" and id_part='"+id_participacion+"'");
                while(prof_en.next())
                {
                    lb.closeConnection();
                    addFieldError("id_usuario","Esta actividad ya fue registrada");
                    return ERROR;
                }
                
                int nuevo_part=lb.executeUpdate("INSERT INTO profesor_participa_en_plan(id_usuario,id_part,id_tipo_part,validado,fecha_val,registrado)"
                              + " VALUES ('"+getId_usuario()+"','"+getId_participacion()+"','"+getId_tipo_part_plan()+"',0,"
                              + "str_to_date('"+fecha_reg+"','%d-%m-%Y'),"+registrado+")");
                lb.closeConnection();
                return SUCCESS; 
            }
            int part_p = lb.executeUpdate("INSERT INTO part_plan_est(id_part,id_tipo_part,fecha,asignatura,u_a) VALUES "
                        + "('"+getId_participacion()+"','"+getId_tipo_part_plan()+"',str_to_date('"+fecha_reg+"', '%d-%m-%Y'),"
                        + "'"+getAsignatura()+"','"+u_a+"')");
            
            int nuevo_part=lb.executeUpdate("INSERT INTO profesor_participa_en_plan(id_usuario,id_part,id_tipo_part,validado,fecha_val,registrado)"
                              + " VALUES ('"+getId_usuario()+"','"+getId_participacion()+"','"+getId_tipo_part_plan()+"',0,"
                              + "str_to_date('"+fecha_reg+"','%d-%m-%Y'),"+registrado+")");
            
            lb.closeConnection();
            return SUCCESS;
            
        }
        addFieldError("id_usuario","Este profesor no está registrado en el sistema");
        lb.closeConnection();
        return ERROR; 
        
    }  
}
