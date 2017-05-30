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
public class Eventos extends ActionSupport{
    private String id_publicacion,id_evento,ISBN,ISSN,Nombre_Rev,Nom_Public,fecha_publicacion,volumen,annio,numero, fecha_inicio,fecha_fin,sede,nom_evento;
    private int id_tipo_pub,id_usuario,compulsado;

    public String getFecha_inicio() {
        return fecha_inicio;
    }

    public void setFecha_inicio(String fecha_inicio) {
        this.fecha_inicio = fecha_inicio;
    }

    public String getFecha_fin() {
        return fecha_fin;
    }

    public void setFecha_fin(String fecha_fin) {
        this.fecha_fin = fecha_fin;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public String getNom_evento() {
        return nom_evento;
    }

    public void setNom_evento(String nom_evento) {
        this.nom_evento = nom_evento;
    }

    public int getCompulsado() {
        return compulsado;
    }

    public void setCompulsado(int compulsado) {
        this.compulsado = compulsado;
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
    public String execute() throws IOException, SQLException, PropertyVetoException
    {
        if(id_evento.equals(""))
        {
            addFieldError("id_evento","Este campo es necesario");
            return ERROR;
        }
        if(nom_evento.equals(""))
        {
            addFieldError("nom_evento","Este campo es necesario");
            return ERROR;
        }
        if(sede.equals(""))
        {
            addFieldError("sede","Este campo es necesario");
            return ERROR;
        }
        if(fecha_inicio.equals(""))
        {
            addFieldError("fecha_inicio","Este campo es necesario");
            return ERROR;
        }
        if(fecha_fin.equals(""))
        {
            addFieldError("fecha_fin","Este campo es necesario");
            return ERROR;
        }
        if(id_publicacion.equals(""))
        {
            addFieldError("id_publicacion","Este campo es necesario");
            return ERROR;
        }
        if(Nom_Public.equals(""))
        {
            addFieldError("Nom_Public","Este campo es necesario");
            return ERROR;
        }
        if(fecha_publicacion.equals(""))
        {
            addFieldError("","Este campo es necesario");
            return ERROR;
        }
        if(id_tipo_pub==-1)
        {
            addFieldError("id_tipo_pub","Este campo es necesario");
            return ERROR;
        }
        
        if(id_usuario==0)
        {
            addFieldError("id_tipo_pub","Este campo es necesario");
            return ERROR;
        }
        
        LoginBean lb = new LoginBean();
        lb.getConnection();
        ResultSet vprof=lb.executeQuery("select * from profesor where id_usuario="+id_usuario+"");
        while(vprof.next())
        {
            ResultSet evn=lb.executeQuery("select * from evento_academico where id_evento='"+id_evento+"' and nom_evento='"+nom_evento+"'");
            while(evn.next())
            {
                ResultSet prof_ev=lb.executeQuery("select * from profesor_participa_ev where id_evento='"+id_evento+"' and id_usuario='"+id_usuario+"'");
                while(prof_ev.next())
                {
                    ResultSet pub=lb.executeQuery("select * from publicacion where id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+" and Nom_public='"+Nom_Public+"'");
                    while(pub.next())
                    {
                        ResultSet pub_prof=lb.executeQuery("select * from profesor_tiene_pub where id_publicacion='"+id_publicacion+"' and id_usuario='"+id_usuario+"'");
                        while(pub_prof.next())
                        {
                            addFieldError("id_publicacion","Esta publicacion ya fue registrada por este profesor en otra actividad");
                            lb.closeConnection();
                            return ERROR;
                        }
                    }
                    lb.executeUpdate("insert into publicacion (id_publicacion,id_tipo_pub,ISSN,ISBN,Nom_Public,"
                            + "Nombre_Rev,id_evento,fecha_publicacion,compulsado,volumen,annio,numero) values"
                            + "('"+id_publicacion+"',"+id_tipo_pub+",'"+ISSN+"','"+ISBN+"','"+Nom_Public+"','"+Nombre_Rev+"'"
                            + ",'"+id_evento+"',str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),0,'"+volumen+"','"+annio+"','"+numero+"')");

                        lb.executeUpdate("insert into profesor_tiene_pub(id_usuario,id_publicacion,id_tipo_pub,id_evento,validado,fecha_val)"
                                + "values("+id_usuario+",'"+id_publicacion+"',"+id_tipo_pub+", '"+id_evento+"',0,str_to_date('"+fecha_publicacion+"','%d-%m-%Y'))");
                        lb.closeConnection();
                        return SUCCESS;
                }
                ResultSet pub=lb.executeQuery("select * from publicacion where id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+" and Nom_public='"+Nom_Public+"'");
                while(pub.next())
                {
                    ResultSet pub_prof=lb.executeQuery("select * from profesor_tiene_pub where id_publicacion='"+id_publicacion+"' and id_usuario='"+id_usuario+"'");
                    while(pub_prof.next())
                    {
                        addFieldError("id_publicacion","Esta publicacion ya fue registrada por este profesor en otra actividad");
                        lb.closeConnection();
                        return ERROR;
                    }

                    addFieldError("id_publicacion","Esta publicacion ya fue registrada como evidencia de otra actividad");
                    lb.closeConnection();
                    return ERROR;
                }
                lb.executeUpdate("insert into profesor_participa_ev (id_usuario,id_evento,actividad,comentarios,ruta_alm,validado,fecha_val,puntaje,periodo)"
                    + " values("+id_usuario+",'"+id_evento+"','Ponencia','','',0,str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),0,0)");
            
                lb.executeUpdate("insert into publicacion (id_publicacion,id_tipo_pub,ISSN,ISBN,Nom_Public,"
                        + "Nombre_Rev,id_evento,fecha_publicacion,compulsado,volumen,annio,numero) values"
                        + "('"+id_publicacion+"',"+id_tipo_pub+",'"+ISSN+"','"+ISBN+"','"+Nom_Public+"','"+Nombre_Rev+"'"
                        + ",'"+id_evento+"',str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),0,'"+volumen+"','"+annio+"','"+numero+"')");

                lb.executeUpdate("insert into profesor_tiene_pub(id_usuario,id_publicacion,id_tipo_pub,id_evento,validado,fecha_val)"
                            + "values("+id_usuario+",'"+id_publicacion+"',"+id_tipo_pub+", '"+id_evento+"',0,str_to_date('"+fecha_publicacion+"','%d-%m-%Y'))");
                    lb.closeConnection();
                    return SUCCESS;
                
            }
            ResultSet pub=lb.executeQuery("select * from publicacion where id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+" and Nom_public='"+Nom_Public+"'");
            while(pub.next())
            {
                ResultSet pub_prof=lb.executeQuery("select * from profesor_tiene_pub where id_publicacion='"+id_publicacion+"' and id_usuario='"+id_usuario+"'");
                while(pub_prof.next())
                {
                    addFieldError("id_publicacion","Esta publicacion ya fue registrada por este profesor en otra actividad");
                    lb.closeConnection();
                    return ERROR;
                }
                
                addFieldError("id_publicacion","Esta publicacion ya fue registrada como evidencia de otra actividad");
                lb.closeConnection();
                return ERROR;
            }
            lb.executeUpdate("insert into evento_academico (id_evento,nom_evento,sede,fecha_ini,fecha_fin,Nacional) "
                    + "values ('"+id_evento+"','"+nom_evento+"','"+sede+"',str_to_date('"+fecha_inicio+"','%d-%m-%Y'),"
                    + "str_to_date('"+fecha_fin+"','%d-%m-%Y'),1)");
            
            lb.executeUpdate("insert into profesor_participa_ev (id_usuario,id_evento,actividad,comentarios,ruta_alm,validado,fecha_val,puntaje,periodo)"
                    + " values("+id_usuario+",'"+id_evento+"','Ponencia','','',0,str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),0,0)");
            
            lb.executeUpdate("insert into publicacion (id_publicacion,id_tipo_pub,ISSN,ISBN,Nom_Public,"
                    + "Nombre_Rev,id_evento,fecha_publicacion,compulsado,volumen,annio,numero) values"
                    + "('"+id_publicacion+"',"+id_tipo_pub+",'"+ISSN+"','"+ISBN+"','"+Nom_Public+"','"+Nombre_Rev+"'"
                    + ",'"+id_evento+"',str_to_date('"+fecha_publicacion+"','%d-%m-%Y'),0,'"+volumen+"','"+annio+"','"+numero+"')");
        
            lb.executeUpdate("insert into profesor_tiene_pub(id_usuario,id_publicacion,id_tipo_pub,id_evento,validado,fecha_val)"
                        + "values("+id_usuario+",'"+id_publicacion+"',"+id_tipo_pub+", '"+id_evento+"',0,str_to_date('"+fecha_publicacion+"','%d-%m-%Y'))");
                lb.closeConnection();
                return SUCCESS;
            
            
        }
        lb.closeConnection();
        addFieldError("id_usuario","Este profesor no esta registrado en el sistema");
        return ERROR;
    }
}
