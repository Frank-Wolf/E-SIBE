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
public class valida_proyecto extends ActionSupport
{
    String test;
    private String username, rol_profesor;
    private String id_proyecto;
    private File myFile;
    private String myFileFileName;
    private String destPath;
    private String activity;
    private String myFileContentType;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRol() {
        return rol_profesor;
    }

    public void setRol(String rol_profesor) {
        this.rol_profesor = rol_profesor;
    }

    public String getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(String id_proyecto) {
        this.id_proyecto = id_proyecto;
    }
    
    
//<<<<<<< Upstream, based on origin/master
    
    public String execute() throws Exception {
        //destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
        destPath = "C:\\Users\\le_as\\Documents\\Pruebas_pdf\\";
        destPath += getUsername() + "\\" + getActivity() + "\\";
//=======
         if(id_proyecto.equals(""))
        {
            addFieldError("id_proyecto","Este campo es necesario");
            return ERROR;
        }
        int periodox=0, numero = 0;
        String limit="limit";
        
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        
        ResultSet rperiodo= lb.executeQuery("SELECT * FROM evaluador");
        while(rperiodo.next())
        {
            periodox=rperiodo.getInt("periodo_actual");
        }
        
        ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto where id_usuario="+username+" and periodo="+periodox+" and validado=1 ");
        if(cuenta.next())
        {
            System.out.println(cuenta.getInt(1));
            if(cuenta.getInt(1)==1){
            lb.closeConnection();
            return limit;}
            
        }
        
        ResultSet pr=lb.executeQuery("select * from profesor_tiene_proyecto where id_usuario="+username+" and id_proyecto='"+id_proyecto+"'");
        while(pr.next())
        {   
            if(pr.getInt("validado")==1)
            {
                addFieldError("id_proyecto","Este Proyecto ya habia sido validado");
                lb.closeConnection();
                return ERROR;
            }
            else
            {
                /***Asignar periodo****/
                        int periodo = 0;
                        ResultSet rs = lb.executeQuery("SELECT * FROM evaluador");
                        while(rs.next()){
                            periodo = rs.getInt("periodo_actual");
                        }
                /***Asignar periodo****/
                lb.executeUpdate("update profesor_tiene_proyecto set validado=1, periodo = " + periodo + " where id_usuario='"+getUsername()+"'and id_proyecto='"+id_proyecto+"'" );
                /************************************************************************************************/
                            try{
                                System.out.println("Src File name: " + myFile);
                                System.out.println("Dst File name: " + destPath);
                                
                                File destFile  = new File(destPath, myFileFileName);
                                FileUtils.copyFile(myFile, destFile);
                                int ruta = lb.executeUpdate("UPDATE profesor_tiene_proyecto SET ruta_alm = 'C:\\\\psf\\\\Home\\\\Documents\\\\"
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_proyecto = '" + getId_proyecto() + "'");
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
                    
        addFieldError("id_proyecto","No se encontro vinculo entre usted y el proyecto, comuniquese a SIP");
        lb.closeConnection();
        return "error";
        }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String getRol_profesor() {
        return rol_profesor;
    }

    public void setRol_profesor(String rol_profesor) {
        this.rol_profesor = rol_profesor;
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

