/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dependencias;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import static dependencias.RegistraTT.validatePassword;
import java.sql.*;
import java.beans.PropertyVetoException;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 *
 * @author le_as
 */
public class RegistraObra extends ActionSupport
{   
    private String id_obra,nom_obra;
    private int id_tipo_obra,id_usuario,num_autores,registrado;

    public int getRegistrado() {
        return registrado;
    }

    public void setRegistrado(int registrado) {
        this.registrado = registrado;
    }

    public int getNum_autores() {
        return num_autores;
    }

    public void setNum_autores(int num_autores) {
        this.num_autores = num_autores;
    }
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

    
    
    
    
   private static Pattern pswNamePtrn = Pattern.compile("([0-9]){2}(-)([0-9]){4}(-)([0-9]){12}(-)([0-9]){2}");
  
   public static String validatePassword(String ID_OBRA){//
         
        Matcher mtch = pswNamePtrn.matcher(ID_OBRA);
        if(mtch.matches()){
            return SUCCESS;
        }
        else
            return "test";
    }
    
   

    
   
   
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
        String ret = SUCCESS;
        String cadena;
        
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
        
        if(num_autores==0){
            addFieldError("num_autores","Este campo es necesario");
        }
        
        cadena= validatePassword(id_obra);
        if(cadena.equals("test"))
        {
            addFieldError("id_obra","No coincide con la Regla, asegurate de que sea [2 digitos autores: 01, 02,...]-[año 4 dígitos]-[12 dígitos consecutivos]-[2 dígitos]");
            return ERROR;
        }
        
        
        
        LoginBean lb = new LoginBean();
        lb.getConnection();
        
        ResultSet actualiza= lb.executeQuery("select * from profesor_tiene_obra where id_obra='"+id_obra+"' and id_usuario="+id_usuario+" and registrado=0");
        while(actualiza.next())
        {
          int autores=lb.executeUpdate("update obra set num_autores="+num_autores+" where id_obra='"+id_obra+"'");
            
            lb.executeUpdate("update profesor_tiene_obra set registrado=1 ");
            lb.closeConnection();
            return SUCCESS;
            
        }
        
        
        ResultSet vprof=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        while(vprof.next())
        {
            System.out.println("Encontro al profesor");
            ResultSet vobra=lb.executeQuery("select * from obra where id_obra='"+id_obra+"'");
            while(vobra.next())
            {
                
                System.out.println("Encontro la obra");
                ResultSet vnuevo=lb.executeQuery("select * from profesor_tiene_obra where id_obra='"+id_obra+"' and id_usuario="+id_usuario+"");
                while(vnuevo.next())
                {
                    System.out.println("Ya esta hecho");
                    addFieldError("id_obra","Este registro ya esta hecho");
                    lb.closeConnection();
                    return ERROR;
                }
                lb.executeUpdate("INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val,registrado) "
                    + "VALUES ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date('"+fecha_registro+"',"
                    + " '%d-%m-%Y'),"+registrado+")");
                System.out.println("REsgitrado un nuevo autor a la obra");
                lb.closeConnection();
                return SUCCESS;       
            }
            lb.executeUpdate("insert into obra (id_obra,id_tipo_obra, nom_obra, fecha_registro,num_autores) values "
            + "('"+getId_obra()+"','"+getId_tipo_obra()+"','"+getNom_obra()+"',str_to_date('"+fecha_registro+"', '%d-%m-%Y'),"+num_autores+") ");
            
            lb.executeUpdate("INSERT INTO profesor_tiene_obra(id_usuario,id_obra,id_tipo_obra,validado,fecha_val,registrado) "
            + "VALUES ('"+getId_usuario()+"','"+getId_obra()+"','"+getId_tipo_obra()+"',0,str_to_date('"+fecha_registro+"', '%d-%m-%Y'),"+registrado+")");
            
            System.out.println("Nueva obra");
            
            lb.closeConnection();
            return SUCCESS;
        }
        
        lb.closeConnection();
        addFieldError("id_usuario","El profesor no se encuentra registrado en el sistema");
        return ERROR;
        
        }
        
   }



                




                    

                
        
        
        
      