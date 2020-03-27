package databaseconnection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Database {
    private final String url = "jdbc:postgresql://localhost/register";
    private final String user = "postgres";
    private final String password = "amrwsk13";

    private Connection connection = null;
    private PreparedStatement preparedStatment = null;
    private ResultSet result = null;
    private String sqlCommand;
    
    
    private User userDa= new User();
    
    
    private void connect ()
    {
        try
        {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url,user,password);
            System.out.println("Connection is made successfully");
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    public User getUser (String uname)
    {
        try
        {
            connect();
            sqlCommand = "SELECT * FROM register WHERE uname LIKE ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, "%"+uname+"%");
            
            result = preparedStatment.executeQuery();
            
            userDa.getUsers().clear();
            
            while(result.next())
            {
                userDa.setUsers(new User(result.getString(2),result.getString(3),result.getString(4),result.getString(5)));
            }
            
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            stop();
            return userDa;
        }
        
    }
    
    private void stop()
    {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
