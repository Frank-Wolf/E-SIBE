/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cofaa;

import admins.LoginBean;
import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author PsysacElrick
 */
public class evalua_2_5 extends ActionSupport{
    private String aceptado;
    private String comentario;
    private String puntaje;
    private String id_actividad;
    private String accept = "Aceptado";
    int i;
    int puntajebueno;
    
    public evalua_2_5() {
    }
    //@Override
    public String execute() throws Exception {
        if(getAceptado().equals("Aceptado")){
            i = 1;
            puntajebueno = Integer.parseInt(getPuntaje());
            LoginBean lb = new LoginBean();
            lb.getConnection();
            int val=lb.executeUpdate("UPDATE profesor_tiene_obra SET aceptado = " + i + 
                ", comentarios = '" + getComentario() + "', puntaje = " + puntajebueno 
                        + " WHERE id_obra='"+ getId_actividad() +"'");
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
            lb.getConnection();
            int val=lb.executeUpdate("UPDATE profesor_tiene_obra SET aceptado = " + i + 
                ", comentarios = '" + getComentario() + "', validado = 0, puntaje = 0"
                        + " WHERE id_obra='"+ getId_actividad() +"'");
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
