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
public class valida_part extends ActionSupport
{
    String test;
    private String username, u_a,id_part;
    private File myFile;
    private String myFileFileName;
    private String destPath;
    private String activity;
    private String myFileContentType;

   public String getU_a() {
        return u_a;
    }

    public void setU_a(String u_a) {
        this.u_a = u_a;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getId_part() {
        return id_part;
    }

    public void setId_part(String id_part) {
        this.id_part = id_part;
    }
    public String execute() throws Exception 
    {
        //destPath = "C:\\psf\\Home\\Documents\\";//\\psf\Home\Documents\Prueba
        destPath = ".\\bin\\apache-tomcat-8.0.43\\webapps\\Usuarios\\";//route for server
        destPath += getUsername() + "\\" + getActivity() + "\\";
        if(id_part.equals(""))
        {
            addFieldError("id_part","Este campo es necesario");
            return ERROR;
        }
        
        if(u_a.equals(""))
        {
            addFieldError("u_a","Este campo es necesario");
            return ERROR;
        }
        int periodox=0, numero = 0;
        String limit="limit";
        int idss=0;
        profesor.LoginBean lb = new profesor.LoginBean();
        lb.getConnection();
        
        ResultSet rperiodo= lb.executeQuery("SELECT * FROM evaluador");
        while(rperiodo.next())
        {
            periodox=rperiodo.getInt("periodo_actual");
        }
        ResultSet ids=lb.executeQuery("SELECT * FROM profesor_participa_en_plan where id_usuario="+username+" and id_part='"+id_part+"'");
        while(ids.next())
        {
            idss=ids.getInt("id_tipo_part");
        }
        
        if(idss==1)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        if(idss==2)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        if(idss==3)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        if(idss==4)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        if(idss==5)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        if(idss==6)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        if(idss==7)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        if(idss==8)
        {
            ResultSet cuenta=lb.executeQuery("SELECT COUNT(*) FROM profesor_participa_en_plan where id_usuario="+username+" and id_tipo_part="+idss+" and periodo="+periodox+" and validado=1 ");
            if(cuenta.next())
            {
                System.out.println(periodox);
                System.out.println(cuenta.getInt(1));
                if(cuenta.getInt(1)==2)
                {
                    lb.closeConnection();
                    return limit;
                }

            }
        }
        
        
        ResultSet val=lb.executeQuery("select * from part_plan_est where id_part ='"+id_part+"' and u_a='"+u_a+"'");
        while(val.next())
        {
            ResultSet prof_val=lb.executeQuery("select * from profesor_participa_en_plan where id_usuario="+username+" and id_part='"+id_part+"'");
            while(prof_val.next())
            {   
                ResultSet profd=lb.executeQuery("select * from profesor_participa_en_plan where id_usuario="+username+" and id_part='"+id_part+"' and validado=0");
                while(profd.next())
                {
                    /***Asignar periodo****/
                        int periodo = 0;
                        ResultSet rs = lb.executeQuery("SELECT * FROM evaluador");
                        while(rs.next()){
                            periodo = rs.getInt("periodo_actual");
                        }
                        /***Asignar periodo****/
                    lb.executeUpdate("update profesor_participa_en_plan set validado=1, periodo = " + periodo + 
                            " where id_usuario="+username+" and id_part='"+id_part+"'");
                    /************************************************************************************************/
                            try{
                                System.out.println("Src File name: " + myFile);
                                System.out.println("Dst File name: " + destPath);
                                
                                File destFile  = new File(destPath, myFileFileName);
                                FileUtils.copyFile(myFile, destFile);
                                /*int ruta = lb.executeUpdate("UPDATE profesor_participa_en_plan SET ruta_alm = 'C:\\\\psf\\\\Home\\\\Documents\\\\"
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_usuario = " + username + " AND id_part = '" + getId_part() + "'");*/
                                int ruta = lb.executeUpdate("UPDATE profesor_participa_en_plan SET ruta_alm = '\\\\Usuarios\\\\"
                                        + getUsername() + "\\\\" + getActivity() + "\\\\" + getMyFileFileName() + "' "
                                    + "WHERE id_usuario = " + username + " AND id_part = '" + getId_part() + "'");
                            }catch(IOException e){
                                e.printStackTrace();
                                lb.closeConnection();
                                return ERROR;
                            }
                            /************************************************************************************************/
                    lb.closeConnection();
                    return SUCCESS;
                }
                
                addFieldError("id_part","Esta Participacion ya fue registrada");
                lb.closeConnection();
                return ERROR;    
            }
            addFieldError("id_part","Esta Participacion no tiene relacion con usted");
            lb.closeConnection();
            return ERROR;
        }
        addFieldError("id_part","Esta Participacion no existe, verifique sus datos");
        lb.closeConnection();
        return ERROR;    
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
