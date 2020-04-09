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
 * @author MohabOmar
 */
public class DeleteFromCart extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pId = req.getParameter("pkey");
        Database dB = new Database();
        dB.deleteFromCart(pId);
        resp.sendRedirect("/MAM/main.jsp");
    }



}
