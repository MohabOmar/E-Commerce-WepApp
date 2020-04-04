package database;

import Database_Tables.*;
import java.sql.*;
import java.util.Vector;
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
    
    public Users getAllClientUsers ()
    {
        Users user = new Users();
        try
        {
            connect();
            sqlCommand = "SELECT * FROM users WHERE isadmin = false";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next())
            {
                user.getUsers().add(new Users(result.getInt(1), result.getString(2), result.getString(3),
                        result.getString(4),result.getString(5), result.getString(6),
                        result.getString(7),result.getString(8), result.getFloat(9),
                        result.getFloat(10), result.getString(11),result.getString(12), result.getBoolean(13)));
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            return user;
        }        
    }

    public String getUserID (Users user)
    {
        try
        {
            connect();
            sqlCommand = "SELECT uid FROM users WHERE ? in (uname, email)";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getUNameOrEmail());
            result = preparedStatment.executeQuery();
            while (result.next())
            {
                user.setuId(result.getInt(1));
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            return String.valueOf(user.getuId());
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
        int number = 0;
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
        int number = 0;
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
        int number = 0;
        try {
            connect();
            sqlCommand = "SELECT COUNT(*) FROM usercart WHERE issubmitted = true";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                number = result.getInt(1);
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        } finally

        {
            return number;
        }
    }

    public int numberOfProducts() {
        int number = 0;
        try {
            connect();
            sqlCommand = "SELECT COUNT(*) FROM products";
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

    public Category getCategoryByName (Category category)
    {
        try
        {
            connect();
            sqlCommand = "SELECT categoryid FROM category WHERE categoryname = ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, category.getCategoryName());
            result = preparedStatment.executeQuery();
            while (result.next())
            {
                category.setCategoryid(result.getInt(1));
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            return category;
        }
    }

    public Category getCategoryByID (Category category)
    {
        try
        {
            connect();
            sqlCommand = "SELECT categoryname FROM category WHERE categoryid = ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setInt(1, category.getCategoryid());
            result = preparedStatment.executeQuery();
            while (result.next())
            {
                category.setCategoryname(result.getString(1));
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            return category;
        }
    }    
    
    public Vector<Product> search(String keyword) {
        try {
            connect();
            Vector<Product> products = new Vector();
            sqlCommand = "select * from products where productname LIKE'%" + keyword + "%'";
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

    public Category showAllCategories() {
        Category c = new Category();
        try {
            connect();
            sqlCommand = "SELECT * FROM category";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();

            while (result.next()) {
                c.getAllCategories().add(new Category(result.getInt(1), result.getString(2)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            return c;
        }
    }

    public boolean addCategory(String category) {
        try {
            connect();
            sqlCommand = "SELECT addCategory (?)";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, category);
            result = preparedStatment.executeQuery();

            while (result.next()) {
                operation = result.getBoolean(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            return operation;
        }
    }

    public boolean removeCategory(String category) {
        try {
            connect();
            sqlCommand = "SELECT removeCategory (?)";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, category);
            result = preparedStatment.executeQuery();

            while (result.next()) {
                operation = result.getBoolean(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            return operation;
        }
    }


    public Product retrieveSpecificProducts(String pId) {
        Product product = null;
        try {
            connect();
            sqlCommand = "select * from products where productkey=" + pId + "";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                product = new Product(result.getInt(1),
                        result.getInt(2),
                        result.getString(3),
                        result.getFloat(4),
                        result.getInt(5),
                        result.getString(6),
                        result.getString(7),
                        result.getBoolean(8));
            }
            return product;

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public Product getProductById (Product product)
    {
        try
        {
            connect();
            sqlCommand = "SELECT * FROM products WHERE productkey = ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setInt(1, product.getProductKey());
            result = preparedStatment.executeQuery();

            while (result.next())
            {
                product.setProductName(result.getString(3));
                product.setPrice(result.getFloat(4));
                product.setQuantity(result.getInt(5));
                product.setDesc(result.getString(6));
                product.setImg(result.getString(7));
                product.setIsAvail(result.getBoolean(8));
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            return product;
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
