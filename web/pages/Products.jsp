<%@page import="java.util.Vector"%>
<%@page import="Database_Tables.*"%>
<%@page import="database.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String lo = "false";
    if (request.getCookies() != null) {
        for (int i = 0; i < request.getCookies().length; i++) {
            if (request.getCookies()[i].getName().equals("login")) {
                lo = request.getCookies()[i].getValue();
            }
        }
    }
%>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#Mobiles">Mobiles</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#Laptops">Laptops</a>
    </li>
</ul>
<div class="tab-content">

    <div class="tab-pane fade show active" id="Mobiles">
        <div class="container Cart">
            <div class="row justify-content-center">
                <%
                    Database da = new Database();
                    Vector<Product> listOfProducts = da.retrieveAllProducts();
                    Category mob = da.getCategoryByName(new Category("mobiles"));
                    for (Product po : listOfProducts) 
                    {
                        if (po.getCategoryId() == mob.getCategoryid()) {
                %>
                <div class="col-md-4" style="margin-bottom: 8%;">
                    <div class="card shadow" style="width: 20rem;">
                        <div class="inner">
                            <img src="<%=po.getImg()%>"  class="card-img-top" alt="...">
                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title"><%=po.getProductName()%></h5>
                            <p class="card-text"><%=po.getDesc()%></p>
                            <p class="card-text"><%=po.getPrice()%> EGP</p>
                            <form action="pages/viewProduct.jsp" method="GET">
                                <input type='hidden' name='pid' value='<%=po.getProductKey()%>'/>
                                <button type='submit' class="btn btn-primary">View</button>
                            </form>
                            <%
                                if (lo != null && lo.equalsIgnoreCase("true"))
                                {
                            %>
                            <form action="/MAM/AddToCart" method="GET">
                                <%}else if (lo != null){%>
                                <form action="/MAM/OfflineCart" method="POST">
                                    <%}%>
                                <input type="hidden" value="<%=po.getProductKey()%>" name="pkey"/>
                                <input type="hidden" value="1" name="quantity"/>
                                <input type="hidden" value="/MAM/main.jsp" name="URL"/>
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


    <div class="tab-pane fade" id="Laptops">
        <div class="container Cart">
            <div class="row justify-content-center">
                <%
                    Category lap = da.getCategoryByName(new Category("laptops"));
                    for (Product laptop : listOfProducts) 
                    {

                        if (laptop.getCategoryId() == lap.getCategoryid()) {
                %>
                <div class="col-md-4" style="margin-bottom: 8%;">
                    <div class="card shadow" style="width: 20rem;">
                        <div class="inner">
                            <img src="<%=laptop.getImg()%>"  class="card-img-top" alt="...">
                        </div>
                        <div class="card-body text-center">
                            <h5 class="card-title"><%=laptop.getProductName()%></h5>
                            <p class="card-text"><%=laptop.getDesc()%></p>
                            <p class="card-text"><%=laptop.getPrice()%> EGP</p>
                            <form action="pages/viewProduct.jsp" method="GET">
                                <input type='hidden' name='pid' value='<%=laptop.getProductKey()%>'/>
                                <button type='submit' class="btn btn-primary">View</button>
                            </form>
                            <%
                                if (lo != null && lo.equalsIgnoreCase("true"))
                                {
                            %>
                            <form action="/MAM/AddToCart" method="GET">
                                <%}else if (lo != null){%>
                                <form action="/MAM/OfflineCart" method="GET">
                                    <%}%>
                                <input type="hidden" value="<%=laptop.getProductKey()%>" name="pkey"/>
                                <input type="hidden" value="1" name="quantity"/>
                                <input type="hidden" value="/MAM/main.jsp" name="URL"/>
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






