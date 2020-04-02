package database;

import Database_Tables.*;
import java.sql.*;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Database {

    private final String url = "jdbc:postgresql://localhost:5432/oshop";
    private final String user = "postgres";
    private final String password = "postgres";

    private Connection connection = null;
    private PreparedStatement preparedStatment = null;
    private ResultSet result = null;
    private String sqlCommand;

    boolean operation = false;

    private void connect() {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(url, user, password);
            System.out.println("Connection is made successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public boolean addAdmin(Users user) {
        try {
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

            while (result.next()) {
                operation = result.getBoolean(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
            return operation;
        }
    }

    public boolean addClient(Users user) {
        try {
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

            while (result.next()) {
                operation = result.getBoolean(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
            return operation;
        }
    }

    public boolean checkLogin(Users user) {
        try {
            connect();
            sqlCommand = "SELECT checklogin (?,?)";

            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getUNameOrEmail());
            preparedStatment.setString(2, user.getPassword());
            result = preparedStatment.executeQuery();

            while (result.next()) {
                operation = result.getBoolean(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
            return operation;
        }
    }

    public boolean checkIsAdmin(Users user) {
        try {
            connect();
            sqlCommand = "SELECT checkisadmin (?)";

            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getUNameOrEmail());
            result = preparedStatment.executeQuery();

            while (result.next()) {
                operation = result.getBoolean(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
            return operation;
        }
    }

    public int numberOfCategories() {
        int number = 17;
        try {
            connect();
            sqlCommand = "SELECT COUNT(*) FROM category";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                number = result.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            return number;
        }
    }

    public int numberOfUsers() {
        int number = 17;
        try {
            connect();
            sqlCommand = "SELECT COUNT(*) FROM users";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                number = result.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            return number;
        }
    }

    public int numberOfSuccessCart() {
        int number = 17;
        try {
            connect();
            sqlCommand = "SELECT COUNT(*) FROM usercart WHERE issubmitted = true";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                number = result.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            return number;
        }
    }

    public Vector<Product> retrieveAllProducts() {
        try {
            connect();
            Vector<Product> products = new Vector();
            sqlCommand = "select * from products";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                products.add(new Product(result.getInt(1),
                        result.getInt(2),
                        result.getString(3),
                        result.getFloat(4),
                        result.getInt(5),
                        result.getString(6),
                        result.getString(7),
                        result.getBoolean(8)));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    
        public Vector<Product> search(String keyword){
        try {
            connect();
            Vector<Product> products = new Vector();
            sqlCommand = "select * from products where productname LIKE'" + keyword  +"%'";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                products.add(new Product(result.getInt(1),
                        result.getInt(2),
                        result.getString(3),
                        result.getFloat(4),
                        result.getInt(5),
                        result.getString(6),
                        result.getString(7),
                        result.getBoolean(8)));
            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    } 


    private void stop() {
        try {
            connection.close();
            System.out.println("Database is stopped");
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
