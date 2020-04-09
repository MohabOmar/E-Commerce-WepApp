<%@page import="Database_Tables.*"%>
<%@page import="java.util.Vector"%>
<%@page import="database.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MAM STORE</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/e46fb9d55b.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" href="../css/viewProduct.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/style2.css">
    </head>
    <body>

        <%@include file="./header.jsp" %>
        
    <div class="container viewProduct">
    <div class="row">
        <%
            Database database = new Database();
            Product p = database.retrieveSpecificProducts(request.getParameter("pid"));
        %>
        <div class="col-md-5">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<%=p.getImg()%>" class="d-block w-100" alt="...">
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
                if(p.getIsAvail()==true){
            %>
            <p><b>Availability:</b> In Stock</p>
            <%}%>
            <p><b>Brand:</b> <%=p.getProductName()%> </p>
            <p><b>Description:</b> <%=p.getDesc()%></p>
            <label>Quantity</label>
            <input type="number" value="1" max="<%=p.getQuantity()%>">
            <%
                if (login != null && login.equalsIgnoreCase("true"))
                {
            %>
            <form class="vpbtn btn-default" action="/MAM/AddToCart" method="GET">
                <%}else if (login != null){%>
                <form action="/MAM/OfflineCart" method="GET">
                    <%}%>
                <input type="hidden" value="<%=p.getProductKey()%>" name="pkey"/>
                <input type="hidden" value="1" name="quantity"/>
                <input type="hidden" value="/MAM/main.jsp" name="URL"/>
                <button type="submit" class="btn btn-primary">Add To Cart</button>
            </form>            
        </div>

    </div>
</div>
        

        <%@include file="./footer.html" %>

        
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="./js/main.js"></script>  
    </body>
</html>