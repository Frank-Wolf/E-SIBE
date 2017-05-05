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
public class valida_tt extends ActionSupport{
    String test;
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private String destPath;
    private String id_TT,username;
    private int  id_alumno;
    private String activity;
   

    public String execute() throws Exception {
        
        destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
        destPath += getUsername() + "\\" + getActivity() + "\\";
        
        if(id_TT.equals(""))
        {
            addFieldError("id_TT","Este campo no puede ser vacio");
            return ERROR;
        }
        if(id_alumno==0)
        {
            addFieldError("id_alumno","Este campo no puede ser vacio");
            return ERROR;
        }
    
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        ResultSet obra=lb.executeQuery("select * from tt where id_tt='"+id_TT+"'");
        while(obra.next())
        {
            ResultSet rela=lb.executeQuery("select * from profesor_tiene_tt where id_tt='"+id_TT+"' and id_usuario='"+username+"' and id_alumno="+id_alumno+"");
            while(rela.next())
            {
                int r=lb.executeUpdate("update profesor_tiene_tt set validado=1 where id_tt='"+id_TT+"' and id_usuario='"+username+"' and id_alumno="+id_alumno+" and validado=0");
                if(r<1)
                {
                    addFieldError("id_TT","Esta obra ya fue registrada");
                    
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
                                int ruta = lb.executeUpdate("UPDATE profesor_tiene_tt SET ruta_alm = 'C:\\\\psf\\\\Home\\\\Documents\\\\"
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_usuario = " + username + " AND id_alumno = " + getId_alumno() );
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
            addFieldError("id_TT","Este Trabajo terminal no tiene vinculo con Usted, Verifique sus datos");
            return ERROR;
        }
        lb.closeConnection();
        addFieldError("id_TT","Este Trabajo terminal no esta registrado en el sistema, comuniquese con la C.A.T.T.");
        return ERROR;
              
    }
    
    public String getActivity() {
        return activity;
    }

    public void setActivity(String activity) {
        this.activity = activity;
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
}
