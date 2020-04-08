<%-- 
    Document   : cart
    Created on : Apr 7, 2020, 6:53:38 PM
    Author     : Mohamed Ibrahim
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.io.PrintWriter"%>
<%@page import="Database_Tables.*"%>
<%@page import="java.util.Vector"%>
<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>

<div class="modal fade" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
           
            <div class="modal-header border-bottom-0">
                <h5 class="modal-title" id="exampleModalLabel">
                    Your Shopping Cart
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table class="table table-image">
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">Product</th>
                            <th scope="col">Price</th>
                            <th scope="col">Qty</th>
                            <th scope="col">Total</th>
                            <th scope="col">Actions</th>
                        </tr>
                    </thead>                
             <%
            int total = 0;
            Database s = new Database();
            Gson m = new Gson();
            if(request.getSession().getAttribute("cart-1") != null){
            Product pr = m.fromJson(request.getSession().getAttribute("cart-1").toString(), Product.class);
            for (int u =0; u < pr.getAllProducts().size(); u++)
            {
            int q = pr.getAllProducts().elementAt(u).getQuantity();
            Product ps = s.getProductById(pr.getAllProducts().elementAt(u));
            total += ps.getPrice()*q;
            %>
                    <tbody>
                        <tr>
                            <td class="w-25">
                                <img src="<%=ps.getImg()%>"
                                     class="img-fluid img-thumbnail" alt="Sheep">
                            </td>
                            <td><%=ps.getProductName()%></td>
                            <td><%=ps.getPrice()%></td>
                            <td class="qty"><input type="number" class="form-control" id="input1" max="<%=q%>" min="<%=q%>" value="<%=q%>"></td>
                            <td><%=ps.getPrice()*q%></td>
                            <td>
                                <a href="#" class="btn btn-danger btn-sm">
                                    <i class="fa fa-times"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                <%}}%>
                </table>      
                <div class="d-flex justify-content-end">
                    <h5>Total: <span class="price text-success"><%=total%></span></h5>
                </div>
            </div>
            <div class="modal-footer border-top-0 d-flex justify-content-between">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success">Checkout</button>
            </div>
                    
        </div>
    </div>
</div>