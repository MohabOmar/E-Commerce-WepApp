package AddServlets;

import Database_Tables.Users;
import database.Database;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EditClient extends HttpServlet 
{
    Users user;
    Database db = new Database();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        if (req.getParameter("isAdminForm").equals("true"))
        {   
            
            user = new Users(Integer.parseInt(req.getParameter("uID")),req.getParameter("aUName"),req.getParameter("aFName"), req.getParameter("aLName")
                    , req.getParameter("aBDName"), req.getParameter("aPassword"), req.getParameter("aJName")
                    , req.getParameter("aEAName"), Float.parseFloat(req.getParameter("creditLimit"))
                    , Float.parseFloat(req.getParameter("balance"))
                    , req.getParameter("aAName"), req.getParameter("aANTName")
                    , Boolean.getBoolean(req.getParameter("isAdmin")));
            if (db.editClient(user))
            {
                System.out.println("AddServlets.EditClient.doPost()");
                resp.sendRedirect(req.getParameter("URL")+"&valid=true");
            }
            else
            {
                resp.sendRedirect(req.getParameter("URL")+"?invalid=true");
            }
        }
    }
    
}
