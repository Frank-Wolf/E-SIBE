/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admins;

/**
 *
 * @author le_as
 */

import com.opensymphony.xwork2.ActionSupport;

public class modifica_cofaa extends ActionSupport {
    private String id;
    private String usuario;
    private String u_a;
    private String matricula;
    private String password;

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getU_a() {
        return u_a;
    }

    public void setU_a(String u_a) {
        this.u_a = u_a;
    }
    
    
    
    public modifica_cofaa() {
    }
    @Override 
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("UPDATE usuario SET nom_usuario='"+getUsuario()
                +"',id_usuario='"+getMatricula()+"', password='"+getPassword()
                +"',u_a='"+getU_a()+"' WHERE id_usuario='"+getId()+"'");
        if(val>0) return "modificar_exitoso";
        else return "modificar_fallo";
    }
    
}

