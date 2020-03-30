/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CheckServlets;

import database.Database;
import Database_Tables.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User1
 */
public class loginCheck extends HttpServlet 
{
    Database db = new Database();
    Users user = new Users();
    Cookie registrationCookie;
    Cookie isAdmin;
    String redirectedUrl;

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
                    redirectedUrl = "http://www.isAdminHiiiiiiiiiiii";
                }
                else
                {
                    System.out.println("Client");
                    isAdmin = new Cookie("isAdmin", "false");
                    redirectedUrl = "/test/main.jsp";
                }
                registrationCookie = new Cookie("login", "true");
                resp.addCookie(registrationCookie);
                resp.addCookie(isAdmin);
                resp.sendRedirect(redirectedUrl);
            }
            else
            {
                registrationCookie = new Cookie("login", "false");
                resp.addCookie(registrationCookie);
                resp.sendRedirect("/test/main.jsp");            
            }
        }
        else
        {
            resp.sendError(404,"You Must First Go To Main PageThen Sign In Tape");
        }        
    }
}
