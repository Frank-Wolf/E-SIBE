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

public class modifica_cofaa2 extends ActionSupport {
    private String id;
    private String usuario;
    private String u_a;
    private String matricula;
    private String password;
    private String email;
    
    
    
    public modifica_cofaa2() {
    }
    @Override 
    public String execute() throws Exception {
        LoginBean lb = new LoginBean();
        lb.getConnection();
        int set = lb.executeUpdate("SET foreign_key_checks = 0");
        set = lb.executeUpdate("UPDATE evaluador SET id_usuario = '" + getMatricula() + "' WHERE id_usuario = " + getId());
        set = lb.executeUpdate("UPDATE evaluador_evalua_profesor SET id_usuario_ev = '" + getMatricula() + "'"
                + " WHERE id_usuario_ev = " + getId());
        set = lb.executeUpdate("SET foreign_key_checks = 1");
        int val=lb.executeUpdate("UPDATE usuario SET nom_usuario='"+getUsuario()
                +"',password='"+getPassword()
                +"',u_a='"+getU_a()+"', id_usuario = '" + getMatricula() + "', email = '" + getEmail() + "' WHERE id_usuario='"+getId()+"'");
        set = lb.executeUpdate("SET foreign_key_checks = 1");
        lb.closeConnection();
        if(val > 0){
            return "modificar_exitoso";
        } 
        else{
            return "modificar_fallo";     
            } 
    }
    
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
    
     public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}


