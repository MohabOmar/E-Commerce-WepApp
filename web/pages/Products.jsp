<%-- 
    Document   : Products
    Created on : 01-Apr-2020, 22:03:40
    Author     : MohabOmar
--%>
<%@page import="Database_Tables.Category"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Database_Tables.Product"%>
<%@page import="java.util.Vector"%>
<%@page import="database.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>




<ul class="nav nav-tabs" id="myTab" role="tablist">
    <li class="nav-item">
        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Mobiles</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Labtops</a>
    </li>
</ul>
<div class="tab-content" id="myTabContent">

    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
        <div class="container Cart">
            <div class="row justify-content-center">
                <%
                    Database database = new Database();
                    Vector<Product> listOfProducts = database.retrieveAllProducts();
                    Category mob = database.getCategoryByName(new Category("mobiles"));
                    for (Product p : listOfProducts) {
                        if (p.getCategoryId() == mob.getCategoryid()) {
                %>
                <div class="col-md-4" style="margin-bottom: 8%;">
                    <div class="card shadow" style="width: 20rem;">
                        <div class="inner">
                            <img src="<%=p.getImg()%>"  class="card-img-top" alt="...">
                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title"><%=p.getProductName()%></h5>
                            <p class="card-text"><%=p.getDesc()%></p>
                            <p class="card-text"><%=p.getPrice()%> EGP</p>
                            <form action="pages/viewProduct.jsp" method="GET">
                                <input type='hidden' name='pid' value='<%=p.getProductKey()%>'/>
                                <button type='submit' class="btn btn-primary">View</button>
                            </form>
                            <form action="/MAM/main.jsp" method="GET">
                                <input type="hidden" value="<%=p.getProductKey()%>" name="pkey"/>
                                <button type="submit" class="btn btn-primary">Add To Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%}%>
                <%}%> 
            </div>    
        </div>
    </div>


    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
        <div class="container Cart">
            <div class="row justify-content-center">
                <%
                    Category lap = database.getCategoryByName(new Category("laptops"));
                    for (Product p : listOfProducts) {

                        if (p.getCategoryId() == lap.getCategoryid()) {
                %>
                <div class="col-md-4" style="margin-bottom: 8%;">
                    <div class="card shadow" style="width: 20rem;">
                        <div class="inner">
                            <img src="<%=p.getImg()%>"  class="card-img-top" alt="...">
                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title"><%=p.getProductName()%></h5>
                            <p class="card-text"><%=p.getDesc()%></p>
                            <p class="card-text"><%=p.getPrice()%> EGP</p>
                            <form action="pages/viewProduct.jsp" method="GET">
                                <input type='hidden' name='pid' value='<%=p.getProductKey()%>'/>
                                <button type='submit' class="btn btn-primary">View</button>
                            </form>
                            <form action="/MAM/main.jsp" method="GET">
                                <input type="hidden" value="<%=p.getProductKey()%>" name="pkey"/>
                                <button type="submit" class="btn btn-primary">Add To Cart</button>
                            </form>
                        </div>
                    </div>
                </div>
                <%}%>
                <%}%> 
            </div>    
        </div>
    </div>


</div>






