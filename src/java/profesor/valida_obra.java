/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import static com.opensymphony.xwork2.Action.ERROR;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import org.apache.commons.io.FileUtils;
import sesion.*;
/**
 *
 * @author le_as
 */
public class valida_obra extends ActionSupport{
    String test;
    private String username;
    private int id_obra, id_tipo_obra;

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
    
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private String destPath;
           
    public int getId_obra() {
        return id_obra;
    }

    public void setId_obra(int id_obra) {
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
   
           
   
    public String execute() throws Exception {
    
         profesor.LoginBean lb = new profesor.LoginBean();
            lb.getConnection();
            
            if(lb.valida_datos(username,id_obra,id_tipo_obra))
            {
                int acepta=lb.executeUpdate("update profesor_tiene_obra set validado=1 where id_usuario='"+getUsername()+"';" );
                if(acepta>0)
                {
                    lb.closeConnection();
                    return "test";
                }
                else
                {
                    lb.closeConnection();
                    addFieldError("id_obra","Hay un problema");
                    return "error";
                }
            }


            else
            { 
                addFieldError("id_obra","Hay un problema con tus datos o quizas ya fue registrada");
                lb.closeConnection();
                return "error";
            } 
        }
       
        
     
}
