/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AddServlets;

import Database_Tables.Product;
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

public class AddProduct extends HttpServlet 
{
    Product product;
    Database db = new Database();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        int cID = Integer.parseInt(req.getParameter("cId"));
        String pName = req.getParameter("pName");
        float price = Float.parseFloat(req.getParameter("pPrice"));
        int pQuantity = Integer.parseInt(req.getParameter("pQuantity"));
        String desc = req.getParameter("pDesc");
        String img = req.getParameter("pImg");
        boolean isAvail = true;
        String URL = req.getParameter("URL");
        product = new Product(0, cID, pName, price, pQuantity, desc, img, isAvail);
        
        if (db.addProduct(product))
        {
            resp.sendRedirect(URL);
        }
    }
}