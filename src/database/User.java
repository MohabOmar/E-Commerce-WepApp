package databaseconnection;

import java.util.Vector;



public class User 
{
    String uname;
    String fname;
    String lname;
    String password;
    Vector<User> users = new Vector();
    
    public User ()
    {
        
    }
    public User(String fname,String lname,String uname,String password)
    {
        this.fname = fname;
        this.lname = lname;
        this.uname = uname;
        this.password = password;
    }
    
    public void setUsers (User user)
    {
        users.add(user);
    }
    
    public Vector<User> getUsers ()
    {
        return users;
    }
    
    public String getUserName ()
    {
        return uname;
    }
    
    public String getFirstName ()
    {
        return fname;
    }

    public String getLastName ()
    {
        return lname;
    }

    public String getPassword ()
    {
        return password;
    }    
}
