/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cofaa;

import admins.LoginBean;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;

/**
 *
 * @author PsysacElrick
 */
public class apela_2_3 extends ActionSupport{
    private String aceptado;
    private String comentario;
    private String puntaje;
    private String id_actividad;
    private String id_prof;

    public String getId_prof() {
        return id_prof;
    }

    public void setId_prof(String id_prof) {
        this.id_prof = id_prof;
    }
    private String accept = "Aceptado";
    int i;
    int puntajebueno;
    
    public apela_2_3() {
    }
    //@Override
    public String execute() throws Exception {
        if(getAceptado().equals("Aceptado")){
            i = 1;
            puntajebueno = Integer.parseInt(getPuntaje());
            LoginBean lb = new LoginBean();
            String id_evento = null;
            lb.getConnection();
            ResultSet rs = lb.executeQuery("SELECT * FROM profesor_tiene_pub WHERE id_usuario = " + getId_prof()
            + " AND id_publicacion = '" + getId_actividad() + "'");
            while(rs.next()){
                id_evento = rs.getString("id_evento");
            }
            int val=lb.executeUpdate("UPDATE profesor_participa_ev SET aceptado = 1" + 
                ", comentarios = '" + getComentario() + "', puntaje = " + puntajebueno 
                        + " WHERE id_evento='"+ id_evento +"' AND id_usuario = " + getId_prof());
            int val2=lb.executeUpdate("UPDATE profesor_tiene_pub SET aceptado = 1" + 
                ", comentarios = '" + getComentario() + "', validado = 1"
                        + " WHERE id_evento='"+ id_evento +"' AND id_usuario = " + getId_prof() + " AND id_publicacion = '"
                                + getId_actividad() + "'");
            //System.out.println(getId_prof() + " " + getId_actividad() + i + getComentario() + puntajebueno);
            System.out.println(id_evento + " " + getId_actividad() + " " + getId_prof());
            lb.closeConnection();
            if (val > 0) 
                return "success";
            else 
                return "fail";  
        }
        else{
            i = 0;
            //puntajebueno = Integer.parseInt(getPuntaje());
            LoginBean lb = new LoginBean();
            String id_evento = null;
            lb.getConnection();
            ResultSet rs = lb.executeQuery("SELECT * FROM profesor_tiene_pub WHERE id_usuario = " + getId_prof()
            + " AND id_publicacion = '" + getId_actividad() + "'");
            while(rs.next()){
                id_evento = rs.getString("id_evento");
            }
            int val=lb.executeUpdate("UPDATE profesor_participa_ev SET aceptado = 0" + 
                ", comentarios = '" + getComentario() + "', validado = 0, puntaje = 0"
                        + " WHERE id_evento='"+ id_evento +"' AND id_usuario = " + getId_prof());
            int val2=lb.executeUpdate("UPDATE profesor_tiene_pub SET aceptado = 0" + 
                ", comentarios = '" + getComentario() + "', validado = 0, puntaje = 0"
                        + " WHERE id_evento='"+ id_evento +"' AND id_usuario = " + getId_prof() + " AND id_publicacion = '"
                                + getId_actividad() + "'");
            System.out.println(getId_actividad());
            lb.closeConnection();
            if (val > 0) 
                return "success";
            else 
                return "fail";
        }
    }
    
    public String getAceptado() {
        return aceptado;
    }

    public void setAceptado(String aceptado) {
        this.aceptado = aceptado;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public String getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(String puntaje) {
        this.puntaje = puntaje;
    }

    public String getId_actividad() {
        return id_actividad;
    }

    public void setId_actividad(String id_actividad) {
        this.id_actividad = id_actividad;
    }
}

