<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MAM STORE</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/e46fb9d55b.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" href="./css/style2.css">
    </head>
    <body>
        <%
            if (request.getParameter("invalid") != null && request.getParameter("invalid").equals("true")) {
        %>
        <script type="text/javascript">
            alert("Invalid user Name Or Password");
        </script>        
        <%
            }
        %>

        <%
            if (request.getParameter("mustLogin") != null && request.getParameter("mustLogin").equals("true")) {
        %>
        <script type="text/javascript">
            alert("You should login to proceed purchasing");
        </script>        
        <%
            }
        %> 

        <%
            if (request.getParameter("balanceError") != null && request.getParameter("balanceError").equals("true")) {
        %>
        <script type="text/javascript">
            alert("Low Balance, Please refill your credit");
        </script>        
        <%
            }
        %> 

        <%
            if (request.getParameter("successCheckout") != null && request.getParameter("successCheckout").equals("true")) {
        %>
        <script type="text/javascript">
            alert("Success Checkout, Thank you for purchasing");
        </script>        
        <%
            }
        %> 

        <%@include file="./pages/header.jsp" %>

        <%@include file="./pages/main.html" %> 

        <%@include file="./pages/Products.jsp" %> 

        <%@include file="./pages/footer.html" %>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="./js/main.js"></script>  
    </body>
</html>