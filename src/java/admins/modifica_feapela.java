/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admins;

/**
 *
 * @author PsysacElrick
 */
import com.opensymphony.xwork2.ActionSupport;

public class modifica_feapela extends ActionSupport {
    private int id_fecha;
    private String date1, date2;

    public int getId_fecha() {
        return id_fecha;
    }

    public void setId_fecha(int id_fecha) {
        this.id_fecha = id_fecha;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public String getDate2() {
        return date2;
    }

    public void setDate2(String date2) {
        this.date2 = date2;
    }
    
    
    public modifica_feapela() {
    }
    @Override 
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("UPDATE fecha_apelaciones SET fecha_inicio=str_to_date('"+getDate1()+"', '%d-%m-%Y'),fecha_fin=str_to_date('"+getDate2()+"', '%d-%m-%Y') WHERE id_fecha="+getId_fecha());
        if(val>0) return "success";
        else return "fail";
    }
    
}