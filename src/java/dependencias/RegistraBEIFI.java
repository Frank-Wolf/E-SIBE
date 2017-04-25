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
      Connection conn = null;
        LoginBean lb = new LoginBean();
        lb.getConnection();
   
        try {
         String URL = "jdbc:mysql://localhost:3306/esibe";
         Class.forName("com.mysql.jdbc.Driver");
         conn = DriverManager.getConnection(URL, "root", "root");
//         String sql = "insert into alumno (id_alumno, nom_alumno) values ";//probar con select*
//         sql+=" ('"+getId_alumno()+"','"+getNom_alumno()+"')";
//         
//         String val="update proyecto set id_alumno='"+getId_alumno()+"' where id_proyecto='"+getId_proyecto()+"'";
//         PreparedStatement ps = conn.prepareStatement(sql); 
//         PreparedStatement ps3 = conn.prepareStatement (val);
         
         if(lb.valida_alumno(id_alumno))
         {
             System.out.println("update");
             
                System.out.println(fecha_reg);
                System.out.println(id_proyecto);
                System.out.println(id_alumno);
         
            String borrau= "delete from profesor_tiene_proyecto where id_usuario='"+id_usuario+"' and id_proyecto='"+id_proyecto+"' and id_alumno='0'";
            PreparedStatement  borru= conn.prepareStatement (borrau);
            int boru = borru.executeUpdate();
            System.out.println("delete listo");
            
            int proy= lb.executeUpdate("update proyecto set id_alumno="+id_alumno+" where id_proyecto='"+id_proyecto+"' and id_alumno=0");            
            System.out.println("update listo");
            
            System.out.println("valores para insert");
            System.out.println(id_usuario);
            System.out.println(id_alumno);
            System.out.println(id_proyecto);
            System.out.println(rol_profesor);
            int insertau = lb.executeUpdate("insert into profesor_tiene_proyecto (id_usuario,id_alumno,id_proyecto,rol_profesor,validado,validado_alumno) values ("+id_usuario+","+id_alumno+",'"+id_proyecto+"','"+rol_profesor+"',0,0) ");
            
            int fecha= lb.executeUpdate("update profesor_tiene_proyecto set fecha_val = str_to_date('"+fecha_reg+"',%d-%m-%Y)");
         
         }
         else
         {           
         System.out.println("insert y update");  
         System.out.println(fecha_reg);
            int ins = lb.executeUpdate("insert into alumno (id_alumno, nom_alumno,recibido) values ('"+id_alumno+"','"+nom_alumno+"',0)");
            int borra= lb.executeUpdate( "delete from profesor_tiene_proyecto where id_usuario='"+id_usuario+"' and id_proyecto='"+id_proyecto+"' and id_alumno='0'");
            int proy= lb.executeUpdate("update proyecto set id_alumno="+id_alumno+" where id_proyecto='"+id_proyecto+"' and id_alumno=0");
            int inserta= lb.executeUpdate("insert into profesor_tiene_proyecto (id_usuario,id_alumno,id_proyecto,rol_profesor,validado_alumno,fecha_val) values ('"+id_usuario+",'"+id_alumno+"','"+id_proyecto+"' ,'"+rol_profesor+"' ,0,str_to_date('"+fecha_reg+"', '%d-%m-%Y') )");
            
            
         }
           
         
         
         
         

         
      } catch (Exception e) {
         ret = ERROR;
         System.out.println(e.getMessage());
      } finally {
         if (conn != null) {
            try {
               conn.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
         }
      }
      return ret; 
        
    }
    
    
    
}
