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
public class Borrar_feacti {
    private int id_fecha;

    public int getId_fecha() {
        return id_fecha;
    }

    public void setId_fecha(int id_fecha) {
        this.id_fecha = id_fecha;
    }

    
    public Borrar_feacti() {
    }
    //@Override
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("DELETE FROM fecha_actividades WHERE id_fecha='"+getId_fecha()+"'");
        lb.closeConnection();
        if (val>0) return "success";
        else return "fail"; 
    }
}
