/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PDF;
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
public class Subir_PDF extends ActionSupport{
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private String destPath;
    private String username;
    
    public String execute() throws SQLException, PropertyVetoException
   {
      /* Copy file to a safe location */
      destPath = "C:\\psf\\Home\\Documents\\5555\\AlumnosBEIFI\\";//\\psf\Home\Documents\Prueba
      destPath += username;
      try{
     	 System.out.println("Src File name: " + myFile);
     	 System.out.println("Dst File name: " + myFileFileName);
     	    	 
     	 File destFile  = new File(destPath, myFileFileName);
    	 FileUtils.copyFile(myFile, destFile);
         profesor.LoginBean lb = new profesor.LoginBean();
         lb.getConnection();
         int ruta = lb.executeUpdate("update profesor_tiene_obra set ruta_alm='"+destPath+myFileFileName+"' where id_usuario='"+getUsername()+"';");
  
      }catch(IOException e){
         e.printStackTrace();
         return ERROR;
      }

      return SUCCESS;
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
       public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String display() {
		return NONE;
	}
    
}
