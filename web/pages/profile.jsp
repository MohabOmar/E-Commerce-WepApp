<%-- 
    Document   : profile
    Created on : Apr 7, 2020, 8:29:14 PM
    Author     : Mohamed Ibrahim
--%>

<%!
    int userI = 0;
    boolean isAdmi = false;
    boolean isLogi = false;
    boolean isI = false;
    boolean authorizatio = false;
    String logi = null;
    Cookie[] c1;

    private boolean checkCooki(Cookie[] cookies) {
        c1 = cookies;
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("isAdmin")) {
                    isAdmin = true;
                } else if (cookies[i].getName().equals("login")) {
                    isLogin = true;
                } else if (cookies[i].getName().equals("userID")) {
                    isID = true;
                }
            }
            if (isAdmin == true && isLogin == true && isID == true) {
                authorization = true;
            }
        } else {
            authorization = false;
        }
        return authorization;
    }
%>

<%
    if (checkCookie(request.getCookies()) == false) {
        response.sendRedirect("/MAM/getCookies");
    } else {
        for (int i = 0; i < c.length; i++) {
            if (c[i].getName().equals("login")) {
                login = c[i].getValue();
            } else if (c[i].getName().equals("userID")) {
                userID = Integer.parseInt(c[i].getValue());
            }
        }
    }
    Database db = new Database();
    Users u0 = new Users();
    u0.setuId(userID);

    Users user = db.getUserInfo(u0);
%>


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
    </head>
    <body>

        <%@include file="./header.jsp" %>





        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Edit Profile</a>
            </li>
        </ul>
        <div class="tab-content" id="myTabContent">

            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                <div class="container Cart">
                    <div class="row justify-content-center">
/*****************************************************************************/
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
/*****************************************************************************/
                    </div>    
                </div>
            </div>


            <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                <div class="container Cart">
                    <div class="row justify-content-center">
/*****************************************************************************/
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

                                                        <div class="tab-content pt-3">
                                                            <div class="tab-pane active">
                                                                <form class="form" novalidate="" action="/MAM/updateProfile" method="POST">
                                                                    <div class="row">
                                                                        <div class="col">
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>First Name:</label>
                                                                                        <input class="form-control" type="text" name="fname"  value="<%=user.getfName()%>">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Last Name:</label>
                                                                                        <input class="form-control" type="text" name="lname"  value="<%=user.getlName()%>">

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Email:</label>
                                                                                        <input class="form-control" type="email"   value="<%=user.getEmail()%>" readonly>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Username:</label>
                                                                                        <input class="form-control" type="text" name="uname" value="<%=user.getuName()%>" readonly>

                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Old password:</label>
                                                                                        <input class="form-control" type="password" name="opass" value="<%=user.getPassword()%>">

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>New password:</label>
                                                                                        <input class="form-control" type="password" name="npass">

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Birthday:</label>
                                                                                        <input class="form-control" type="date" name="date"  value="<%=user.getbDate()%>">

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Job:</label>

                                                                                        <input class="form-control" type="text" name="job"  value="<%=user.getJob()%>">

                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Credit limit:</label>

                                                                                        <input class="form-control" type="text"   value="<%=user.getCreditLimit()%>" readonly>

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Balance:</label>

                                                                                        <input class="form-control" type="text"   value="<%=user.getBalance()%>" readonly>

                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="row">
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Address:</label>

                                                                                        <input class="form-control" type="text" name="addr"  value="<%=user.getAddress()%>">

                                                                                    </div>
                                                                                </div>
                                                                                <div class="col">
                                                                                    <div class="form-group">
                                                                                        <label>Interests:</label>

                                                                                        <input class="form-control" type="text" name="interests"  value="<%=user.getInterests()%>">

                                                                                    </div>
                                                                                </div>
                                                                            </div>   


                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                        <div class="col d-flex justify-content-end">
                                                                            <button class="btn btn-primary" type="submit">Save Changes</button>
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
                                                    <p class="card-text">Text</p>
                                                    <button type="button" class="btn btn-primary">Contact Us</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
/*****************************************************************************/
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