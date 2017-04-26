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

   Random rand = new Random();
   int  n = rand.nextInt(500) + 1;
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
        String ret = SUCCESS;
   
        LoginBean lb = new LoginBean();
        lb.getConnection();
   
        int part_p = lb.executeUpdate("INSERT INTO part_plan_est(id_part,id_tipo_part,fecha,asignatura,u_a) VALUES "
                + "('"+getId_participacion()+"','"+getId_tipo_part_plan()+"',str_to_date('"+fecha_reg+"', '%d-%m-%Y'),'"+getAsignatura()+"','"+u_a+"')");

        int p_t_pl= lb.executeUpdate ("INSERT INTO profesor_participa_en_plan(id_usuario,id_part,id_tipo_part,validado,fecha_val) "
                + "VALUES ('"+getId_usuario()+"','"+getId_participacion()+"','"+getId_tipo_part_plan()+"',0,str_to_date('"+fecha_reg+"', '%d-%m-%Y'))");
         
        if(part_p<1 || p_t_pl <1)
        {
            lb.closeConnection();
            return ERROR;
        }
         
        lb.closeConnection();
        return ret; 
        
    }  
}
