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
public class valida_tt extends ActionSupport{
    String test;
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private String destPath;
    private String id_TT,username;
    private int  id_alumno;

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
    
    
           
    public String getId_TT() {
        return id_TT;
    }

    public void setId_TT(String id_TT) {
        this.id_TT = id_TT;
    }

    public int getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(int id_alumno) {
        this.id_alumno = id_alumno;
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
            
            if(lb.valida_TT(username,id_TT,id_alumno))
            {
                int acepta=lb.executeUpdate("update profesor_tiene_tt set validado=1 where id_usuario='"+getUsername()+"' and id_TT='"+getId_TT()+"';" );
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
