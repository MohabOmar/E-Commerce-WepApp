/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddServlets;

import database.Database;
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
public class Category extends HttpServlet 
{
    Database db = new Database();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        if (req.getCookies() == null)
        {
            resp.sendRedirect("/MAM/main.jsp");
        }
        else
        {
            String category = req.getParameter("category");
            Database db = new Database();
            if (req.getParameter("typeOfcategoryOperation").equals("AddCategory"))
            {
                if (db.addCategory(category))
                {
                    resp.sendRedirect("/MAM/admin/categories.jsp");
                }                
            }
            else if (req.getParameter("typeOfcategoryOperation").equals("RemoveCategory"))
            {
                if (db.removeCategory(category))
                {
                    resp.sendRedirect("/MAM/admin/categories.jsp");
                }                
            }

        }
    }

    
}
