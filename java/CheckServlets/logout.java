package CheckServlets;

import Database_Tables.Product;
import com.google.gson.Gson;
import database.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User1
 */
public class logout extends HttpServlet 
{
boolean isAdmin = false;
    boolean isLogin = false;
    boolean authorization = false;    
    
    private boolean checkCookie(Cookie[] cookies,HttpServletRequest req)
    {
        if (cookies != null)
        {
            for (int i = 0; i < cookies.length; i++)
            {
                if (cookies[i].getName().equals("isAdmin"))
                {
                    if (cookies[i].getValue().equals("true") || cookies[i].getValue().equals("null"))
                    {
                       isAdmin = true; 
                    }
                    else if (cookies[i].getValue().equals("false"))
                    {
                        removeElementFromCart(req);
                        isAdmin = true; 
                    }
                }
                else if (cookies[i].getName().equals("login"))
                {
                    if (cookies[i].getValue().equals("true") || cookies[i].getValue().equals("false") || cookies[i].getValue().equals("null"))
                    {
                       isLogin = true; 
                    }
                }
            }
            if (isAdmin == true && isLogin == true)
            {
                authorization = true;
            }
        }
        System.out.println(authorization);
        return authorization;
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        Cookie registrationCookie;
        Cookie isAdmin;
        Cookie uID;
        if (checkCookie(req.getCookies(),req))
        {
            isAdmin = new Cookie("isAdmin", "false");
            registrationCookie = new Cookie("login", "false");
            uID = new Cookie("userID", "0");
            resp.addCookie(registrationCookie);
            resp.addCookie(isAdmin);  
            resp.addCookie(uID);  
            resp.sendRedirect("/MAM/main.jsp");       
        }
    }
    
    private void removeElementFromCart (HttpServletRequest req)
    {
        String cartID = null;        
        Cookie[] cookies = req.getCookies();
        Gson m = new Gson();        
        Database db = new Database();
        
        for (int i =0; i < cookies.length; i++)
        {
            if (cookies[i].getName().equals("cartID"))
            {
                cartID = req.getCookies()[i].getValue();
            }
        }        
        
        if (req.getSession().getAttribute(cartID) != null)
        {    
            req.getSession().setAttribute(cartID, m.toJson(new Product()));            
        }
    }
    
}
