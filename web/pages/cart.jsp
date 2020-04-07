<%-- 
    Document   : cart
    Created on : Apr 7, 2020, 6:53:38 PM
    Author     : Mohamed Ibrahim
--%>
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
             <%
            Database s = new Database();
            if(request.getParameter("pkey") != null){
            Product pr = s.getProductById(new Product(Integer.parseInt(request.getParameter("pkey"))));
        %>
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
                    <tbody>
                        <tr>
                            <td class="w-25">
                                <img src="<%=pr.getImg()%>"
                                     class="img-fluid img-thumbnail" alt="Sheep">
                            </td>
                            <td><%=pr.getProductName()%></td>
                            <td><%=pr.getPrice()%></td>
                            <td class="qty"><input type="text" class="form-control" id="input1" value="2"></td>
                            <td><%=pr.getPrice()%></td>
                            <td>
                                <a href="#" class="btn btn-danger btn-sm">
                                    <i class="fa fa-times"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                            
                <div class="d-flex justify-content-end">
                    <h5>Total: <span class="price text-success"><%=pr.getPrice()%></span></h5>
                </div>
                <%} %>
            </div>
            <div class="modal-footer border-top-0 d-flex justify-content-between">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success">Checkout</button>
            </div>
                    
        </div>
    </div>
</div>