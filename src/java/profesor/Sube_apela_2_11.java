/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;
import static com.opensymphony.xwork2.Action.ERROR;
import java.io.File;
import org.apache.commons.io.FileUtils;
import java.io.IOException; 
import com.opensymphony.xwork2.ActionSupport;
import java.beans.PropertyVetoException;
import java.sql.SQLException;

/**
 *
 * @author PsysacElrick
 */
public class Sube_apela_2_11 {
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private String destPath;
    private String id_actividad;
    private String username;
    
    public String execute() throws SQLException, PropertyVetoException//each time the professor calls this function,
            //we need to receive the username (employee number) and the name of the table
            //thus, we can get the complete address of the saved file
   {
        destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
        destPath += getUsername() + "\\Apelacion\\";
        try{
            System.out.println("Src File name: " + myFile);
            System.out.println("Dst File name: " + destPath);
            LoginBean lb = new LoginBean();
            lb.getConnection();                
            File destFile  = new File(destPath, myFileFileName);
            FileUtils.copyFile(myFile, destFile);
            //System.out.println(myFileFileName);
            int ruta = lb.executeUpdate("UPDATE profesor_tiene_tt SET ruta_alm = 'C:\\\\psf\\\\Home\\\\Documents\\\\"
                    + getUsername() + "\\\\Apelacion\\\\" + getMyFileFileName() + "', validado = 1, aceptado = 0 "
                    + "WHERE id_TT = '" + getId_actividad() + "'");
            System.out.println(id_actividad);
            lb.closeConnection();
            }catch(IOException e){
                e.printStackTrace();
               return ERROR;
                            }
        return "success";
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

    public String getId_actividad() {
        return id_actividad;
    }

    public void setId_actividad(String id_actividad) {
        this.id_actividad = id_actividad;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}

