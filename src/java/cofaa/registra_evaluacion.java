/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cofaa;

import admins.LoginBean;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PsysacElrick
 */
public class registra_evaluacion extends ActionSupport{
    private String num_profesor;
    LoginBean lb = new LoginBean();
    public registra_evaluacion() throws Exception {
        execute();
    }
    //@Override
    public String execute() throws Exception {
        lb.getConnection();
        int puntaje = get_puntajefinal(); 
        String nivel = "";
        /*Assign level of the help*/
        if(puntaje >= 400 && puntaje < 600)
            nivel = "1";
        else if(puntaje >= 600 && puntaje < 800)
            nivel = "2";
        else if(puntaje >= 800 && puntaje < 1200)
            nivel = "3";
        else if(puntaje >= 1200)
            nivel = "4";
        else
            nivel = "1";
        /*Assign level of the helpEND*/
        System.out.println(getNum_profesor());
        int rn = lb.executeUpdate("UPDATE profesor SET nivel = '" + nivel + "' WHERE id_usuario = " + getNum_profesor());
        int rs=lb.executeUpdate("UPDATE evaluador_evalua_profesor SET puntaje_final = " + puntaje + ", fecha_ev = NOW() WHERE id_usuario_prof = "
                + getNum_profesor());
        lb.closeConnection();
        if (rs > 0)
            return "success";
        else
            return "fail";
      //return ret;
    }

    public int get_puntajefinal() throws SQLException{
        int aux = 0, suma_total = 0, periodo = 0;
        ResultSet rperiodo = lb.executeQuery("SELECT * FROM evaluador");
        while(rperiodo.next()){
            periodo = rperiodo.getInt("periodo_actual");
        }
        ResultSet r1, r2, r3, r4, r5, r11, r12;
        r1 = lb.executeQuery("SELECT * FROM profesor_tiene_proyecto WHERE id_usuario = '" + getNum_profesor() + "' AND "
                + "periodo = " + periodo);
        while(r1.next()){
            aux = r1.getInt("puntaje_alumno");
            suma_total += aux;
        }
        r2 = lb.executeQuery("SELECT * FROM profesor_tiene_pub WHERE id_usuario = '" + getNum_profesor() + "' AND "
                + "periodo = " + periodo);
        while(r2.next()){
            aux = r2.getInt("puntaje");
            suma_total += aux;
        }
        r3 = lb.executeQuery("SELECT * FROM profesor_participa_ev WHERE id_usuario = '" + getNum_profesor() + "' AND "
                + "periodo = " + periodo);
        while(r3.next()){
            aux = r3.getInt("puntaje");
            suma_total += aux;
        }
        r4 = lb.executeQuery("SELECT * FROM profesor_tiene_proyecto WHERE id_usuario = '" + getNum_profesor() + "' AND "
                + "periodo = " + periodo);
        while(r4.next()){
            aux = r4.getInt("puntaje");
            suma_total += aux;
        }
        r5 = lb.executeQuery("SELECT * FROM profesor_tiene_obra WHERE id_usuario = '" + getNum_profesor() + "' AND "
                + "periodo = " + periodo);
        while(r5.next()){
            aux = r5.getInt("puntaje");
            suma_total += aux;
        }
        r11 = lb.executeQuery("SELECT * FROM profesor_tiene_tt WHERE id_usuario = '" + getNum_profesor() + "' AND "
                + "periodo = " + periodo);
        while(r11.next()){
            aux = r11.getInt("puntaje");
            suma_total += aux;
        }
        r12 = lb.executeQuery("SELECT * FROM profesor_participa_en_plan WHERE id_usuario = '" + getNum_profesor() + "' AND "
                + "periodo = " + periodo);
        while(r12.next()){
            aux = r12.getInt("puntaje");
            suma_total += aux;
        }
        return suma_total;
    }
    public String getNum_profesor() {
        return num_profesor;
    }

    public void setNum_profesor(String num_profesor) {
        this.num_profesor = num_profesor;
    }
    
}
