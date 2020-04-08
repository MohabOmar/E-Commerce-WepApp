package AddServlets;

import Database_Tables.Product;
import com.google.gson.Gson;
import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class OfflineCart extends HttpServlet 
{
    HttpSession session;
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        session = req.getSession(false);
        
        if (session.getAttribute(getCartID(req)) != null)
        {
            addProductToVirtualCart(req);
            showCartInternally();
        }
        else
        {
            System.out.println("No Cart Yet");
            makeNewCartWithProduct(req);
            showCartInternally();
        }
        resp.sendRedirect("/MAM/main.jsp");
    }    
    
    
    private String getCartID (HttpServletRequest req)
    {
        String cartID = null;
        for (int i =0; i < req.getCookies().length; i++)
        {
            if (req.getCookies()[i].getName().equals("cartID"))
            {
                cartID = req.getCookies()[i].getValue();
            }
        }
        return cartID;
    }
    
    private void makeNewCartWithProduct (HttpServletRequest req)
    {
        String productID = req.getParameter("pkey");
        String quantity = req.getParameter("quantity");
        //////////////////////////////////////////////////////////////////////////////////////////////////
        Product p = new Product();
        p.getAllProducts().add(new Product(Integer.parseInt(productID), Integer.parseInt(quantity)));
        Gson g = new Gson();
        //////////////////////////////////////////////////////////////////////////////////////////////////
        session.setAttribute(getCartID(req), g.toJson(p));
    }
    
    private void addProductToVirtualCart (HttpServletRequest req)
    {
        String productID = req.getParameter("pkey");
        String quantity = req.getParameter("quantity");        
        String cartID = getCartID(req);
        int prodcutofID = Integer.parseInt(productID);
        int quantityOfProduct = Integer.parseInt(quantity);
        boolean newProduct = false;
        int index = 0;
        
        Gson g = new Gson();
        Product p = g.fromJson(session.getAttribute(cartID).toString(), Product.class);
        
        for (int i = 0; i < p.getAllProducts().size(); i++)
        {
            if (p.getAllProducts().elementAt(i).getProductKey() == prodcutofID)
            {
                newProduct = true;
                index = i;
            }
        }
        
        if (newProduct)
        {
            p.getAllProducts().elementAt(index).setQuantity(p.getAllProducts().elementAt(index).getQuantity()+quantityOfProduct);
        }
        else
        {
            p.getAllProducts().add(new Product(prodcutofID, quantityOfProduct));
        }
        session.setAttribute(cartID, g.toJson(p));
    }
    
    private void showCartInternally ()
    {
        for (int i = 0; i < session.getValueNames().length;i++)
        {
            System.out.println("Cart Number: "+session.getValueNames()[i]+
                    " and "+"Product Object Number"+session.getAttribute(session.getValueNames()[i]));
        }
    }
}
