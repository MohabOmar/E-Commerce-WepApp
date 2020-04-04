<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    boolean isAdmin = false;
    boolean isLogin = false;
    boolean authorization = false;    
    
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
        return authorization;
    }
%>

<%
    if (checkCookie(request.getCookies()) == false)
    {
        System.out.println(checkCookie(request.getCookies()));
        response.sendRedirect("/MAM/main.jsp");
    }
%>

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
                        <a href="#"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
                        <a href="#"><i class="fas fa-users" aria-hidden="true"></i></a>
                        <a href="#"><i class="fas fa-search" aria-hidden="true"></i></a>
                    </div>
                    <a href="#" class="bottom">
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
                                    <a href="categories.jsp">Categories</a>
                                </div>
                                <div class="cards">
                                    <a href="#">Products</a>
                                </div>
                                <div class="cards">
                                    <a href="#">Users</a>
                                </div>
                                <div class="cards">
                                    <a href="#">Profile</a>                                
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
                            <h3 class="align_text">Add Admin Account</h3>
                        </div>
                        <!--////////////////////////////////////////////////////////////////////////--> 
                        <!--////////////////////////////////////////////////////////////////////////-->
                        <div class="container col-sm-8">
                            <form action="/MAM/signUpCheck" method="POST">
                                <div class="form-row">
                                    <div class="col-md-4 mb-3">
                                        <label>First Name</label>
                                        <input type="text" class="form-control" id="validationDefault01" placeholder="First Name" required name="aFName"/>                                        
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label>Last Name</label>
                                        <input type="text" class="form-control" id="validationDefault02" placeholder="Last Name" required name="aLName"/>                                     
                                    </div>          
                                    <div class="col-md-4 mb-3">
                                        <label>User Name</label>
                                        <input type="text" class="form-control" id="validationDefaultUsername" placeholder="User Name" required name="aUName"/>                                        
                                    </div>
                                </div>

                                <div class="form-row">
                                    <div class="col-md-4 mb-3">
                                        <label>Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required name="aPassword"/>                                    
                                    </div>                                              
                                    <div class="col-md-4 mb-3">
                                        <label>Birth-date</label>
                                        <input class="form-control" required type="date" name="aBDName"/>                                                                    
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label>Job Title</label>
                                        <input type="text"class="form-control" required placeholder="Job Title" required name="aJName"/>                             
                                    </div>                                              
                                </div>                                


                                <div class="form-row">
                                    <div class="col-md-6 mb-3">
                                        <label>Email Address</label>
                                        <input type="email" class="form-control" placeholder="Email Address" required name="aEAName"/>                                
                                    </div>                                              
                                    <div class="col-md-3 mb-3">
                                        <label>Address</label>
                                        <input type="text" class="form-control" placeholder="Address" required name="aAName"/>                                                                  
                                    </div>                                         
                                </div>           
                                
                                <div class="form-row">
                                    <div class="col-md-5 mb-3">
                                        <label>Interests</label>
                                        <input type="text" class="form-control" placeholder="Please Enter your Interests" required name="aANTName"/>
                                    </div>                                                                                      
                                </div>                                     
                                <input type="hidden" value="/MAM/admin/addAdminUser.jsp" name="URL"/>
                                <input type="hidden" value="true" name="isAdmin"/>
                                <button class="btn btn-primary" type="submit">Add Admin</button>
                            </form>
                                        <%
                                        if (request.getParameter("invalid") != null && request.getParameter("invalid").equals("true"))
                                        {
                                        %>
                                        <div class="alert alert-danger" style="margin-top: 20px;font-weight: bold" role="alert">
                                            User Name is taken By Someone Else
                                        </div>                                        
                                        <%
                                            }
                                        %>                            
                        </div>
                        <!--////////////////////////////////////////////////////////////////////////-->
                </div>
                <!--End the internal Body-->
            </div>
        <!--End the Body-->
    </div>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>