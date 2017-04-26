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
public class RegistraTT extends ActionSupport
{   
    private String id_TT,nom_alumno,nom_TT;
    private int id_alumno,id_usuario;
    private String fecha_pro,fecha_reg;

    public String getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(String fecha_reg) {
        this.fecha_reg = fecha_reg;
    }

    public String getNom_alumno() {
        return nom_alumno;
    }

    public void setNom_alumno(String nom_alumno) {
        this.nom_alumno = nom_alumno;
    }

    public String getNom_TT() {
        return nom_TT;
    }

    public void setNom_TT(String nom_TT) {
        this.nom_TT = nom_TT;
    }

    public String getId_TT() {
        return id_TT;
    }

    public void setId_TT(String id_TT) {
        this.id_TT = id_TT;
    }

    public int getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(int id_alumno) {
        this.id_alumno = id_alumno;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getFecha_pro() {
        return fecha_pro;
    }

    public void setFecha_pro(String fecha_pro) {
        this.fecha_pro = fecha_pro;
    }

    
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
        String ret = SUCCESS;
        
        
        LoginBean lb = new LoginBean();
        lb.getConnection();

        int alumno= lb.executeUpdate("insert into alumno (id_alumno, nom_alumno,recibido) values ('"+getId_alumno()+"','"+getNom_alumno()+"',1)"); 
        int tt = lb.executeUpdate("insert into tt(id_TT,nom_TT,fecha_pro) values ('"+getId_TT()+"','"+getNom_TT()+"',str_to_date('"+fecha_reg+"', '%d-%m-%Y'))");
        int p_t = lb.executeUpdate("INSERT INTO profesor_tiene_tt(id_usuario,id_TT,id_alumno,validado,fecha_val) VALUES ('"+getId_usuario()+"','"+getId_TT()+"','"+getId_alumno()+"',0,str_to_date('"+fecha_reg+"','%d-%m-%Y'))");
        if(alumno <1)
        {   
            if(tt <1)
            {
               if(p_t <1) 
               {
                   lb.closeConnection();
                   return ret=ERROR;
               }
            }    
        }
        
        lb.closeConnection();
        return ret; 
    }   
}
