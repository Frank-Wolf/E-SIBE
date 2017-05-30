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
import java.io.IOException;
import java.sql.ResultSet;
import org.apache.commons.io.FileUtils;
/**
 *
 * @author le_as
 */
public class valida_publicacion extends ActionSupport{
     private String id_publicacion,nombre_publicacion,username;
     private File myFile;
    private String myFileFileName;
    private String destPath;
    private String activity;
    private String myFileContentType;

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
        //destPath = ".\\Usuarios\\";
        //destPath = "D:\\home\\site\\wwwroot\\Usuarios\\";//server route
        destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
        //destPath = "C:\\Users\\le_as\\Documents\\Pruebas\\";
        destPath += getUsername() + "\\" + getActivity() + "\\";
        
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
                /***Asignar periodo****/
                        int periodo = 0;
                        ResultSet rs = lb.executeQuery("SELECT * FROM evaluador");
                        while(rs.next()){
                            periodo = rs.getInt("periodo_actual");
                        }
                        /***Asignar periodo****/
                int re=lb.executeUpdate("update profesor_tiene_pub set validado=1, periodo = " + periodo 
                        + " where id_evento='0' and validado=0 and id_usuario="+username+" and id_publicacion='"+id_publicacion+"' and id_tipo_pub="+id_tipo_pub+"");
               
                if(re<1)
                {
                    addFieldError("id_publicacion","Verifique el tipo de publicacion");
                    lb.closeConnection();
                    return ERROR;
                }
                else
                {
                    /************************************************************************************************/
                            try{
                                System.out.println("Src File name: " + myFile);
                                System.out.println("Dst File name: " + destPath);
                                
                                File destFile  = new File(destPath, myFileFileName);
                                FileUtils.copyFile(myFile, destFile);
                                //"D:\\home\\site\\wwwroot\\Usuarios"
                                int ruta = lb.executeUpdate("UPDATE profesor_tiene_pub SET ruta_alm = 'C:\\\\psf\\\\Home\\\\Documents\\\\"
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_publicacion = '" + id_publicacion + "'");
                                /*int ruta = lb.executeUpdate("UPDATE profesor_tiene_pub SET ruta_alm = 'D:\\\\home\\\\site\\\\wwwroot\\\\Usuarios\\\\"//update for server
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_publicacion = '" + id_publicacion + "'");*/
                                }catch(IOException e){
                                e.printStackTrace();
                                lb.closeConnection();
                                return ERROR;
                            }
                            /************************************************************************************************/
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

    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }

    public String getMyFileFileName() {
        return myFileFileName;
    }

    public void setMyFileFileName(String myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

    public String getDestPath() {
        return destPath;
    }

    public void setDestPath(String destPath) {
        this.destPath = destPath;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }

    public String getMyFileContentType() {
        return myFileContentType;
    }

    public void setMyFileContentType(String myFileContentType) {
        this.myFileContentType = myFileContentType;
    }
    
}

