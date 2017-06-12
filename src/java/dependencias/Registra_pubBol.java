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
public class Registra_pubBol extends ActionSupport{
    private String id_publicacion,id_evento,ISBN,ISSN,Nombre_Rev,Nom_Public,fecha_publicacion,volumen,annio,numero,nom_usuario;
    private int id_tipo_pub,id_usuario,registrado,num_autores;

    public int getNum_autores() {
        return num_autores;
    }

    public void setNum_autores(int num_autores) {
        this.num_autores = num_autores;
    }

    public int getRegistrado() {
        return registrado;
    }

    public void setRegistrado(int registrado) {
        this.registrado = registrado;
    }
    public String getNom_usuario() {
        return nom_usuario;
    }

    public void setNom_usuario(String nom_usuario) {
        this.nom_usuario = nom_usuario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    

    public String getId_publicacion() {
        return id_publicacion;
    }

    public void setId_publicacion(String id_publicacion) {
        this.id_publicacion = id_publicacion;
    }

    public String getId_evento() {
        return id_evento;
    }

    public void setId_evento(String id_evento) {
        this.id_evento = id_evento;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getISSN() {
        return ISSN;
    }

    public void setISSN(String ISSN) {
        this.ISSN = ISSN;
    }

    public String getNombre_Rev() {
        return Nombre_Rev;
    }

    public void setNombre_Rev(String Nombre_Rev) {
        this.Nombre_Rev = Nombre_Rev;
    }

    public String getNom_Public() {
        return Nom_Public;
    }

    public void setNom_Public(String Nom_Public) {
        this.Nom_Public = Nom_Public;
    }

    public String getFecha_publicacion() {
        return fecha_publicacion;
    }

    public void setFecha_publicacion(String fecha_publicacion) {
        this.fecha_publicacion = fecha_publicacion;
    }

    public String getVolumen() {
        return volumen;
    }

    public void setVolumen(String volumen) {
        this.volumen = volumen;
    }

    public String getAnnio() {
        return annio;
    }

    public void setAnnio(String annio) {
        this.annio = annio;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getId_tipo_pub() {
        return id_tipo_pub;
    }

    public void setId_tipo_pub(int id_tipo_pub) {
        this.id_tipo_pub = id_tipo_pub;
    }
    
    private static Pattern pswNamePtrn = Pattern.compile("(SIP/DI/POPI-)([0-9]){4}(/)([0-9]){2}");
    private static Pattern ISSNPtrn = Pattern.compile("([0-9]){4}(-)([0-9]){4}");
    
    public static String validateISSN(String ID_OBRA1){//
         
        Matcher mtch1 = ISSNPtrn.matcher(ID_OBRA1);
        if(mtch1.matches()){
            return SUCCESS;
        }
        else
            return "test";
    }
  
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
    
        if(id_publicacion.equals(""))   
        {
            addFieldError("id_publicacion","Este campo es necesario");
            return ERROR;
        }

        if(ISSN.equals(""))   
        {
            addFieldError("ISSN","Este campo es necesario, en caso de no tener agregue 0");
            return ERROR;
        }
        
        if(ISBN.equals(""))   
        {
            addFieldError("ISBN","Este campo es necesario, en caso de no tener agregue 0");
            return ERROR;
        }
        
        if(Nombre_Rev.equals(""))   
        {
            addFieldError("Nombre_Rev","Este campo es necesario");
            return ERROR;
        }
        
        if(Nom_Public.equals(""))   
        {
            addFieldError("Nom_Public","Este campo es necesario");
            return ERROR;
        }
        
        if(fecha_publicacion.equals(""))   
        {
            addFieldError("fecha_publicacion","Este campo es necesario");
            return ERROR;
        }
        
        if(volumen.equals(""))   
        {
            addFieldError("volumen","Este campo es necesario");
            return ERROR;
        }
        
        if(annio.equals(""))   
        {
            addFieldError("annio","Este campo es necesario");
            return ERROR;
        }
        
        if(numero.equals(""))   
        {
            addFieldError("numero","Este campo es necesario");
            return ERROR;
        }
        String cadena="";
        String SSN="";
        
        cadena= validatePassword(id_publicacion);
        SSN= validateISSN(ISSN);
        if(id_tipo_pub == 2 || id_tipo_pub == 3)
        {
            if(SSN.equals("test"))
           {
               addFieldError("ISSN","El formato del ISSN debe ser [4 dígitos]-[4 dígitos]");
               return ERROR;
           }
        }
        
        if(id_tipo_pub == 4 || id_tipo_pub == 5)
        {
            if(cadena.equals("test"))
            {
               addFieldError("id_publicacion","No coincide con la Regla, asegurate de que sea [2 digitos autores: 01, 02,...]-[año 4 dígitos]-[12 dígitos consecutivos]-[2 dígitos]");
                return ERROR;
            }
            
        }   
        
        
        
        LoginBean lb = new LoginBean();
        lb.getConnection();
        
        ResultSet actualiza= lb.executeQuery("select * from profesor_tiene_pub where id_publicacion='"+id_publicacion+"' and id_usuario="+id_usuario+" and registrado=0");
        while(actualiza.next())
        {
            lb.executeUpdate("update profesor_tiene_pub set registrado=1 where id_publicacion='"+id_publicacion+"' and id_usuario="+id_usuario+"");
            lb.closeConnection();
            return SUCCESS;
            
        }
        
        ResultSet vprof=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        while(vprof.next())
        {
            System.out.println("ya encontro el profesor");
            ResultSet publi=lb.executeQuery("select * from publicacion where id_publicacion='"+id_publicacion+"'"
                    + " and id_tipo_pub='"+id_tipo_pub+"' and annio='"+annio+"' and volumen='"+volumen+"' and"
                    + " Nombre_Rev='"+Nombre_Rev+"' and ISSN='"+ISSN+"' and ISBN='"+ISBN+"' and Nom_Public='"+Nom_Public+"' and num_autores="+num_autores+"");
            while(publi.next())
            {
                System.out.println("Ya encuentro el publicacio");
                ResultSet Pub_Prof=lb.executeQuery("select * from profesor_tiene_pub where id_publicacion='"+id_publicacion+"'"
                        + " and id_usuario="+id_usuario+" and id_tipo_pub='"+id_tipo_pub+"' and id_evento='"+id_evento+"' ");
                while(Pub_Prof.next())
                {
                    addFieldError("id_publicacion","Lo sentimos Este registro ya esta hecho");
                    lb.closeConnection();
                    return ERROR;
                }
                lb.executeUpdate("insert into profesor_tiene_pub(id_usuario,id_publicacion,id_tipo_pub,id_evento,validado,fecha_val,registrado)"
                        + "values("+id_usuario+","+id_publicacion+","+id_tipo_pub+", '"+id_evento+"',0,str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),"+registrado+")");
                lb.closeConnection();
                return SUCCESS;
            }
            
            lb.executeUpdate("insert into publicacion (id_publicacion,id_tipo_pub,ISSN,ISBN,Nom_Public,"
                    + "Nombre_Rev,id_evento,fecha_publicacion,compulsado,volumen,annio,numero,num_autores) values"
                    + "('"+id_publicacion+"',"+id_tipo_pub+",'"+ISSN+"','"+ISBN+"','"+Nom_Public+"','"+Nombre_Rev+"'"
                    + ",'"+id_evento+"',str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),0,'"+volumen+"','"+annio+"','"+numero+"',"+num_autores+")");
        
            lb.executeUpdate("insert into profesor_tiene_pub(id_usuario,id_publicacion,id_tipo_pub,id_evento,validado,fecha_val,registrado)"
                        + "values("+id_usuario+",'"+id_publicacion+"',"+id_tipo_pub+", '"+id_evento+"',0,str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),"+registrado+")");
                lb.closeConnection();
                return SUCCESS;
        }
        
        addFieldError("id_usuario","Ese profesor no esta registrado en el sistema");
        lb.closeConnection();
        return ERROR;
        }
    
}
