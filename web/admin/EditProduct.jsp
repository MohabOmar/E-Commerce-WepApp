<%@page import="database.Database"%>
<%@page import="Database_Tables.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    boolean isAdmin = false;
    boolean isLogin = false;
    boolean authorization = false; 
    Category c;
    Product p;
    Database db = new Database();
    
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
    if (checkCookie(request.getCookies()) == false)
    {
        response.sendRedirect("/MAM/main.jsp");
    }
    else
    {
        c = db.showAllCategories();
        p = db.getProductById(new Product(Integer.parseInt(request.getParameter("pid"))));
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
                            <h3 class="align_text">Edit Product</h3>
                        </div>
                        <!--////////////////////////////////////////////////////////////////////////--> 
                        <!--////////////////////////////////////////////////////////////////////////-->
<%if (authorization){%>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row bottom_Body">
                                <!--////////////////////////////////////////////////////////////////////////-->
                                <div class="container col-sm-8">
                                    <form action="/MAM/EditProduct" method="POST">
                                <div class="form-row">
                                    <div class="col-md-4 mb-3">
                                        <img src="<%=p.getImg()%>" style="height: 200px;width: 200px;margin: 10px"/>
                                        <input type="text"class="form-control" required placeholder="Add Image URL" required name="pImg"/>
                                    </div>                                        
                                </div>                                         
                                <div class="form-row">
                                    <div class="col-md-2 mb-3">
                                        <label>Category</label>
                                        <select class="form-control btn btn-primary" name="cId">
                                            <%for(int i =0; i < c.getAllCategories().size(); i++){%>
                                            <option style="color: black;background-color: white" value="<%=c.getAllCategories().elementAt(i).getCategoryid()%>"><%=c.getAllCategories().elementAt(i).getCategoryName()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="col-md-3 mb-3">
                                        <label>Product Name</label>
                                        <input type="text" class="form-control" id="validationDefault02" placeholder="Product Name" required name="pName" value="<%=p.getProductName()%>"/>                                     
                                    </div>          
                                    <div class="col-md-2 mb-3">
                                        <label>Product Price</label>
                                        <input type="number" class="form-control" id="validationDefaultUsername" placeholder="User Name" required name="pPrice" value="<%=p.getPrice()%>"/>
                                    </div>
                                    <div class="col-md-2 mb-3">
                                        <label>Quantity</label>
                                        <input type="number" class="form-control" id="exampleInputPassword1" required name="pQuantity" value="<%=p.getQuantity()%>"/>
                                    </div>
                                </div>                               
                                <div class="form-row">
                                    <div class="col-md-12 mb-3">
                                        <label>Description</label>
                                        <input class="form-control" required type="text" name="pDesc" value="<%=p.getDesc()%>"/>                                                                    
                                    </div>                                                                                    
                                </div>                                     
                                <input type="hidden" value="/MAM/admin/EditProduct.jsp?pid=<%=p.getProductKey()%>" name="URL"/>
                                <input type="hidden" name="pAva" value="true"/>                                
                                <input type="hidden" value="<%=p.getProductKey()%>" name="pID"/>
                                <button class="btn btn-primary" type="submit">Edit Product</button>
                            </form>
                                    <%
                                    if (request.getParameter("valid") != null && request.getParameter("valid").equals("true"))
                                    {
                                    %>
                                    <div class="bg-success text-white" style="margin-top: 20px;font-weight: bold" role="alert">
                                        Product Updated Successfully
                                    </div>                                        
                                    <%
                                        }
                                    %>                            
                        </div>
                            </div>                            
                        </div>
                    </div>
<%}%>
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