<%@page import="Database_Tables.Category"%>
<%@page import="Database_Tables.Product"%>
<%@page import="java.util.Vector"%>
<%@page import="database.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    boolean isAdmin = false;
    boolean isLogin = false;
    boolean authorization = false;    
    Database db = new Database();
    Vector<Product> p;
    
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

    private String getCategoryName(int categoryid)
    {
        return db.getCategoryByID(new Category(categoryid)).getCategoryName();
    }

    private String getAvailabilty(boolean isAvail)
    {
        if(isAvail)
        {
            return "Available";
        }
        else
        {
            return "Not Available";
        }
    }
%>

<%
    if (checkCookie(request.getCookies()) == false)
    {
        response.sendRedirect("/MAM/main.jsp");
    }
    else
    {
        p = db.retrieveAllProducts();
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
                                    <a href="categories.jsp">Categories</a>
                                </div>
                                <div class="cards">
                                    <a href="AddProduct.jsp">Add Product</a>
                                </div>
                                <div class="cards">
                                    <a href="addAdminUser.jsp">New User</a>
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
                            <h3 class="align_text">Clients Panel</h3>
                        </div>
                        <!--////////////////////////////////////////////////////////////////////////--> 
                        <!--////////////////////////////////////////////////////////////////////////-->
                        <div class="container col-sm-12">
                            <table class="table table-hover" style="background-color: white">
                              <thead>
                                <tr>
                                  <th scope="col">#</th>
                                  <th scope="col">PID</th>
                                  <th scope="col">Category</th>
                                  <th scope="col">Name</th>
                                  <th scope="col">Price</th>
                                  <th scope="col">Quantity</th>
                                  <th scope="col">Description</th>
                                  <th scope="col">Image</th>
                                  <th scope="col">Availability</th>
                                  <th scope="col">Action</th>
                                </tr>
                              </thead>
                              <tbody>
                                <%for(int i = 0; i < p.size(); i++){%>                                  
                                <tr>
                                  <th scope="row"><%=i+1%></th>
                                  <td><%=p.elementAt(i).getProductKey()%></td>
                                  <td><%=getCategoryName(p.elementAt(i).getCategoryId())%></td>
                                  <td><%=p.elementAt(i).getProductName()%></td>
                                  <td><%=p.elementAt(i).getPrice()%></td>
                                  <td><%=p.elementAt(i).getQuantity()%></td>
                                  <td><%=p.elementAt(i).getDesc()%></td>
                                  <td><a href="<%=p.elementAt(i).getImg()%>" target="_blank">Show Image</a></td>
                                  <td><%=getAvailabilty(p.elementAt(i).getIsAvail())%></td>
                                  <td>
                                      <a href="/MAM/admin/EditProduct.jsp?pid=<%=p.elementAt(i).getProductKey()%>" style="color: #00cc66;font-size: 25px"><i class="far fa-edit"></i></a>
                                      <a href="/MAM/DeleteProduct?pid=<%=p.elementAt(i).getProductKey()%>" style="color: red;font-size: 25px"><i class="far fa-minus-square"></i></a>
                                  </td>
                                </tr>
                                <%}%>                              
                              </tbody>
                            </table>
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