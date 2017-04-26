/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import com.opensymphony.xwork2.ActionSupport;

/**
 *
 * @author le_as
 */
public class valida_BEIFI extends ActionSupport
{
    String test;
    private String username, tipo_alumno;

    public String getTipo_alumno() {
        return tipo_alumno;
    }

    public void setTipo_alumno(String tipo_alumno) {
        this.tipo_alumno = tipo_alumno;
    }
    private String id_proyecto;
    private int id_alumno;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(String id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public int getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(int id_alumno) {
        this.id_alumno = id_alumno;
    }

    public String execute() throws Exception 
    {
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();

            int acepta=lb.executeUpdate("update profesor_tiene_proyecto set validado_alumno=1 where id_alumno='"+id_alumno+"' and"
                    + " id_usuario='"+getUsername()+"' and validado_alumno=0 and tipo_alumno='"+tipo_alumno+"' and id_proyecto='"+id_proyecto+"'" );
            if(acepta>0)
            {
                lb.closeConnection();
                return "test";
            }
            else
            {
                lb.closeConnection();
                addFieldError("id_alumno","Hay un problema");
                return "error";
            }
    }
  
}
