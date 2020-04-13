<%-- 
    Document   : search
    Created on : 02-Apr-2020, 03:26:46
    Author     : MohabOmar
--%>

<%@page import="Database_Tables.Product"%>
<%@page import="java.util.Vector"%>
<%@page import="database.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    String login0 = "false";
    if (request.getCookies() != null) {
        for (int i = 0; i < request.getCookies().length; i++) {
            if (request.getCookies()[i].getName().equals("login")) {
                login0 = request.getCookies()[i].getValue();
            }
        }
    }
%>


<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MAM STORE</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/e46fb9d55b.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" href="./css/style2.css">
        <link href='https://fonts.googleapis.com/css?family=Quantico' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <%@include file="./pages/header.jsp" %>      

        <div class="container-fluid">
            <div class="slider">
                <form method="post" class="searchByPrice" action="searchByPrice.jsp">
                    <div class="rannge">
                        <output>MIN</output>
                        <input type = "range" min="0" max="5000" onchange="rangevalue.value = value" name="val1"/>
                        <output id="rangevalue">0</output>                        
                    </div>
                    <div class="rannge">
                        <output>MAX</output>
                        <input type = "range" min="5000" max="50000" onchange="rangevalue2.value = value" name="val2"/>
                        <output id="rangevalue2">50000</output>                        
                    </div>
                    <input type="hidden" name="key" value=<%=request.getParameter("keyword")%>>
                    <input class="btn btn-outline-light" type="submit" value="Submit">
                </form>
            </div>
        </div>

<%if (request.getParameter("keyword") != null){%>                    
        <div class="container Cart">
            <div class="row justify-content-center">
                <%
                    Database db = new Database();
                    Vector<Product> listOfProducts = db.search(request.getParameter("keyword"));
                    for (Product p : listOfProducts) {

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
                                <button type='submit' class="btn btn-outline-light">View</button>
                            </form>
                            <%
                                if (login0 != null && login0.equalsIgnoreCase("true")) {
                            %>
                            <form action="/MAM/AddToCart" method="GET">
                                <%} else if (login0 != null) {%>
                                <form action="/MAM/OfflineCart" method="POST">
                                    <%}%>
                                    <input type="hidden" value="<%=p.getProductKey()%>" name="pkey"/>
                                    <input type="hidden" value="1" name="quantity"/>
                                    <input type="hidden" value="<%=request.getRequestURI().toString()%>" name="URL"/>
                                    <button type="submit" class="btn btn-outline-light">Add To Cart</button>
                                </form>
                        </div>
                    </div>
                </div>

                <%}%> 
            </div>    
        </div>
<%}else{%> 
        <div class="container Cart">
            <div class="row justify-content-center">
                <%
                    Database db = new Database();
                    Vector<Product> listOfProducts = db.retrieveAllProducts();
                    for (Product p : listOfProducts) {

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
                                <button type='submit' class="btn btn-outline-light">View</button>
                            </form>
                            <%
                                if (login0 != null && login0.equalsIgnoreCase("true")) {
                            %>
                            <form action="/MAM/AddToCart" method="GET">
                                <%} else if (login0 != null) {%>
                                <form action="/MAM/OfflineCart" method="POST">
                                    <%}%>
                                    <input type="hidden" value="<%=p.getProductKey()%>" name="pkey"/>
                                    <input type="hidden" value="1" name="quantity"/>
                                    <input type="hidden" value="<%=request.getRequestURI().toString()%>" name="URL"/>
                                    <button type="submit" class="btn btn-outline-light">Add To Cart</button>
                                </form>
                        </div>
                    </div>
                </div>

                <%}%> 
            </div>    
        </div>
<%}%>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="./js/main.js"></script>
        <%@include file="./pages/footer.html" %>