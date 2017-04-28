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
    private String fecha_reg;

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

  
    
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
        String ret = SUCCESS;
        
        if(id_alumno==0)
        {
            addFieldError("id_alumno","Este campo es necesario");
            return ERROR;
        }    
        
        if(id_TT.equals(""))
        {
            addFieldError("id_TT","Este campo es necesario");
            return ERROR;
        }
        
        if(nom_TT.equals(""))
        {
            addFieldError("nom_TT","Este campo es necesario");
            return ERROR;
        }
        
        if(fecha_reg.equals(""))
        {
            addFieldError("fecha_reg","Este campo es necesario");
            return ERROR;
        }
        
        if(nom_alumno.equals(""))
        {
            addFieldError("nom_alumno","Este campo es necesario");
            return ERROR;
        }
        
        if(id_usuario==0)
        {
            addFieldError("id_usuario","Este campo es necesario");
            return ERROR;
        }
        
        
        
        LoginBean lb = new LoginBean();
        lb.getConnection();

        ResultSet prof=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        while(prof.next())
        {
            ResultSet al_rec=lb.executeQuery("select * from alumno where id_alumno="+id_alumno+"");
            while(al_rec.next())
            {
                ResultSet rela=lb.executeQuery("select * from profesor_tiene_tt where id_alumno="+id_alumno+" and id_usuario="+id_usuario+"");
                while(rela.next())
                {
                    addFieldError("id_profesor","Este registro ya esta hecho");
                    lb.closeConnection();
                    return ERROR;
                }
                lb.executeUpdate("update alumno set recibido=1 where id_alumno="+id_alumno+"");
                
                lb.executeUpdate("insert into tt (id_tt,nom_tt,fecha_pro) values "
                        + "('"+id_TT+"','"+nom_TT+"',str_to_date('"+fecha_reg+"','%d-%m-%Y'))");
                
                lb.executeUpdate("INSERT INTO profesor_tiene_tt(id_usuario,id_TT,id_alumno,validado,fecha_val) "
                        + "VALUES ("+id_usuario+",'"+id_TT+"',"+id_alumno+",0,str_to_date('"+fecha_reg+"','%d-%m-%Y'))");
                lb.closeConnection();
                return SUCCESS;
            }
            
            lb.executeUpdate("insert into alumno(id_alumno,nom_alumno,recibido) values("+id_alumno+",'"+nom_alumno+"',1)");
            
            lb.executeUpdate("insert into tt (id_tt,nom_tt,fecha_pro) values "
                    + "('"+id_TT+"','"+nom_TT+"',str_to_date('"+fecha_reg+"','%d-%m-%Y'))");
            
            lb.executeUpdate("INSERT INTO profesor_tiene_tt(id_usuario,id_TT,id_alumno,validado,fecha_val) "
                + "VALUES ('"+getId_usuario()+"','"+getId_TT()+"',"+getId_alumno()+",0,str_to_date('"+fecha_reg+"','%d-%m-%Y'))");
            
            lb.closeConnection();
            return SUCCESS;
        }
        
        addFieldError("id_usuario","El profesor no se encuentra registrado en el sistema");
        lb.closeConnection();
        return ret; 
    }   
}
