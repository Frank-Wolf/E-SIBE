/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dependencias;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;

/**
 *
 * @author le_as
 */
public class Borrar_reporte_alumnos extends ActionSupport
{
    private String id_proyecto,id_usuario,id_alumno;

    public String getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(String id_alumno) {
        this.id_alumno = id_alumno;
    }

    public String getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(String id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }
    
    public Borrar_reporte_alumnos(){}
    
    @Override
    public String execute() throws Exception {
        int a = 0;
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        
            int val=lb.executeUpdate("UPDATE profesor_tiene_proyecto SET validado_alumno=NULL, tipo_alumno=NULL, registrado_alumno=NULL, id_alumno=0 WHERE id_usuario='"+getId_usuario()+"' and id_proyecto='"+id_proyecto+"' and id_alumno="+id_alumno+"");
            
            lb.closeConnection();
            if (val>0) 
                return "borrar_exitoso";
            else 
                return "borrar_fallo"; 
    }
    
}
