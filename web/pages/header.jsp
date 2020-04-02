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
                        <%!int x = 0;%>
                        <p class="my-md-4 header-links">
                            <%if(request.getCookies() == null || request.getCookies().length <= 1){response.sendRedirect("getCookies");}
                            else if (request.getCookies()[2].getValue().equals("true")){%>
                            <a href="logout?logout=true" id="signOut">Sign Out</a>
                            <%}else if(request.getCookies()[2].getValue().equals("false")){%>
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#login-signup-modal">Login / </a>
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#signUp-admin-modal">Create an Account</a>                            
                            <%}%>
                        </p>
                    </div>
                </div>
            </div>

                
            <%@include file="loginForm.html" %>
            <%@include file="Signup.jsp" %>


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
                                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                        </ul>

                        <div class="navbar-nav">
                            <li class="nav-item border rounded-circle mx-2 basket-icon">
                                <i class="fas fa-shopping-cart p-2"></i>
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