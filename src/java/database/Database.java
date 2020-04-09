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

    public boolean addAdminOrClient(Users user) {
        try {
            connect();
            sqlCommand = "SELECT createadminOrClient (?,?,?,?,?,?,?,?,?,?,?)";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getuName());
            preparedStatment.setString(2, user.getfName());
            preparedStatment.setString(3, user.getlName());
            preparedStatment.setString(4, user.getbDate());
            preparedStatment.setString(5, user.getPassword());
            preparedStatment.setString(6, user.getJob());
            preparedStatment.setString(7, user.getEmail());
            preparedStatment.setFloat(8, user.getCreditLimit());
            preparedStatment.setFloat(9, user.getBalance());
            preparedStatment.setString(10, user.getAddress());
            preparedStatment.setString(11, user.getInterests());

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

    public Users getAllClientUsers() {
        Users user = new Users();
        try {
            connect();
            sqlCommand = "SELECT * FROM users WHERE isadmin = false";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                user.getUsers().add(new Users(result.getInt(1), result.getString(2), result.getString(3),
                        result.getString(4), result.getString(5), result.getString(6),
                        result.getString(7), result.getString(8), result.getFloat(9),
                        result.getFloat(10), result.getString(11), result.getString(12), result.getBoolean(13)));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
            return user;
        }
    }

    public String getUserID(Users user) {
        try {
            connect();
            sqlCommand = "SELECT uid FROM users WHERE ? in (uname, email)";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, user.getUNameOrEmail());
            result = preparedStatment.executeQuery();
            while (result.next()) {
                user.setuId(result.getInt(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
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
            stop();
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
            stop();
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
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
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
            stop();
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
        } finally {
            stop();
        }
    }

    public Category getCategoryByName(Category category) {
        try {
            connect();
            sqlCommand = "SELECT categoryid FROM category WHERE categoryname = ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setString(1, category.getCategoryName());
            result = preparedStatment.executeQuery();
            while (result.next()) {
                category.setCategoryid(result.getInt(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
            return category;
        }
    }

    public Category getCategoryByID(Category category) {
        try {
            connect();
            sqlCommand = "SELECT categoryname FROM category WHERE categoryid = ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setInt(1, category.getCategoryid());
            result = preparedStatment.executeQuery();
            while (result.next()) {
                category.setCategoryname(result.getString(1));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
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
        } finally {
            stop();
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
            stop();
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
            stop();
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
            stop();
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
        } finally {
            stop();
        }
    }

    public Product getProductById(Product product) {
        try {
            connect();
            sqlCommand = "SELECT * FROM products WHERE productkey = ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setInt(1, product.getProductKey());
            result = preparedStatment.executeQuery();

            while (result.next()) {
                product.setProductName(result.getString(3));
                product.setPrice(result.getFloat(4));
                product.setQuantity(result.getInt(5));
                product.setDesc(result.getString(6));
                product.setImg(result.getString(7));
                product.setIsAvail(result.getBoolean(8));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            stop();
            return product;
        }
    }

    public void addUserCart(String uId) {
        try {
            connect();
            sqlCommand = "insert into usercart (user_id, issubmitted, submitteddate) values(" + uId + ",False,'now')";
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            stop();
        }
    }

    public UserCart getUserCart(String uId) {
        UserCart userCart = null;
        try {
            connect();
            sqlCommand = "SELECT * FROM usercart WHERE user_id =" + uId;
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                userCart = new UserCart(result.getInt(1),
                        result.getInt(2),
                        result.getBoolean(3),
                        result.getDate(4));
            }
            return userCart;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            stop();

        }
    }

    public Product getAllProductsInCart (Product product)
    {
        Product allProducts = new Product();
        try
        {
            connect();
            for (int i = 0; i < product.getAllProducts().size(); i++)
            {
                sqlCommand = "SELECT * FROM products WHERE productkey = ?";
                preparedStatment = connection.prepareStatement(sqlCommand);
                preparedStatment.setInt(1, product.getAllProducts().elementAt(i).getProductKey());
                result = preparedStatment.executeQuery();
                while (result.next())
                {
                    allProducts.getAllProducts().add(new Product(result.getInt(1), result.getInt(2), result.getString(3),
                            result.getFloat(4), result.getInt(5), result.getString(6), 
                            result.getString(7), result.getBoolean(8)));
                }                
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        finally
        {
            stop();
            return allProducts;
        }
    }

    public void updateCart(String pId, String cId, String qty) {
        try {
            connect();
            sqlCommand = "select * from cartsaved where product_id=" + pId + "and cart_id=" + cId;
            preparedStatment = connection.prepareStatement(sqlCommand);
            Statement stmt = connection.createStatement();
            result = preparedStatment.executeQuery();
            if (result.next()) {
                stmt.executeUpdate("update cartsaved set quantity=quantity+1 where cart_id=" + cId + " and product_id=" + pId);
            } else {
                stmt.executeUpdate("Insert into cartsaved(cart_id, product_id, quantity) values(" + cId + "," + pId + "," + qty + ")");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            stop();
        }

    }
        public Vector<Product> retrieveCartProducts(String cId) {
        try {
            connect();
            Vector<Product> products = new Vector();
            sqlCommand = "select * from cartsaved where cart_id = " + cId;
            preparedStatment = connection.prepareStatement(sqlCommand);
            Statement stmt = connection.createStatement();
            result = preparedStatment.executeQuery();
            while (result.next()) {
                ResultSet rs = stmt.executeQuery("select * from products where productkey =" + result.getInt(2));
                while (rs.next()) {
                    products.add(new Product(rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getFloat(4),
                            rs.getInt(5),
                            rs.getString(6),
                            rs.getString(7),
                            rs.getBoolean(8)));
                }

            }
            return products;

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            stop();
        }
    }

    public CartSaved retrieveCartSaved(String pId) {
        CartSaved cartSaved = null;
        try {
            connect();
            sqlCommand = "select * from cartsaved where product_id = " + pId;
            preparedStatment = connection.prepareStatement(sqlCommand);
            result = preparedStatment.executeQuery();
            while (result.next()) {
                    cartSaved = new CartSaved(result.getInt(1),
                            result.getInt(2),
                            result.getInt(3),
                            result.getFloat(4));
                }
  
            return cartSaved ;

        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            stop();
        }
    }
    
    public Users getUserInfo(Users user) 
    {
        try {
            connect();
            sqlCommand = "SELECT * FROM users WHERE uid = ?";
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.setInt(1, user.getuId());
            result = preparedStatment.executeQuery();

            while (result.next()) 
            {
                user.setuName(result.getString(2));
                user.setfName(result.getString(3));
                user.setlName(result.getString(4));
                user.setbDate(result.getString(5));
                user.setPassword(result.getString(6));
                user.setJob(result.getString(7));
                user.setEmail(result.getString(8));
                user.setCreditLimit(result.getInt(9));
                user.setBalance(result.getInt(10));
                user.setAddress(result.getString(11));
                user.setInterests(result.getString(12));
            }
        }
        catch (SQLException ex) 
        {
            ex.printStackTrace();
        } finally 
        {
            stop();
            return user;
        }
    }
    public void deleteFromCart(String pId) {
        try {
            connect();
            sqlCommand = "delete from cartsaved where product_id = "+ pId;
            preparedStatment = connection.prepareStatement(sqlCommand);
            preparedStatment.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(Database.class.getName()).log(Level.SEVERE, null, ex);
            
        } finally {
            stop();
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

//    public static void main(String[] args) {
//        Database dB = new Database();
//        UserCart userCart = dB.getUserCart("13");
//        String cartId = userCart.getCartId() + "";
//        Vector<CartSaved> cart = dB.retrieveCartSaved(cartId);
//        System.out.println(cart.elementAt(0).getQuantity());
//    }

}
