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
import java.sql.Connection;
import java.sql.SQLException;
import org.apache.commons.dbcp.BasicDataSource;

public class DataSource { //accesible a traves de paquete
    private static DataSource datasource; //static significa que es una variable a nivel de clase
    private BasicDataSource ds;
    private DataSource() throws IOException, SQLException, PropertyVetoException {
        ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        //ds.setUsername("root");/*original*/
        //ds.setPassword("root");
        //ds.setUrl("jdbc:mysql://localhost:3306/esibe");
        ds.setUsername("bfe1cf218d8990");
        ds.setPassword("7056c8ee");
        ds.setUrl("jdbc:mysql://us-cdbr-azure-southcentral-f.cloudapp.net:3306/esibe_2017");
     // settings
        ds.setMinIdle(5);
        ds.setMaxIdle(20);
        ds.setMaxOpenPreparedStatements(180);

    }

    public static DataSource getInstance() throws IOException, SQLException, PropertyVetoException {
        if (datasource == null) {
            datasource = new DataSource();
            return datasource;
        } else {
            return datasource;
        }
    }

    public Connection getConnection() throws SQLException {
        return this.ds.getConnection();
    }

}
