package AddServlets;

import Database_Tables.Product;
import database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DeleteProduct extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        int pid = Integer.parseInt(req.getParameter("pid"));
        Database db = new Database();
        if (db.deleteProduct(new Product(pid)))
        {
            resp.sendRedirect("/MAM/admin/showProducts.jsp");
        }
        else
        {
            resp.sendError(404);
        }
    }
    
}
