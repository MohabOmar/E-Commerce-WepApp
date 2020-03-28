<%-- 
    Document   : adminRegistrationVal
    Created on : Mar 28, 2020, 2:13:30 PM
    Author     : User1
--%>

<%@page import="database.Users"%>
<%@page import="database.Database"%>


<%!
       Users u;
       Database db = new Database();
%>

<%
    if (request.getParameter("isAdmin").equals("true"))
    {
        u = new Users(request.getParameter("aFName"), request.getParameter("aLName"), request.getParameter("aUName")
                , request.getParameter("aBDName"), request.getParameter("aPassword"), request.getParameter("aJName")
                , request.getParameter("aEAName"), request.getParameter("aAName"), request.getParameter("aANTName"));
        
        if (db.addAdmin(u))
        {
            response.sendError(200);
        }
        else
        {
            request.getRequestDispatcher("adminRegistration.jsp?invalid=true").forward(request, response);
        }
    }
    
    else if (request.getParameter("isAdmin").equals("false"))
    {
        u = new Users(request.getParameter("aFName"), request.getParameter("aLName"), request.getParameter("aUName")
                , request.getParameter("aBDName"), request.getParameter("aPassword"), request.getParameter("aJName")
                , request.getParameter("aEAName"), request.getParameter("aAName"), request.getParameter("aANTName"));
        if (db.addClient(u))
        {
            response.sendError(200);
        }
        else
        {
            response.sendRedirect("/asdasd");
        }
    }
    else
    {
        response.sendRedirect("/test/main.jsp?invalid=true");
    }
%>
