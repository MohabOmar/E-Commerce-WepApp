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
    Cookie uID;
    Cookie cartID;
    int i = 0;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        i++;
        registrationCookie = new Cookie("login", "false");        
        isAdmin = new Cookie("isAdmin", "false");
        uID = new Cookie("userID", "0");
        cartID = new Cookie("cartID", "cart-"+i);
        //////////////////////////////////////////////////
        isAdmin.setMaxAge(60*60*24);
        registrationCookie.setMaxAge(60*60*24);
        uID.setMaxAge(60*60*24);
        cartID.setMaxAge(60*60*24*30);
        /////////////////////////////////////////////////
        resp.addCookie(registrationCookie);
        resp.addCookie(isAdmin);  
        resp.addCookie(uID);  
        resp.addCookie(cartID);
        /////////////////////////////////////////////////
        resp.sendRedirect("/MAM/main.jsp");
    }
    
}
