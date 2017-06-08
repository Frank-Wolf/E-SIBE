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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author le_as
 */
public class RegistraTT extends ActionSupport
{   
    private String id_TT,nom_alumno,nom_TT;
    private int id_alumno,id_usuario,registrado;

    public int getRegistrado() {
        return registrado;
    }

    public void setRegistrado(int registrado) {
        this.registrado = registrado;
    }
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

   private static Pattern pswNamePtrn = Pattern.compile("T{2}([0-9]){4}(-)([A-B]){1}([0-9]){3}");
  
   public static String validatePassword(String ID_TT){//
         
        Matcher mtch = pswNamePtrn.matcher(ID_TT);
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
        
        cadena= validatePassword(id_TT);
        if(cadena.equals("test"))
        {
            addFieldError("id_TT","No coincide con la Regla, asegurate de que sea TT[4 digitos]-[A/B][3 dígitos]");
            return ERROR;
        }
        
        
        LoginBean lb = new LoginBean();
        lb.getConnection();
        
        
        ResultSet actualiza=lb.executeQuery("SELECT * from profesor_tiene_tt where id_usuario="+id_usuario+" and id_tt='"+id_TT+"' and registrado=0");
        while(actualiza.next())
        {
            lb.executeUpdate("update profesor_tiene_tt set registrado=1 ");
            lb.closeConnection();
            return SUCCESS;
        }

        ResultSet prof=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        while(prof.next())
        {
                    ResultSet al_rec=lb.executeQuery("select * from alumno where id_alumno="+id_alumno+" ");
                    while(al_rec.next())
                    {
                        ResultSet rela=lb.executeQuery("select * from profesor_tiene_tt where id_alumno="+id_alumno+" and id_usuario="+id_usuario+"");
                        while(rela.next())
                        {
                            addFieldError("id_usuario","Este registro ya esta hecho");
                            lb.closeConnection();
                            return ERROR;
                        }
                            lb.executeUpdate("update alumno set recibido=1 where id_alumno="+id_alumno+"");

                            lb.executeUpdate("insert into tt (id_TT,nom_TT,fecha_pro) values('"+id_TT+"','"+nom_TT+"',str_to_date('"+fecha_reg+"','%d-%m-%Y'))");

                            lb.executeUpdate("insert into profesor_tiene_tt(id_usuario,id_TT,id_alumno,validado,fecha_val,registrado)"
                                    + " values('"+id_usuario+"','"+id_TT+"',"+id_alumno+",0,str_to_date('"+fecha_reg+"','%d-%m-%Y'),"+registrado+")");


                            lb.closeConnection();
                            return SUCCESS;

                    }

                    lb.executeUpdate("insert into alumno(id_alumno,nom_alumno,recibido) values("+id_alumno+",'"+nom_alumno+"',1)");

                    lb.executeUpdate("insert into tt (id_TT,nom_TT,fecha_pro) values('"+id_TT+"','"+nom_TT+"',str_to_date('"+fecha_reg+"','%d-%m-%Y'))");

                    lb.executeUpdate("insert into profesor_tiene_tt(id_usuario,id_TT,id_alumno,validado,fecha_val,registrado)"
                        + " values('"+id_usuario+"','"+id_TT+"',"+id_alumno+",0,str_to_date('"+fecha_reg+"','%d-%m-%Y'),"+registrado+")");


                    lb.closeConnection();
                    return SUCCESS;
        }
        
        addFieldError("id_usuario","El profesor no se encuentra registrado en el sistema");
        lb.closeConnection();
        return ERROR; 
    }   
}
