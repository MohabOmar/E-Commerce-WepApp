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
                            <h3 class="align_text">Categories Panel</h3>
                        </div>
                        <!--////////////////////////////////////////////////////////////////////////--> 
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Add Category</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Remove Category</a>
                        </li>
                      </ul>
                      <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row bottom_Body">
                                <!--////////////////////////////////////////////////////////////////////////-->
                                <form action="/MAM/Category" class="form_Add container col-sm-4" method="POST">
                                    <img src="../img/Category.jpg" class="caImg" alt=""/>
                                    <div class="input-container">
                                        <i class="fas fa-tags icon"></i>
                                        <input class="input-field" type="text" placeholder="Category Name" name="category">
                                    </div>
                                    <input type="hidden" value="AddCategory" name="typeOfcategoryOperation"/>
                                    <button type="submit" class="btnCat">Add Category</button>
                                </form>
                                <!--////////////////////////////////////////////////////////////////////////-->
                            </div>                            
                        </div>
                          <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="row bottom_Body">
                                <!--////////////////////////////////////////////////////////////////////////-->
                                <form action="/MAM/Category" class="form_Add container col-sm-4" method="POST">
                                    <img src="../img/Category.jpg" class="caImg" alt=""/>
                                    <div class="input-container">
                                        <i class="fas fa-tags icon"></i>
                                        <input class="input-field" type="text" placeholder="Category Name" name="category">
                                    </div>
                                    <input type="hidden" value="RemoveCategory" name="typeOfcategoryOperation"/>
                                    <button type="submit" class="btnCat">Remove Category</button>
                                    <div class="bg-danger text-white dan">** If You Delete A category You will also Delete All Products that Related to deleted Category</div>                                                                    
                                </form>
                                <!--////////////////////////////////////////////////////////////////////////-->
                            </div>                                         
                          </div>
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