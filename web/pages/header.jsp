<%!
    int userID;
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
                            <a href="/MAM/logout?logout=true" id="signOut">Sign Out/</a>
                            <a href="/MAM/pages/profile.jsp" id="profile">Profile</a>
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
                    <a class="navbar-brand" href="/MAM/main.jsp">Home</a>
                    <a class="navbar-brand" href="/MAM/search.jsp">Products</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02"
                            aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
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