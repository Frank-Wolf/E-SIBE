/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PDF;

/**
 *
 * @author PsysacElrick
 */
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.ResultSet;

//Cross platform solution to view a PDF file
public class visualiza_constancia2_5 extends ActionSupport
{
    private String destPath;
    private String user;
    
    public InputStream inputStream;
    //File file = new File("C:\\psf\\Home\\Documents\\11111\\AlumnosSS\\prueba.pdf");//"C:\\psf\\Home\\Documents\\11111\\AlumnosSS\\prueba.pdf"
    public String execute() throws Exception{
        
        admins.LoginBean lb = new admins.LoginBean();
        lb.getConnection();
        ResultSet rs = lb.executeQuery("SELECT * FROM profesor_tiene_obra WHERE id_usuario = '" + user + "'");
        while(rs.next()){
            destPath = rs.getString("ruta_alm");
        }
        File file = new File(destPath);
        

            try {

            inputStream = new DataInputStream( new FileInputStream(file));

        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
   return SUCCESS;
}
    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }



    public InputStream getInputStream() {
        return inputStream;
    }
    public String getDestPath() {
        return destPath;
    }

    public void setDestPath(String destPath) {
        this.destPath = destPath;
    }

    public String getUsername() {
        return user;
    }

    public void setUsername(String username) {
        this.user = username;
    }

}

