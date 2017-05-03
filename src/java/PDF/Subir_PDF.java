/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PDF;
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
public class Subir_PDF extends ActionSupport{
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private String destPath;
    private String username;
    private String activity;
    
    public String execute() throws SQLException, PropertyVetoException//each time the professor calls this function,
            //we need to receive the username (employee number) and the name of the table
            //thus, we can get the complete address of the saved file
   {
      /* Copy file to a safe location */
      destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
      destPath += getUsername() + "\\" + getActivity() + "\\";//First username, then activity (from the instructive or the report of activities)
      try{
     	 System.out.println("Src File name: " + myFile);
     	 System.out.println("Dst File name: " + getActivity());
     	    	 
     	 File destFile  = new File(destPath, myFileFileName);
    	 FileUtils.copyFile(myFile, destFile);
         profesor.LoginBean lb = new profesor.LoginBean();
         lb.getConnection();
         int ruta = lb.executeUpdate("update profesor_tiene_obra set ruta_alm='" + destPath + getMyFileFileName() + "' "
                 + "where id_usuario='" + getUsername() + "';");
         lb.closeConnection();
      }catch(IOException e){
         e.printStackTrace();
         return ERROR;
      }
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
       public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public String display() {
		return NONE;
	}
    
    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
    }
    
}
