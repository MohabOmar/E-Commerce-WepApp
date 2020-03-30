package database;

import Database_Tables.Users;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Database {
    private final String url = "jdbc:postgresql://localhost:5432/oshop";
    private final String user = "postgres";
    private final String password = "amrwsk13";

    private Connection connection = null;
    private PreparedStatement preparedStatment = null;
    private ResultSet result = null;
    private String sqlCommand;
        
    boolean operation = false;
    
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
    
    public boolean addAdmin (Users user)
    {
        try
        {
            connect();
            sqlCommand = "SELECT createadmin (?,?,?,?,?,?,?,?,?)";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getuName());
            preparedStatment.setString(2, user.getfName());
            preparedStatment.setString(3, user.getlName());
            preparedStatment.setString(4, user.getbDate());
            preparedStatment.setString(5, user.getPassword());
            preparedStatment.setString(6, user.getJob());
            preparedStatment.setString(7, user.getEmail());
            preparedStatment.setString(8, user.getAddress());
            preparedStatment.setString(9, user.getInterests());
            
            result = preparedStatment.executeQuery();
            
            while (result.next())
            {
                operation = result.getBoolean(1);
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            stop();
            return operation;
        }
    }
    
    
    public boolean addClient (Users user)
    {
        try
        {
            connect();
            sqlCommand = "SELECT createclient (?,?,?,?,?,?,?,?,?)";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getuName());
            preparedStatment.setString(2, user.getfName());
            preparedStatment.setString(3, user.getlName());
            preparedStatment.setString(4, user.getbDate());
            preparedStatment.setString(5, user.getPassword());
            preparedStatment.setString(6, user.getJob());
            preparedStatment.setString(7, user.getEmail());
            preparedStatment.setString(8, user.getAddress());
            preparedStatment.setString(9, user.getInterests());
            
            result = preparedStatment.executeQuery();
            
            while (result.next())
            {
                operation = result.getBoolean(1);
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            stop();
            return operation;
        }
    }
    
    public boolean checkLogin (Users user)
    {
        try
        {
            connect();
            sqlCommand = "SELECT checklogin (?,?)";
            
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getUNameOrEmail());
            preparedStatment.setString(2, user.getPassword());
            result = preparedStatment.executeQuery();
            
            while (result.next())
            {
                operation = result.getBoolean(1);
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            stop();
            return operation;
        }
    }
    
    public boolean checkIsAdmin (Users user)
    {
        try
        {
            connect();
            sqlCommand = "SELECT checkisadmin (?)";
            
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getUNameOrEmail());
            result = preparedStatment.executeQuery();
            
            while (result.next())
            {
                operation = result.getBoolean(1);
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            stop();
            return operation;
        }
    }        
    
    private void stop()
    {
        try 
        {
            connection.close();
            System.out.println("Database is stopped");
        } 
        catch (SQLException ex) 
        {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
