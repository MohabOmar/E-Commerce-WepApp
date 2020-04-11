/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CheckServlets;

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
 * @author MohabOmar
 */
public class Checkout extends HttpServlet {

    String isLogin = "false";
    String uId = "";
    String total;
    

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getCookies() != null) {
            for (int e = 0; e < req.getCookies().length; e++) {
                if (req.getCookies()[e].getName().equals("login")) {
                    isLogin = req.getCookies()[e].getValue();
                } else if (req.getCookies()[e].getName().equals("userID")) {
                    uId = req.getCookies()[e].getValue();
                }
            }
        }
        if (isLogin.equalsIgnoreCase("false"))
        {
            resp.sendRedirect("/MAM/main.jsp"+"?mustLogin=true");
        }else{
            String cartId = req.getParameter("cartid");
            total = req.getParameter("total");
            Database dataBase = new Database();
            Users user = dataBase.getUser(uId);
            if (user.getBalance() >= Integer.parseInt(total))
            {
                dataBase.updateBalance(uId, total);
                dataBase.deleteCartSaved(cartId);
                resp.sendRedirect("/MAM/main.jsp"+"?successCheckout=true");
            }else{
                resp.sendRedirect("/MAM/main.jsp"+"?balanceError=true");
            }
        }
    }

}
