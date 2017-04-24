/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package profesor;//aqui haremos el insert

/**
 *
 * @author PsysacElrick
 */
import sesion.*;
import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.*;

public class LoginBean 
{
    Connection connection = null;
    private Statement  stmtquery;
    private   Statement  stmtupdate;
    private ResultSet   rs;
    public LoginBean()
    {
            
    }
    public boolean validateUser(String userName, String password) throws IOException, SQLException, PropertyVetoException
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DataSource.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select password from usuario where id_usuario='"+userName+"';");//cambiar nom_prof por id_prof
            while(resultSet.next())
            {
                System.out.println(resultSet.getString("password"));
                if(resultSet.getString("password").equals(password))
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (PropertyVetoException e)
        {
            e.printStackTrace();
        }finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return false;
    }
    
    public boolean valida_obra(String username, String id_obra) throws IOException, SQLException, PropertyVetoException
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DataSource.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select id_usuario,id_obra from profesor_tiene_obra where id_usuario='"
                    +username+"' and id_obra='"+id_obra+"' and validado=0;");//cambiar nom_prof por id_prof
            
            while(resultSet.next())
            {
                System.out.println(resultSet.getString("id_usuario"));
                if(resultSet.getString("id_usuario").equals(username)&& resultSet.getString("id_obra").equals(id_obra))
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (PropertyVetoException e)
        {
            e.printStackTrace();
        }finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return false;
    }
    
        public boolean valida_proyecto(String username, String id_proyecto) throws IOException, SQLException, PropertyVetoException
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DataSource.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select id_usuario,id_proyecto from profesor_tiene_proyecto where id_usuario='"
                    +username+"' and id_proyecto='"+id_proyecto+"' and validado = 0;");//cambiar nom_prof por id_prof
            
            while(resultSet.next())
            {
                System.out.println(resultSet.getString("id_usuario"));
                System.out.println(resultSet.getString("id_proyecto"));
                if(resultSet.getString("id_usuario").equals(username)&& resultSet.getString("id_proyecto").equals(id_proyecto))
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (PropertyVetoException e)
        {
            e.printStackTrace();
        }finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return false;
    }
    
    
        public boolean valida_TT(String username, String id_TT, int id_alumno) throws IOException, SQLException, PropertyVetoException
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DataSource.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select id_usuario,id_TT,id_alumno from profesor_tiene_tt where id_usuario='"
                    +username+"' and id_TT='"+id_TT+"' and id_alumno='"+id_alumno+"' and validado = 0");//cambiar nom_prof por id_prof
            
            while(resultSet.next())
            {
                System.out.println(resultSet.getString("id_usuario"));
                if(resultSet.getString("id_usuario").equals(username) && resultSet.getString("id_TT").equals(id_TT) && resultSet.getInt("id_alumno") ==id_alumno)
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (PropertyVetoException e)
        {
            e.printStackTrace();
        }finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return false;
    }    
        
    
        public boolean valida_alumno(int id_alumno, String nom_alumno) throws IOException, SQLException, PropertyVetoException
    {
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DataSource.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select id_alumno from proyecto where id_alumno='"
                    +id_alumno+"' and nom_alumno='"+nom_alumno+"' ;");//cambiar nom_prof por id_prof
            
            while(resultSet.next())
            {
                System.out.println(resultSet.getString("id_alumno"));
                if(resultSet.getString("id_alumno").equals(id_alumno))
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        catch (PropertyVetoException e)
        {
            e.printStackTrace();
        }finally {
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) {e.printStackTrace();}
            if (statement != null) try { statement.close(); } catch (SQLException e) {e.printStackTrace();}
            if (connection != null) try { connection.close(); } catch (SQLException e) {e.printStackTrace();}
        }
        return false;
    }    
        
    public void getConnection()throws IOException, SQLException, PropertyVetoException
    {
        try{
            connection = DataSource.getInstance().getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public ResultSet executeQuery(String sql) throws java.sql.SQLException
    {
        if(connection==null)
        throw new SQLException("No ha configurado correctamente la conexion Source:Bean handledb");

    stmtquery = null;
    rs=null;

    try
    {
     stmtquery=connection.createStatement();
     rs=stmtquery.executeQuery(sql);
    }
    finally
    {
    }
    return rs;
    }
    public int executeUpdate(String sql) throws java.sql.SQLException
    {
        if(connection==null)
        throw new SQLException("No ha configurado correctamente la conexion Source:Bean handledb");
            stmtupdate = null;
        int affecrows=0;
        try
        {
         stmtupdate=connection.createStatement();
         affecrows=stmtupdate.executeUpdate(sql);
        }
        finally
        {
                if(stmtupdate != null) stmtupdate.close();
        }
    return affecrows;
    }
    public void closeConnection() throws java.sql.SQLException
    {
        if(connection!=null) connection.close();
        if(stmtupdate!=null)stmtupdate.close();
        if(stmtquery!=null)stmtquery.close();
        stmtupdate=stmtquery= null;
        rs=null;
    }
}
