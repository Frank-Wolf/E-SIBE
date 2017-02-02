/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sesion;

/**
 *
 * @author le_as
 */
import java.beans.PropertyVetoException;
import java.io.IOException;
import java.sql.*;

public class SesionBean {
    private String user;
    public SesionBean()
    {
            
    }
    public String getUser(String userName, String password)throws IOException, SQLException, PropertyVetoException{
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            connection = DataSource.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery("select idTypeUsuario from usuarios where id_prof='"+userName+"';");//cambiar nom_prof y userName
            while(resultSet.next())
            {
                System.out.println(resultSet.getString("idTypeUsuario"));
                return user=resultSet.getString("idTypeUsuario");
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
        return user;
    }
}

