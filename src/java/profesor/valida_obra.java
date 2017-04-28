/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.sql.ResultSet;
/**
 *
 * @author le_as
 */
public class valida_obra extends ActionSupport{
    String test;
    private String id_obra,username;
    private int  id_tipo_obra;

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
   
           
   
    public String execute() throws Exception {
        
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
                int r=lb.executeUpdate("update profesor_tiene_obra set validado=1 where id_obra='"+id_obra+"' and id_usuario='"+username+"' and validado=0");
                if(r<1)
                {
                    addFieldError("id_obra","Esta obra ya fue registrada");
                    lb.closeConnection();
                    return ERROR;
                }
                else
                {
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
}
