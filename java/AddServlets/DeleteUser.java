/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddServlets;

import Database_Tables.Users;
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
public class DeleteUser extends HttpServlet 
{
    String userName;
    Database db = new Database();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        userName = req.getParameter("uname");
        String URL = "/MAM/admin/showUsers.jsp";
        Users u = new Users(userName);
        u.setuId(db.getUserIDInInteger(u));

        if (db.deleteClient(u))
        {
            resp.sendRedirect(URL);
        }
        else
        {
            resp.sendError(404);
        }
    }
    
}
