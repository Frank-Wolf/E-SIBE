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
    
   
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
        String ret = SUCCESS;
       
        LoginBean lb = new LoginBean();
        lb.getConnection();
         
        if(lb.valida_prof_obra(id_obra))
        {
            int obra = lb.executeUpdate("INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val) "
                    + "VALUES ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date('"+fecha_registro+"', '%d-%m-%Y'))");
              
            if(obra<1)
            {
                lb.closeConnection();
                return ERROR;
            }
              
         }
        
        else
        {
            int ins_obra = lb.executeUpdate("insert into obra (id_obra,id_tipo_obra, nom_obra, fecha_registro) values "
                    + "('"+getId_obra()+"','"+getId_tipo_obra()+"','"+getNom_obra()+"',str_to_date(?, '%d-%m-%Y')) ");

            int p_t_o = lb.executeUpdate("INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val) "
                    + "VALUES ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date(?, '%d-%m-%Y'))");

            if(ins_obra <1|| p_t_o <1)
            {
                lb.closeConnection();
                return ERROR;
            }       
        }    
    
    lb.closeConnection();
    return ret; 
         
    }
}
