<%@page import="java.io.PrintWriter"%>
<%@page import="Database_Tables.*"%>
<%@page import="java.util.Vector"%>
<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="container viewProduct">
    <div class="row">
        <%
            Database database = new Database();
            Vector<Product> listOfProducts = database.retrieveAllProducts();
            for (Product p : listOfProducts) {
        %>
        <div class="col-md-5">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src=".<%=p.getImg()%>" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src=".<%=p.getImg()%>" class="d-block w-100" alt="...">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="col-md-7">
            <p class="newarrival text-center">NEW</p>
            <h2><%=p.getProductName()%></h2>
            <p>product Code: <%=p.getProductKey()%></p>
            <img src="https://w0.pngwave.com/png/541/572/the-fault-in-our-stars-film-hallowed-review-star-png-clip-art.png" alt="" class="stars">
            <p class="price"> <%=p.getPrice()%> EGP</p>
            <%
                if(p.isIsAvail()==true){
            %>
            <p><b>Availability:</b> In Stock</p>
            <%}%>
            <p><b>Brand:</b> <%=p.getProductName()%> </p>
            <p><b>Description:</b> <%=p.getDesc()%></p>
            <label>Quantity</label>
            <input type="text" value="1">
            <button type="button" class="vpbtn btn-default cart">Add to cart</button>
        </div>
        <%}%> 
    </div>
</div>