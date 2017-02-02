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

public class Modifica_SIP extends ActionSupport {
    private String id;
    private String usuario;
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
    
    
    public Modifica_SIP() {
    }
    @Override
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int val=lb.executeUpdate("UPDATE usuarios SET nom_prof='"+getUsuario()+"',id_prof='"+getMatricula()+"', password='"+getPassword()+"' WHERE nom_prof='"+getId()+"'");
        if(val>0) return "modificar_exitoso";
        else return "modificar_fallo";
    }
    
}
