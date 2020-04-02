/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CheckServlets;

import Database_Tables.Users;
import database.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User1
 */
public class signUpCheck extends HttpServlet 
{
    Users user;
    Database db = new Database();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        if (req.getParameter("isAdmin").equals("true"))
        {
            user = new Users(req.getParameter("aFName"), req.getParameter("aLName"), req.getParameter("aUName")
                    , req.getParameter("aBDName"), req.getParameter("aPassword"), req.getParameter("aJName")
                    , req.getParameter("aEAName"), req.getParameter("aAName"), req.getParameter("aANTName"));

            if (db.addAdmin(user))
            {
                resp.sendRedirect("/MAM/asdadasd.jsp");
            }
            else
            {
                req.getRequestDispatcher("adminRegistration.jsp?invalid=true").forward(req, resp);
            }
        }

        else if (req.getParameter("isAdmin").equals("false"))
        {
            user = new Users(req.getParameter("aFName"), req.getParameter("aLName"), req.getParameter("aUName")
                    , req.getParameter("aBDName"), req.getParameter("aPassword"), req.getParameter("aJName")
                    , req.getParameter("aEAName"), req.getParameter("aAName"), req.getParameter("aANTName"));
            if (db.addClient(user))
            {
                resp.sendRedirect("/MAM/main.jsp");
            }
            else
            {
                req.getRequestDispatcher("adminRegistration.jsp?invalid=true").forward(req, resp);
            }
        }
        else
        {
            resp.sendRedirect("/MAM/main.jsp?invalid=true");
        }        
    }
}
