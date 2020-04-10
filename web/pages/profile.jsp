<%-- 
    Document   : profile
    Created on : Apr 7, 2020, 8:29:14 PM
    Author     : Mohamed Ibrahim
--%>

<%!
    Users user ;
    Users u0;
%>



<%@page import="Database_Tables.*"%>
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
        <%@include file="./header.jsp" %>
        
<%
    if (authorization){
    Database db = new Database();        
    u0 = new Users();
    u0.setuId(userID);
    user = db.getUserInfo(u0);        
%>        
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab"  href="#about">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#edit">Edit Profile</a>
            </li>
        </ul>
        <div class="tab-content">

            <div class="tab-pane fade show active" id="about">
                <div class="container">
                    <div class="row justify-content-center">
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
                    </div>    
                </div>
            </div>


            <div class="tab-pane fade" id="edit">
                <div class="container">
                    <div class="row justify-content-center">
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
                                                                        <!--<button class="btn btn-primary" type="button">
                                                                            <i class="fa fa-fw fa-camera"></i>
                                                                            <span><input type="file" id="img" name="img" accept="image/*"></span>
                                                                        </button>-->
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
                    </div>    
                </div>
            </div>
        </div>
<%}%>    
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-sm-12 col-12">
                    </div>
                    <div class="col-md-4 col-12 text-center">
                        <h2 class="my-md-3 site-title text-white">Footer</h2>
                    </div>
                </div>
            </div>
        </footer>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <script src="./js/main.js"></script>          
    </body>
</html>