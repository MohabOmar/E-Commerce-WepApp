<%@page import="Database_Tables.*"%>
<%@page import="java.util.Vector"%>
<%@page import="database.Database"%>
<%@page import="java.sql.*"%>
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

<%!
    int userID = 0;
    boolean isAdmin = false;
    boolean isLogin = false;
    boolean isID = false;
    boolean authorization = false;
    String login = null;
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
                else if (cookies[i].getName().equals("userID"))
                {
                    isID = true;
                }
            }
            if (isAdmin == true && isLogin == true && isID == true)
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
    if (checkCookie(request.getCookies()) == false)
    {
        response.sendRedirect("/MAM/getCookies");
    }
    else
    {
        for (int i = 0; i < c.length; i++)
        {
            if (c[i].getName().equals("login"))
            {
                login = c[i].getValue();
            }else if(c[i].getName().equals("userID")){
                userID=Integer.parseInt(c[i].getValue());
            }
        }
    }
    Database db = new Database();
    Users u0 = new Users();
    u0.setuId(userID);
    
    Users user = db.getUserInfo(u0);
%>

<header>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-12">
                        <div class="btn-group">
                            <button class="btn border dropdown-toggle my-md-4 my-2 text-white" data-toggle="dropdown"
                                    aria-haspopup="true" aria-expanded="false">
                                EGY</button>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item">USD</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12 text-center">
                        <h2 class="my-md-3 site-title text-white">MAM</h2>
                    </div>
                    <div class="col-md-4 col-12 text-right">

                        <p class="my-md-4 header-links">
                            <%
                            if (login != null && login.equals("true")){%>
                            <a href="logout?logout=true" id="signOut">Sign Out</a>
                            <a href="/MAM/pages/profile" id="profile">Profile</a>
                            <%}
                            else if (login != null)
                            {%>
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#login-signup-modal">Login / </a>
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#signUp-admin-modal">Create an Account</a>                            
                            <%}%>
                        </p>
                    </div>
                </div>
            </div>

                
            <%@include file="loginForm.html" %>
            <%@include file="Signup.jsp" %>
            <%@include file="cart.jsp" %>


            <div class="container-fluid p-0">
                <nav class="navbar navbar-expand-lg navbar-light bg-white">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
                            aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
                        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                            <li class="nav-item active">
                                <a class="nav-link" href="../MAM/main.jsp">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                        </ul>

                        <div class="navbar-nav">
                            <li class="nav-item border rounded-circle mx-2 basket-icon">
                                <a href="javascript:void(0)" data-toggle="modal" data-target="#cartModal"><i class="fas fa-shopping-cart p-2"></i></a>
                            </li>
                        </div>

                        <form class="form-inline my-2 my-lg-0" action="search.jsp">
                            <input class="form-control mr-sm-2" type="search" name="keyword" placeholder="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </div>
                </nav>
            </div>
        </header>

        <div class="container">
            <div class="row flex-lg-nowrap">
                <div class="col">
                    <div class="row">
                        <div class="col mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="e-profile">
                                        <div class="row">
                                            <div class="col-12 col-sm-auto mb-3">
                                                <div class="mx-auto" style="width: 140px;">
                                                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                                                        <img src="https://img.pngio.com/profile-vector-png-vector-psd-and-clipart-with-transparent-user-profile-png-640_640.png" alt="" width="140px" height="140px">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                                <div class="text-center text-sm-left mb-2 mb-sm-0">
                                                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap"><%=user.getfName()%> <%=user.getlName()%></h4>
                                                    <p class="mb-0"><%=user.getJob()%></p>
                                                    <div class="mt-2">
                                                        <button class="btn btn-primary" type="button">
                                                            <i class="fa fa-fw fa-camera"></i>
                                                            <span><input type="file" id="img" name="img" accept="image/*"></span>
                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <ul class="nav nav-tabs">
                                            <li class="nav-item"><a href="" class="active nav-link">About</a></li>
                                        </ul>
                                        <div class="tab-content pt-3">
                                            <div class="tab-pane active">
                                                <form class="form" novalidate="">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>First Name:</label>
                                                                        <label><%=user.getfName()%></label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Last Name:</label>
                                                                        <label><%=user.getlName()%></label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Email:</label>
                                                                        <label><%=user.getEmail()%></label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Username:</label>
                                                                        <label><%=user.getuName()%></label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Birthday:</label>
                                                                        <label><%=user.getbDate()%></label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Job:</label>
                                                                        <label><%=user.getJob()%></label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Credit limit:</label>
                                                                        <label><%=user.getCreditLimit()%></label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Balance:</label>
                                                                        <label><%=user.getBalance()%></label>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="row">
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Address:</label>
                                                                        <label><%=user.getAddress()%></label>
                                                                    </div>
                                                                </div>
                                                                <div class="col">
                                                                    <div class="form-group">
                                                                        <label>Interests:</label>
                                                                        <label><%=user.getInterests()%></label>
                                                                    </div>
                                                                </div>
                                                            </div>   


                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-3 mb-3">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="px-xl-3">
                                        <button class="btn btn-block btn-secondary">
                                            <i class="fa fa-sign-out"></i>
                                            <span>Logout</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <h6 class="card-title font-weight-bold">Support</h6>
                                    <p class="card-text">Get fast, free help from our friendly assistants.</p>
                                    <button type="button" class="btn btn-primary">Contact Us</button>
                                </div>
                            </div>
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
    </body>
</html>