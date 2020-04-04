<%-- 
    Document   : mycart
    Created on : Apr 2, 2020, 6:07:15 AM
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
        <link rel="stylesheet" href="./css/cart.css">

    </head>
    <body>

        <%@include file="./header.jsp" %>


        <%--<%!
            boolean isAdmin = false;
            boolean isLogin = false;
            boolean isID = false;
            boolean authorization = false;
            int userid = 0;
            Cookie[] c;
            private boolean checkCookie(Cookie[] cookies)
            {
                c = cookies;
                if (cookies != null)
                {
                    for (int i = 0; i < cookies.length; i++)
                    {
                        if (cookies[i].getName().equals("isAdmin"))
                        {
                            isAdmin = true; 
                        }
                        else if (cookies[i].getName().equals("login"))
                        {
                            isLogin = true;
                        }
                     
                    }
                    if (isAdmin == true && isLogin == true)
                    {
                        authorization = true;
                    }
                }
                return authorization;
            }
        %>--%>

        <%
            //    if (checkCookie(request.getCookies()) == false)
            //    {
            //        response.sendRedirect("/MAM/getCookies");
            //    }
            //    else
            //    {
            //        for (int i = 0; i < c.length; i++)
            //        {
            //            if (c[i].getName().equals("userID"))
            //            {
            //                userid = Integer.parseInt(c[i].getValue());
            //            }
            //        }
            //    }
        %>





        <div class="container">
            <div class="card shopping-cart">
                <%
            Database database = new Database();
            Product p = database.getProductById(new Product(Integer.parseInt(request.getParameter("pkey"))));
        %>
                <div class="card-header bg-dark text-light">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    Shipping cart
                    <a href="" class="btn btn-outline-info btn-sm pull-right">Continiu shopping</a>
                    <div class="clearfix"></div>
                </div>
                <div class="card-body">
                    <!-- PRODUCT -->
                    <div class="row">
                        <div class="col-12 col-sm-12 col-md-2 text-center">
                            <img class="img-responsive" src="<%=p.getImg()%>" alt="prewiew" width="120" height="80">
                        </div>
                        <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
                            <h4 class="product-name"><strong><%=p.getProductName()%></strong></h4>
                            <h4>
                                <small><%=p.getDesc()%></small>
                            </h4>
                        </div>
                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
                                <h6><strong><%=p.getPrice()%> <span class="text-muted">x</span></strong></h6>
                            </div>
                            <div class="col-4 col-sm-4 col-md-4">
                                <div class="quantity">
                                    <!--<input type="button" value="+" class="plus">-->
                                    <input type="number" step="1" max="<%=p.getQuantity()%>" min="1" value="1" title="Qty" class="qty" size="4">
                                    <!--<input type="button" value="-" class="minus">-->
                                </div>
                            </div>
                            <div class="col-2 col-sm-2 col-md-2 text-right">
                                <button type="button" class="btn btn-outline-danger btn-xs">
                                    <i class="fas fa-trash" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <!-- END PRODUCT -->

                    <div class="pull-right">
                        <a href="" class="btn btn-outline-secondary pull-right">
                            Update shopping cart
                        </a>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
                        <div class="row">
                            <div class="col-6">
                                <input type="text" class="form-control" placeholder="cupone code">
                            </div>
                            <div class="col-6">
                                <input type="submit" class="btn btn-default" value="Use cupone">
                            </div>
                        </div>
                    </div>
                    <div class="pull-right" style="margin: 10px">
                        <a href="" class="btn btn-success pull-right">Checkout</a>
                        <div class="pull-right" style="margin: 5px">
                            Total price: <b>50.00€</b>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="./footer.html" %>


        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="./js/main.js"></script>  
        <script src="https://use.fontawesome.com/c560c025cf.js"></script>

    </body>
</html>