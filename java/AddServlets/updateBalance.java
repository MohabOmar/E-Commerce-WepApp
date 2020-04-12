/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddServlets;

import Database_Tables.Users;
import database.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mohamed Ibrahim
 */
public class updateBalance extends HttpServlet {

    Users user;
    Database db = new Database();
    float amount=0;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("newBalance").equals("iti50")) {
            amount=Float.parseFloat(req.getParameter("oldBalance"))+50000;
            user = new Users(req.getParameter("uname"), amount);
            db.updateBalance(user);
            resp.sendRedirect("/MAM/pages/profile.jsp");
        }

        if (req.getParameter("newBalance").equals("iti100")) {
            amount=Float.parseFloat(req.getParameter("oldBalance"))+100000;
            user = new Users(req.getParameter("uname"), amount);
            db.updateBalance(user);
            resp.sendRedirect("/MAM/pages/profile.jsp");
        }

    }

}
