package AddServlets;

import Database_Tables.Product;
import com.google.gson.Gson;
import database.Database;
import java.io.IOException;
import java.util.StringTokenizer;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class OfflineCart extends HttpServlet 
{
    HttpSession session;
    String[] allProducts;
    int userId;
    Cookie[] cookies;
    String url;
    String productID;
    String quantity;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        Product product = new Product();
        Database db = new Database();
        cookies = req.getCookies();
        session = req.getSession();
        url = req.getParameter("URL");
        if (cookies != null)
        {
            productID = req.getParameter("pkey");
            quantity = req.getParameter("quantity");
            allProducts = session.getValueNames();
            
            for (int i =0; i < allProducts.length; i++)
            {
                if (allProducts[i].equals("product-"+productID))
                {
                    int q = Integer.parseInt(session.getAttribute(allProducts[i]).toString()) + 1;
                    session.setAttribute(allProducts[i], String.valueOf(q));
                }
                else
                {
                    session.setAttribute("product-"+productID, quantity);
                }
                product.getAllProducts().add(new Product(Integer.parseInt(allProducts[i].replace("product-", ""))));
            }
            
            
            Product p = db.getAllProductsInCart(product);
                 
            
            for (int i =0; i < p.getAllProducts().size(); i++)
            {
                int q =  Integer.parseInt(session.getAttribute("product-"+p.getAllProducts().elementAt(i).getProductKey()).toString());
                p.getAllProducts().elementAt(i).setQuantity(q);
            }            
            
            Gson g = new Gson();
            
            req.setAttribute("caty", g.toJson(p));
            
            resp.sendRedirect(url);
        }
        else
        {
            ////////////////////////////////////////////
        }
    }
    
}
