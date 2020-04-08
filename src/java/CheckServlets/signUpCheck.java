package CheckServlets;

import Database_Tables.Users;
import database.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class signUpCheck extends HttpServlet 
{
    Users user;
    Database db = new Database();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        if (req.getParameter("isAdminForm").equals("true"))
        {   
            
            user = new Users(req.getParameter("aUName"),req.getParameter("aFName"), req.getParameter("aLName")
                    , req.getParameter("aBDName"), req.getParameter("aPassword"), req.getParameter("aJName")
                    , req.getParameter("aEAName"), Float.parseFloat(req.getParameter("creditLimit"))
                    , Float.parseFloat(req.getParameter("balance"))
                    , req.getParameter("aAName"), req.getParameter("aANTName")
                    , Boolean.getBoolean(req.getParameter("isAdmin")));
            if (db.addAdminOrClient(user))
            {
                resp.sendRedirect(req.getParameter("URL"));
            }
            else
            {
                resp.sendRedirect(req.getParameter("URL")+"?invalid=true");
            }
            
        }
        
        else if (req.getParameter("isAdmin").equals("false") && req.getParameter("isAdminForm").equals("false"))
        {
            user = new Users(req.getParameter("aFName"), req.getParameter("aLName"), req.getParameter("aUName")
                    , req.getParameter("aBDName"), req.getParameter("aPassword"), req.getParameter("aJName")
                    , req.getParameter("aEAName"), req.getParameter("aAName"), req.getParameter("aANTName"));
            if (db.addClient(user))
            {
                db.addUserCart(db.getUserID(new Users(req.getParameter("aUName"))));
                resp.sendRedirect(req.getParameter("URL"));
            }
            else
            {
                resp.sendRedirect(req.getParameter("URL")+"?invalid=true");
            }
        }        
        
        else
        {
            resp.sendRedirect(req.getParameter("URL")+"?invalid=true");
        }        
    }
}
