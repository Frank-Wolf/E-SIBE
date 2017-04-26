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

    private String id_proyecto,nom_alumno,rol_profesor;

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
      
        LoginBean lb = new LoginBean();
        lb.getConnection();
   
         
            if(lb.valida_alumno(id_alumno))
            {
               int proy= lb.executeUpdate("update profesor_tiene_proyecto set id_alumno='"+id_alumno+"',tipo_alumno='BEIFI', "
                       + "fecha_val_alumno=str_to_date('"+fecha_reg+"','%d-%m-%Y'), validado_alumno=0 where id_proyecto='"+id_proyecto+"'"
                               + " and id_alumno=0 and id_usuario='"+id_usuario+"'");            
               System.out.println("update listo");
               
               if(proy<1)
               {
                   lb.closeConnection();
                   return ERROR;
               }
            }
            else
            {           
               int ins = lb.executeUpdate("insert into alumno (id_alumno, nom_alumno,recibido) values ('"+id_alumno+"','"+nom_alumno+"',0)");
               int proyw= lb.executeUpdate("update profesor_tiene_proyecto set id_alumno='"+id_alumno+"', fecha_val_alumno ="
                       + " str_to_date('"+fecha_reg+"','%d-%m-%Y'), tipo_alumno='BEIFI' where id_proyecto='"+id_proyecto+"' "
                               + "and id_alumno=0 and id_usuario='"+id_usuario+"'");
               
               if(proyw<1 || ins <1)
               {
                   lb.closeConnection();
                   return ERROR;
               }
               
            } 
        
        lb.closeConnection();
        return ret; 
    }
}
