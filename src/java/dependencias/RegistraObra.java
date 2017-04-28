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
public class RegistraObra extends ActionSupport
{   
    private String id_obra,nom_obra;
    private int id_tipo_obra,id_usuario;
    private String fecha_registro;

    public String getId_obra() {
        return id_obra;
    }

    public void setId_obra(String id_obra) {
        this.id_obra = id_obra;
    }

    public String getNom_obra() {
        return nom_obra;
    }

    public void setNom_obra(String nom_obra) {
        this.nom_obra = nom_obra;
    }

    public int getId_tipo_obra() {
        return id_tipo_obra;
    }

    public void setId_tipo_obra(int id_tipo_obra) {
        this.id_tipo_obra = id_tipo_obra;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
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
        
        if(id_obra.equals("")){
            addFieldError("id_obra","Este campo es necesario");
            return ERROR;
        }
        
        if(id_usuario==0)
        {
            addFieldError("id_usuario","Este campo es necesario");
            return ERROR;
        }
        
        if(id_tipo_obra==-1){
            addFieldError("id_tipo_obra","Este campo es necesario");
            return ERROR;
        }
            
        if(nom_obra.equals("")){
            addFieldError("nom_obra","Este campo es necesario");
            return ERROR;
        }
                                
        if(fecha_registro.equals("")){
            addFieldError("fecha_registro","Este campo es necesario");
            return ERROR;
        }
        
        LoginBean lb = new LoginBean();
        lb.getConnection();
        ResultSet vprof=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        while(vprof.next())
        {
            System.out.println("Encontro al profesor");
            ResultSet vobra=lb.executeQuery("select * from obra where id_obra='"+id_obra+"'");
            while(vobra.next())
            {
                
                System.out.println("Encontro la obra");
                ResultSet vnuevo=lb.executeQuery("select * from profesor_tiene_obra where id_obra="+id_obra+" id_usuario="+id_usuario+"");
                while(vnuevo.next())
                {
                    System.out.println("Ya esta hecho");
                    addFieldError("id_obra","Este registro ya esta hecho");
                    lb.closeConnection();
                    return ERROR;
                }
                lb.executeUpdate("INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val) "
                    + "VALUES ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date('"+fecha_registro+"',"
                    + " '%d-%m-%Y'))");
                System.out.println("REsgitrado un nuevo autor a la obra");
                lb.closeConnection();
                return SUCCESS;       
            }
            lb.executeUpdate("insert into obra (id_obra,id_tipo_obra, nom_obra, fecha_registro) values "
            + "('"+getId_obra()+"','"+getId_tipo_obra()+"','"+getNom_obra()+"',str_to_date('"+fecha_registro+"', '%d-%m-%Y')) ");
            
            lb.executeUpdate("INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val) "
            + "VALUES ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date('"+fecha_registro+"', '%d-%m-%Y'))");
            
            System.out.println("Nueva obra");
            
            lb.closeConnection();
            return SUCCESS;
        }
        
        lb.closeConnection();
        addFieldError("id_usuario","El profesor no se encuentra registrado en el sistema");
        return ERROR;
        
        }
        
   }



                




                    

                
        
        
        
      