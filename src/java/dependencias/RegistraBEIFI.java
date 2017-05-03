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
public class RegistraBEIFI extends ActionSupport
{   

    private String id_proyecto,nom_alumno,rol_profesor, tipo_alumno;

    public String getTipo_alumno() {
        return tipo_alumno;
    }

    public void setTipo_alumno(String tipo_alumno) {
        this.tipo_alumno = tipo_alumno;
    }

    public String getRol_profesor() {
        return rol_profesor;
    }

    public void setRol_profesor(String rol_profesor) {
        this.rol_profesor = rol_profesor;
    }
    private int id_alumno,id_usuario;
    private String fecha_reg;

    public String getNom_alumno() {
        return nom_alumno;
    }

    public void setNom_alumno(String nom_alumno) {
        this.nom_alumno = nom_alumno;
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

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getFecha_reg() {
        return fecha_reg;
    }

    public void setFecha_reg(String fecha_reg) {
        this.fecha_reg = fecha_reg;
    }

   Random rand = new Random();
   int  n = rand.nextInt(500) + 1;
   public String execute() throws IOException, SQLException, PropertyVetoException 
   {
      String ret = SUCCESS;
      int bandera_alumno=0;
      int bandera_proy=0;
      int bandera_prof=0;
      
        if(id_usuario==0 ){
            addFieldError("id_usuario","Este campo es necesario");
            return ERROR;
        }
            
            
        
        if(id_alumno==0){
            addFieldError("id_alumno","Este campo es necesario");
            return ERROR;
        }
        
        if(id_proyecto.equals("")){
            addFieldError("id_proyecto","Este campo es necesario");
        }
            
        if(rol_profesor.equals("")){
            addFieldError("rol_profesor","Este campo es necesario");
            return ERROR;
        }
            
        if(nom_alumno.equals("")){
            addFieldError("nom_alumno","Este campo es necesario");
            return ERROR;
        }
                                
        if(fecha_reg.equals("")){
            addFieldError("fecha_reg","Este campo es necesario");
            return ERROR;
        }    
       
        LoginBean lb = new LoginBean();
        lb.getConnection();
        
        ResultSet comp=lb.executeQuery("select id_usuario, id_proyecto, id_alumno from profesor_tiene_proyecto where id_usuario="+id_usuario+" and id_proyecto='"+id_proyecto+"' and id_alumno="+id_alumno+"");
        while(comp.next())
        {
            addFieldError("id_proyecto","Este registro ya fue realizado");
            lb.closeConnection();
            return ERROR;
        }
      
        ResultSet ex_prof=lb.executeQuery("select id_usuario from usuario where id_usuario='"+id_usuario+"'"); // verifica que el proyecto exista
        while(ex_prof.next())
        {
            ResultSet ex_proy=lb.executeQuery("select id_proyecto from proyecto where id_proyecto='"+id_proyecto+"'");// verifica que el proyecto exista
            while(ex_proy.next())
            {
                ResultSet ex_rel=lb.executeQuery("select id_proyecto, id_usuario from profesor_tiene_proyecto where id_proyecto='"+id_proyecto+"' and id_usuario='"+id_usuario+"'");
                while(ex_rel.next())
                {
                    ResultSet alumn_pro=lb.executeQuery("select id_proyecto from profesor_tiene_proyecto where id_alumno=0 and id_usuario="+id_usuario+" and id_proyecto='"+id_proyecto+"'");
                    while(alumn_pro.next())
                    {
                        ResultSet alumn=lb.executeQuery("select id_alumno from alumno where id_alumno="+id_alumno+"");
                        while(alumn.next())
                        {
                            lb.executeUpdate("update profesor_tiene_proyecto set id_alumno ="+id_alumno+", validado_alumno=0, "
                                    + "tipo_alumno='BEIFI' where id_usuario="+id_usuario+" and id_proyecto='"+id_proyecto+"'");
                                lb.closeConnection();
                                return SUCCESS;
                        }
                        lb.executeUpdate("insert into alumno(id_alumno,nom_alumno,recibido) values("+id_alumno+",'"+nom_alumno+"',0)");
                        lb.executeUpdate("update profesor_tiene_proyecto set id_alumno ="+id_alumno+", validado_alumno=0, tipo_alumno='BEIFI' "
                            + "where id_usuario="+id_usuario+" and id_proyecto='"+id_proyecto+"'");
                        lb.closeConnection();
                        return SUCCESS;
                    }
                    ResultSet alu=lb.executeQuery("select id_alumno from alumno where id_alumno="+id_alumno+"");
                    while(alu.next())
                    {
                        lb.executeUpdate("insert into profesor_tiene_proyecto (id_proyecto,id_usuario,id_alumno,validado_alumno,rol_profesor,tipo_alumno)"
                                + "values ('"+id_proyecto+"',"+id_usuario+","+id_alumno+",0,'"+rol_profesor+"','BEIFI')");
                        lb.closeConnection();
                        return SUCCESS;
                    }
                    lb.executeUpdate("insert into alumno(id_alumno,nom_alumno,recibido) values("+id_alumno+",'"+nom_alumno+"',0)");
                    lb.executeUpdate("insert into profesor_tiene_proyecto (id_proyecto,id_usuario,id_alumno,validado_alumno,rol_profesor,tipo_alumno)"
                                + "values ('"+id_proyecto+"',"+id_usuario+","+id_alumno+",0,'"+rol_profesor+"','BEIFI')");
                    lb.closeConnection();
                        return SUCCESS;
                }
                addFieldError("id_proyecto","No existe un vinculo entre el proyecto y el profesor");
                lb.closeConnection();
                return ERROR;
            }
            addFieldError("id_proyecto","No se tiene registrado este proyecto");
            lb.closeConnection();
            return ERROR;
        }    
        
        addFieldError("id_usuario","No se tiene registrado a este profesor");
        lb.closeConnection();
        return ERROR;
    }
}
 