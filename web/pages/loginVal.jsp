<%-- 
    Document   : loginVal
    Created on : Mar 29, 2020, 8:06:15 PM
    Author     : User1
--%>

<%@page import="database.Database"%>
<%@page import="database.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
   Users user = new Users();
   Database db = new Database();
   Cookie registrationCookie;
   Cookie isAdmin;
   String redirectedUrl;
%>

<%
    if (request.getParameter("userNameOrEmail") != null && request.getParameter("password") != null)
    {
        user.setUNameOrEmail(request.getParameter("userNameOrEmail"));
        user.setPassword(request.getParameter("password"));
        if (db.checkLogin(user))
        {
            if (db.checkIsAdmin(user))
            {
                System.out.println("Admin");
                isAdmin = new Cookie("isAdmin", "true");
                redirectedUrl = "http://www.isAdmincom";
            }
            else
            {
                System.out.println("Client");
                isAdmin = new Cookie("isAdmin", "false");
                redirectedUrl = "http://www.isClientcom";
            }
            registrationCookie = new Cookie("login", "true");
            response.addCookie(registrationCookie);
            response.addCookie(isAdmin);
            response.sendRedirect(redirectedUrl);
        }
        else
        {
            registrationCookie = new Cookie("login", "false");
            response.addCookie(registrationCookie);
            response.sendRedirect("/test/main.jsp");            
        }
    }
    else
    {
        response.sendError(404,"You Must First Go To Main PageThen Sign In Tape");
    }
%>