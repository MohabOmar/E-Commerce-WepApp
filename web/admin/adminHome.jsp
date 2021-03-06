<%@page import="database.Database"%>
<%!
    boolean isAdmin = false;
    boolean isLogin = false;
    boolean authorization = false;
    Database d = new Database();
    
    private boolean checkCookie(Cookie[] cookies)
    {
        if (cookies != null)
        {
            for (int i = 0; i < cookies.length; i++)
            {
                if (cookies[i].getName().equals("isAdmin"))
                {
                    if (cookies[i].getValue().equals("true"))
                    {
                       isAdmin = true; 
                    }
                }
                else if (cookies[i].getName().equals("login"))
                {
                    if (cookies[i].getValue().equals("true"))
                    {
                       isLogin = true; 
                    }
                }
            }
            if (isAdmin == true && isLogin == true)
            {
                authorization = true;
            }
        }
        else
            {
                authorization = false;
            }
        return authorization;
    }
%>

<%
    System.out.println(authorization);
    if (checkCookie(request.getCookies()) == false)
    {
        response.sendRedirect("/MAM/main.jsp");
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dash-Board</title>
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="../css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
    <div class="container-fluid main_body">
        <!--Start the Body-->
            <div class="row">
                <!--Start the Left Vertical Bar-->
                <div class="col-sm-1 vertical_bar">
                    <img src="../img/ecommerce.JPG" />
                    <div class="row tabs">
                        <a href="adminHome.jsp"><i class="fas fa-home"></i></a>
                        <a href="showProducts.jsp"><i class="fab fa-product-hunt"></i></a>
                        <a href="showUsers.jsp"><i class="fas fa-users" aria-hidden="true"></i></a>
                        <a href="showCategories.jsp"><i class="fab fa-cuttlefish"></i></a>
                    </div>
                    <a href="/MAM/logout" class="bottom">
                        <i class="fas fa-sign-out-alt"></i>
                    </a>
                </div>
                <!--End the Left Vertical Bar-->
                <!--Start the internal Body-->
                <div class="col-sm-11 internal_Body">
                    <!--Start Of The Top Menu-->
                    <div class="row top_Bar">
                        <!--Start Cards in the menu-->
                        <div class="col-sm-10 top_Menu">
                            <div class="center">
                                <div class="cards">
                                    <a href="categories.jsp">Add Categories</a>
                                </div>
                                <div class="cards">
                                    <a href="AddProduct.jsp">Add Product</a>
                                </div>
                                <div class="cards">
                                    <a href="addAdminUser.jsp">New User</a>
                                </div>
                                <div class="cards">
                                    <a href="/MAM/admin/EditClient.jsp">Profile</a>
                                </div>
                            </div>
                        </div>
                        <!--End Cards in the menu-->
                        <!--Start the menu Button-->
                        <div class="col-sm-2 menu_Button">
                            <a href="#" id="menu_Button"><i class="fas fa-bars"></i></a>
                        </div>
                        <!--End the menu Button-->
                    </div>
                    <!--End Of The Top Menu-->
                        <!--////////////////////////////////////////////////////////////////////////-->                    
                        <div class="row" style="height: 10%;">
                            <h3 class="align_text">Admin Portal</h3>
                        </div>
                        <!--////////////////////////////////////////////////////////////////////////-->                    
                    <div class="row bottom_Body">
                        <!--////////////////////////////////////////////////////////////////////////-->

                        <!--////////////////////////////////////////////////////////////////////////-->
<%if (authorization){%>
                            <div class="card card_marign">
                                 <div class="card-body">
                                    <h4 class="card-title">Categories</h4>
                                    <p class="card-text">The Number Of Categories is : <%=d.numberOfCategories()%></p>
                                    <button type="button" class="btn btn-info"><a class="info" href="showCategories.jsp">More Info</a></button>
                                </div>
                            </div>
                            <div class="card card_marign">
                                 <div class="card-body">
                                    <h4 class="card-title">Users</h4>
                                    <p class="card-text">The Number Of Users is : <%=d.numberOfUsers()%></p>
                                    <button type="button" class="btn btn-info"><a class="info" href="showUsers.jsp">More Info</a></button>
                                    
                                </div>
                            </div>         
                            <div class="card card_marign">
                                 <div class="card-body">
                                    <h4 class="card-title">Buy Operations</h4>
                                    <p class="card-text">The Number Of Buy Operations is : <%=d.numberOfSuccessCart()%></p>
                                    <button type="button" class="btn btn-info"><a class="info" href="#">More Info</a></button>                                    
                                </div>
                            </div>       
                            <div class="card card_marign">
                                 <div class="card-body">
                                    <h4 class="card-title">Products</h4>
                                    <p class="card-text">The Number Of Products is : <%=d.numberOfProducts()%></p>
                                    <button type="button" class="btn btn-info"><a class="info" href="showProducts.jsp">More Info</a></button>
                                </div>  
                            </div>                                 
                        <!--////////////////////////////////////////////////////////////////////////-->
<%}%>                        
                    </div>
                </div>
                <!--End the internal Body-->
            </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>