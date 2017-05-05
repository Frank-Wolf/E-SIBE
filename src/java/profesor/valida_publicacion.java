/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

/**
 *
 * @author le_as
 */
import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
/**
 *
 * @author le_as
 */
public class valida_publicacion extends ActionSupport{
     private String id_publicacion,nombre_publicacion,username;

    public void setId_publicacion(String id_publicacion) {
        this.id_publicacion = id_publicacion;
    }
    private int id_tipo_pub;

    public String getId_publicacion() {
        return id_publicacion;
    }

    public String getNombre_publicacion() {
        return nombre_publicacion;
    }

    public void setNombre_publicacion(String nombre_publicacion) {
        this.nombre_publicacion = nombre_publicacion;
    }



    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId_tipo_pub() {
        return id_tipo_pub;
    }

    public void setId_tipo_pub(int id_tipo_pub) {
        this.id_tipo_pub = id_tipo_pub;
    }
    
    
           
   
    @Override
    public String execute() throws Exception {
        
        if(id_publicacion.equals(""))
        {
            addFieldError("id_publicacion","Este campo no puede ser vacio");
            return ERROR;
        }    
    
        if(nombre_publicacion.equals(""))    
        {
            addFieldError("nombre_publiacion","Este campo no puede ser vacio");
            return ERROR;
        }
        
        if(id_tipo_pub==-1)    
        {
            addFieldError("id_tipo_pub","Este campo no puede ser vacio");
            return ERROR;
        }
        
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        ResultSet pub= lb.executeQuery("select * from publicacion where id_publicacion='"+id_publicacion+"' and nom_public='"+nombre_publicacion+"'");
        while(pub.next())
        {
            ResultSet pub_prof=lb.executeQuery("select * from profesor_tiene_pub where validado=0 and id_evento='0' and id_usuario="+username+" and id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+"");
            while(pub_prof.next())
            {   
                System.out.println("Encontre la publicacion");
                int re=lb.executeUpdate("update profesor_tiene_pub set validado=1 where id_evento='0' and validado=0 and id_usuario="+username+" and id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+"");
               
                if(re<1)
                {
                    addFieldError("id_publicacion","Verifique el tipo de publicacion");
                    lb.closeConnection();
                    return ERROR;
                }
                else
                {
                    lb.closeConnection();
                    return SUCCESS;
                }
            }
            addFieldError("id_publicacion","Esta publicacion no esta relacionada con usted");
            lb.closeConnection();
            return ERROR;    
        }
        addFieldError("id_publicacion","Esta publicacion no existe");
        lb.closeConnection();
        return ERROR;    
    }
}

