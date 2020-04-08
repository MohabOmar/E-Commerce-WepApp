/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddServlets;

import Database_Tables.UserCart;
import database.Database;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MohabOmar
 */
public class AddToCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String uId = req.getCookies()[3].getValue();
        String pId = req.getParameter("pkey");
        String qty = req.getParameter("quantity");
        Database dB = new Database();
        UserCart userCart = dB.getUserCart(uId);
        String cartId = userCart.getCartId() + "";
        dB.updateCart(pId, cartId, qty);
        resp.sendRedirect("/MAM/main.jsp");
    }
}
