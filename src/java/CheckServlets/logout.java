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
public class logout extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        if (req.getParameter("logout").toString().equals("true"))
        {
            if (req.getCookies()[2].getValue().equals("true"))
            {
                resp.addCookie(new Cookie("login", "false"));
                resp.addCookie(new Cookie("isAdmin", "null"));
                resp.sendRedirect("/test/main.jsp");
            }
            else
            {
                resp.sendError(404);
            }
        }
        else
        {
            resp.sendError(500);
        }
    }
    
}
