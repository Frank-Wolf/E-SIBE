/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import static com.opensymphony.xwork2.Action.ERROR;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import org.apache.commons.io.FileUtils;
/**
 *
 * @author le_as
 */
public class valida_obra extends ActionSupport{
    String test;
    private String id_obra,username;
    private int  id_tipo_obra;
    private File myFile;
    private String myFileFileName;
    private String destPath;
    private String activity;
    private String myFileContentType;
   
           
   
    public String execute() throws Exception {
        destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
        destPath += getUsername() + "\\" + getActivity() + "\\";
        if(id_obra.equals(""))
        {
            addFieldError("id_obra","Este campo no puede ser vacio");
            return ERROR;
        }    
    
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        ResultSet obra=lb.executeQuery("select * from obra where id_obra='"+id_obra+"'");
        while(obra.next())
        {
            ResultSet rela=lb.executeQuery("select * from profesor_tiene_obra where id_obra='"+id_obra+"' and id_usuario='"+username+"'");
            while(rela.next())
            {
                /***Asignar periodo****/
                        int periodo = 0;
                        ResultSet rs = lb.executeQuery("SELECT * FROM evaluador");
                        while(rs.next()){
                            periodo = rs.getInt("periodo_actual");
                        }
                        /***Asignar periodo****/
                int r=lb.executeUpdate("update profesor_tiene_obra set validado=1, periodo = " + periodo + " where id_obra='"+id_obra+"' "
                        + "and id_usuario='"+username+"' and validado=0");
                if(r<1)
                {
                    addFieldError("id_obra","Esta obra ya fue registrada");
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
                                int ruta = lb.executeUpdate("UPDATE profesor_tiene_obra SET ruta_alm = 'C:\\\\psf\\\\Home\\\\Documents\\\\"
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_obra = " + getId_obra());
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
            lb.closeConnection();
            addFieldError("id_obra","Esta Obra no tiene vinculo con Usted, Verifique sus datos");
            return ERROR;
        }
        lb.closeConnection();
        addFieldError("id_obra","Esta Obra no esta registrada en el sistema, comuniquese con INDAUTOR");
        return ERROR;
    }     
    
    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }

    public String getMyFileContentType() {
        return myFileContentType;
    }

    public void setMyFileContentType(String myFileContentType) {
        this.myFileContentType = myFileContentType;
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
           
    public String getId_obra() {
        return id_obra;
    }

    public void setId_obra(String id_obra) {
        this.id_obra = id_obra;
    }

    public int getId_tipo_obra() {
        return id_tipo_obra;
    }

    public void setId_tipo_obra(int id_tipo_obra) {
        this.id_tipo_obra = id_tipo_obra;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }
    
    
    
}
