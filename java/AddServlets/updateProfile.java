package AddServlets;

import Database_Tables.Users;
import database.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class updateProfile extends HttpServlet{
    Users user;
    Database db = new Database();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
         if(!req.getParameter("npass").equals("")){
            user = new Users(req.getParameter("uname"),req.getParameter("fname"), req.getParameter("lname")
                    , req.getParameter("date"), req.getParameter("npass"), req.getParameter("job")
                    , req.getParameter("addr"),req.getParameter("interests")
                    );
             db.updateProfile(user);
              resp.sendRedirect("/MAM/pages/profile.jsp");
         }
         
         if(req.getParameter("npass").equals("")){
            user = new Users(req.getParameter("uname"),req.getParameter("fname"), req.getParameter("lname")
                    , req.getParameter("date"), req.getParameter("opass"), req.getParameter("job")
                    , req.getParameter("addr"),req.getParameter("interests")
                    );
             db.updateProfile(user);
              resp.sendRedirect("/MAM/pages/profile.jsp");
         }  
            
            
            
            
        }
        
         
    }

