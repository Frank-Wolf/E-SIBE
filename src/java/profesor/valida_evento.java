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
import java.io.File;
import java.sql.ResultSet;
/**
 *
 * @author le_as
 */
public class valida_evento extends ActionSupport{
    
    private String id_publicacion,id_evento,username;
    private int id_tipo_pub;

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
    
        if(id_evento.equals(""))    
        {
            addFieldError("id_evento","Este campo no puede ser vacio");
            return ERROR;
        }
        
        if(username.equals(""))    
        {
            addFieldError("username","Este campo no puede ser vacio");
            return ERROR;
        }
        
        if(id_tipo_pub==-1)    
        {
            addFieldError("id_tipo_pub","Este campo no puede ser vacio");
            return ERROR;
        }
        
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        ResultSet obra=lb.executeQuery("select * from evento_academico where id_evento='"+id_evento+"'");
        while(obra.next())
        {
            System.out.println("Encontre el evento academico");
            ResultSet rela=lb.executeQuery("select * from profesor_participa_ev where id_evento='"+id_evento+"' and id_usuario="+username+"");
            while(rela.next())
            {
                System.out.println("Encontre la participacion del profesor");
                ResultSet pub=lb.executeQuery("select * from profesor_tiene_pub where id_evento='"+id_evento+"' and id_usuario="+username+" and id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+"");
                while(pub.next())
                {   
                    System.out.println("Encontre la publicacion");
                    int re=lb.executeUpdate("update profesor_tiene_pub set validado=1 where id_evento='"+id_evento+"' and id_usuario="+username+" and id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+" and validado=0");
                    int r=lb.executeUpdate("update profesor_participa_ev set validado=1 where id_evento='"+id_evento+"' and id_usuario="+username+" and validado=0");
                    if(re<1)
                    {
                        addFieldError("id_evento","Esta evento ya fue registrada");
                        lb.closeConnection();
                        return ERROR;
                    }
                    else
                    {
                        lb.closeConnection();
                        return SUCCESS;
                    }
                }
                addFieldError("id_publicacion","Esta publicacion no esta vinculada con usted");
                lb.closeConnection();
                return ERROR;    
            }
            lb.closeConnection();
            addFieldError("id_evento","Usted no tiene participacion en Este Evento Academico, Verifique sus datos");
            return ERROR;
        }
        lb.closeConnection();
        addFieldError("id_evento","Esta Evento no esta registrado en el sistema, comuniquese con su Unidad Academica");
        return ERROR;
    }      
}

