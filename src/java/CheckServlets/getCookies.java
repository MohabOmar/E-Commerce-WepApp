/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CheckServlets;

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
public class getCookies extends HttpServlet 
{
    Cookie registrationCookie;
    Cookie isAdmin;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        isAdmin = new Cookie("isAdmin", "false");
        registrationCookie = new Cookie("login", "false");
        resp.addCookie(registrationCookie);
        resp.addCookie(isAdmin);  
        resp.sendRedirect("/MAM/main.jsp");
    }
    
}
