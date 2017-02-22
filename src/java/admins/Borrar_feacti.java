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
    private String nom_prof;

    public String getNom_prof() {
        return nom_prof;
    }

    public void setNom_prof(String nom_prof) {
        this.nom_prof = nom_prof;
    }
    
    public Borrar_feacti() {
    }
    //@Override
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("DELETE FROM fecha_actividades WHERE fecha_inicio='"+getNom_prof()+"'");
        lb.closeConnection();
        if (val>0) return "borrar_exitoso";
        else return "borrar_fallo"; 
    }
}
