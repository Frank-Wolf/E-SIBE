/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;

import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author le_as
 */
public class valida_BEIFI extends ActionSupport
{
    String test;
    private String username, tipo_alumno;
    private String id_proyecto;
    private int id_alumno;
    private File myFile;
    private String myFileFileName;
    private String destPath;
    private String activity;
    private String myFileContentType;

    public String execute() throws Exception 
    {
         
        //destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
        destPath = "C:\\Users\\le_as\\Documents\\Pruebas_pdf\\";
        destPath += getUsername() + "\\" + getActivity() + "\\";
        if(id_proyecto.equals("")){
            addFieldError("id_proyecto","Este campo es necesario");
        
        }
        
        if(id_alumno==0){
            addFieldError("id_alumno","Este campo es necesario");
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
        if(tipo_alumno.equals("BEIFI")){
        ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto where id_usuario="+username+" and periodo="+periodox+" and validado_alumno=1 and tipo_alumno='BEIFI'");
        
        if(cuenta.next())
        {
            System.out.println(cuenta.getInt(1));
            if(cuenta.getInt(1)==1){
            lb.closeConnection();
            return limit;}
            
        }}
        if(tipo_alumno.equals("SS")){
        ResultSet servicio=lb.executeQuery("SELECT COUNT(*) FROM profesor_tiene_proyecto where id_usuario="+username+" and periodo="+periodox+" and validado_alumno=1 and tipo_alumno='SS'");
        if(servicio.next())
        {System.out.println(servicio.getInt(1));
            if(servicio.getInt(1)==4){
            lb.closeConnection();
            return limit;}
        }
        }
        System.out.println(username);
        System.out.println(id_alumno);
        ResultSet ex_prof_proy=lb.executeQuery("select * from profesor_tiene_proyecto where id_usuario="+username+" and id_alumno="+id_alumno+"");  //verifica que el profesor está asociado con el proyecto
        while(ex_prof_proy.next())
        {
            System.out.println(ex_prof_proy.getString("id_proyecto"));
            
            if(id_proyecto.equals(ex_prof_proy.getString("id_proyecto")))
            {
                System.out.println("Encontro relacion entre proyecto y alumno");
                System.out.println(id_alumno);
                //ResultSet alumno= lb.executeQuery("select * from alumno");
                if(id_alumno ==ex_prof_proy.getInt("id_alumno"))
                {
                    System.out.println("Busca alumno");
                    //ResultSet ap=lb.executeQuery("select * from alumno");
                    if(id_alumno == ex_prof_proy.getInt("id_alumno"))
                    {
                        System.out.println("Valida alumno");
                        /***Asignar periodo****/
                        int periodo = 0;
                        ResultSet rs = lb.executeQuery("SELECT * FROM evaluador");
                        while(rs.next()){
                            periodo = rs.getInt("periodo_actual");
                        }
                        /***Asignar periodo****/
                        int acepta=lb.executeUpdate("UPDATE profesor_tiene_proyecto SET validado_alumno=1, periodo = " + periodo + 
                                " WHERE id_alumno='"+id_alumno+"' AND id_usuario='"+getUsername()+"' AND validado_alumno=0 "
                                        + "AND tipo_alumno='"+tipo_alumno+"' AND id_proyecto='"+id_proyecto+"'" );
                        if(acepta>0)
                        {
                            /************************************************************************************************/
                            try{
                                System.out.println("Src File name: " + myFile);
                                System.out.println("Dst File name: " + destPath);
                                
                                File destFile  = new File(destPath, myFileFileName);
                                FileUtils.copyFile(myFile, destFile);
                                int ruta = lb.executeUpdate("UPDATE profesor_tiene_proyecto SET ruta_alumno = 'C:\\\\psf\\\\Home\\\\Documents\\\\"
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_alumno = " + getId_alumno());
                            }catch(IOException e){
                                e.printStackTrace();
                                lb.closeConnection();
                                return ERROR;
                            }
                            /************************************************************************************************/
                            lb.closeConnection();
                            return "test";
                        }
                        else
                        {
                           lb.closeConnection();
                           addFieldError("id_tipo_alumno","Tipo de Alumno Erroneo");
                           return "error";
                        }
                    }
                    else
                    {
                        System.out.println(ex_prof_proy.getString("No encontro alumno"));
                        lb.closeConnection();
                        addFieldError("id_alumno","Este alumno no esta registrado en tu proyecto");
                        return "error";
                    }        
                }
                else
                {
                    lb.closeConnection();
                        addFieldError("id_alumno","Este alumno no esta registrado en ESIBE, comunicate a SIP");
                        return "error";
                }
            }
            else
            {
                lb.closeConnection();
                addFieldError("id_proyecto","Lo sentimos, este proyecto no se relaciona con usted, comuniquese a SIP");
                return "error";
            }
                    
        
        }
        lb.closeConnection();
        addFieldError("id_proyecto","Lo sentimos, este Alumno no se relaciona con usted");
        return "error";
            
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId_proyecto() {
        return id_proyecto;
    }

    public void setId_proyecto(String id_proyecto) {
        this.id_proyecto = id_proyecto;
    }

    public int getId_alumno() {
        return id_alumno;
    }

    public void setId_alumno(int id_alumno) {
        this.id_alumno = id_alumno;
    }
        public String getTipo_alumno() {
        return tipo_alumno;
    }

    public void setTipo_alumno(String tipo_alumno) {
        this.tipo_alumno = tipo_alumno;
    }
  
    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
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
