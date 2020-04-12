package CheckServlets;

import Database_Tables.Product;
import Database_Tables.UserCart;
import database.Database;
import Database_Tables.Users;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class loginCheck extends HttpServlet 
{
    Database db = new Database();
    Users user = new Users();
    Cookie registrationCookie = null;
    Cookie isAdmin = null;
    Cookie uID = null;
    String redirectedUrl = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        if (req.getParameter("userNameOrEmail") != null && req.getParameter("password") != null)
        {          
            user.setUNameOrEmail(req.getParameter("userNameOrEmail"));
            user.setPassword(req.getParameter("password"));
            if (db.checkLogin(user))
            {
                if (db.checkIsAdmin(user))
                {
                    System.out.println("Admin");
                    isAdmin = new Cookie("isAdmin", "true");
                    redirectedUrl = "/MAM/admin/adminHome.jsp";
                }
                else
                {
                    checkForVirtualCart(req, user);
                    System.out.println("Client");
                    isAdmin = new Cookie("isAdmin", "false");
                    redirectedUrl = req.getParameter("URL");

                }
                registrationCookie = new Cookie("login", "true");
                uID = new Cookie("userID", db.getUserID(user));
                resp.addCookie(registrationCookie);
                resp.addCookie(isAdmin);
                resp.addCookie(uID);
                resp.sendRedirect(redirectedUrl);
            }
            else
            {
                isAdmin = new Cookie("isAdmin", "false");
                registrationCookie = new Cookie("login", "false");
                uID = new Cookie("userID", "0");
                resp.addCookie(registrationCookie);
                resp.addCookie(isAdmin);  
                resp.addCookie(uID);  
                resp.sendRedirect(req.getParameter("URL")+"?invalid=true");
            }
        }
        else
        {
            resp.sendError(404,"You Must First Go To Main PageThen Sign In Tape");
        }        
    }
    
    
    private void checkForVirtualCart(HttpServletRequest req, Users user)
    {
        String cartID = null;
        boolean haveACart = false;
        Cookie[] cookies = req.getCookies();
        Gson m = new Gson();
        String userId = null;
        Product virtualCart = null;
        if (cookies != null)
        {
            for (int i =0; i < cookies.length; i++)
            {
                if (cookies[i].getName().equals("cartID"))
                {
                    cartID = req.getCookies()[i].getValue();
                }
            }
            
            if (req.getSession().getAttribute(cartID) != null)
            {
                virtualCart = m.fromJson(req.getSession().getAttribute(cartID).toString(), Product.class);
                System.out.println(virtualCart.getAllProducts().elementAt(0).getCategoryId());
                userId = db.getUserID(user).toString();
                System.out.println("*********************************************************************************");
                System.out.println(userId);
                System.out.println(cartID);
                System.out.println(userId);
                System.out.println("*********************************************************************************");
                
                increaseQuantity(req, userId, db.getUserCart(userId).getCartId()+"", virtualCart);
            }   
            else
            {
            System.out.println("=================================================================================");
            System.out.println("Client has No Product");
            System.out.println("=================================================================================");
            }
        }
    }
    
    private void increaseQuantity(HttpServletRequest req,String userID,String cartID,Product virtualCart)
    {
        Gson m = new Gson();
        if (virtualCart.getAllProducts().size() > 0)
        {
            System.out.println("*********************************************************************************");
            System.out.println("Client has Product");
            System.out.println("*********************************************************************************");
            
            Vector<Product> productsInDB = db.retrieveCartProducts(cartID);
            
            System.out.println("*********************************************************************************");
            System.out.println(productsInDB.size());
            System.out.println("*********************************************************************************");
            
            if (productsInDB.size() > 0 && productsInDB.size() > virtualCart.getAllProducts().size())
            {
                for (int i = 0; i < productsInDB.size(); i++)
                {
                    for (int j = 0; j < virtualCart.getAllProducts().size(); j++)
                    {
                        if (productsInDB.elementAt(i).getProductKey() == virtualCart.getAllProducts().elementAt(j).getProductKey())
                        {
                            int totalQuantity = 0;
                            totalQuantity = db.getQuantityOfCertainCart(productsInDB.elementAt(i).getProductKey(), Integer.parseInt(cartID))
                                    + virtualCart.getAllProducts().elementAt(j).getQuantity();
                            db.increaseQuantityOnCart(Integer.parseInt(cartID),virtualCart.getAllProducts().elementAt(j).getProductKey() , totalQuantity);
                            virtualCart.getAllProducts().removeElementAt(j);
                        }
                    }
                }
                if (virtualCart.getAllProducts().size() > 0)
                {
                    for (int j = 0; j < virtualCart.getAllProducts().size(); j++)
                    {
                        db.updateCart(virtualCart.getAllProducts().elementAt(j).getProductKey()+"", cartID, virtualCart.getAllProducts().elementAt(j).getQuantity()+"");
                        virtualCart.getAllProducts().removeElementAt(j);
                    }
                }
            }
            else if (productsInDB.size() > 0 && productsInDB.size() < virtualCart.getAllProducts().size())
            {
                for (int j = 0; j < virtualCart.getAllProducts().size(); j++)
                {
                    for (int i = 0; i < productsInDB.size(); i++)
                    {
                        if (productsInDB.elementAt(i).getProductKey() == virtualCart.getAllProducts().elementAt(i).getProductKey())
                        {
                            int totalQuantity = 0;
                            totalQuantity = db.getQuantityOfCertainCart(productsInDB.elementAt(i).getProductKey(), Integer.parseInt(cartID))
                                    + virtualCart.getAllProducts().elementAt(i).getQuantity();
                            db.increaseQuantityOnCart(Integer.parseInt(cartID), virtualCart.getAllProducts().elementAt(j).getProductKey(), totalQuantity);
                            virtualCart.getAllProducts().removeElementAt(j);
                        }                        
                    }
                }
                if (virtualCart.getAllProducts().size() > 0)
                {
                    for (int j = 0; j < virtualCart.getAllProducts().size(); j++)
                    {
                        db.updateCart(virtualCart.getAllProducts().elementAt(j).getProductKey()+"",
                                cartID, virtualCart.getAllProducts().elementAt(j).getQuantity()+"");
                        virtualCart.getAllProducts().removeElementAt(j);
                    }
                }
            }
            else
            {
                for (int j = 0; j < virtualCart.getAllProducts().size(); j++)
                {
                    db.updateCart(virtualCart.getAllProducts().elementAt(j).getProductKey()+"",
                            cartID, virtualCart.getAllProducts().elementAt(j).getQuantity()+"");
                }                
            }
            req.getSession().setAttribute(cartID, m.toJson(new Product()));
        }
    }
}
