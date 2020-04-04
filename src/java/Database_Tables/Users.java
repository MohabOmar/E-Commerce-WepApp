package Database_Tables;

import java.util.Vector;



public class Users 
{
    private int uId;
    private String uName;
    private String fName;
    private String lName;
    private String bDate;
    private String password;
    private String job;
    private String email;
    private float creditLimit;
    private float balance;
    private String address;
    private String interests;
    private boolean isAdmin;
    private Vector<Users> users;
    private String uNameOrEmail;
    
    public Users()
    {
        users = new Vector();
    }
    
    public Users(String uNameOrEmail)
    {
        this.uNameOrEmail = uNameOrEmail;
    }    
    
    public Users(Vector<Users> users) 
    {
        this.users = users;
    }    
    
    public Users(String fName,String lName,String uName,String bDate,String password,String job,String email,String address,String interests)
    {
        this.fName = fName;
        this.lName = lName;
        this.uName = uName;
        this.bDate = bDate;
        this.password = password;
        this.job = job;
        this.email = email;
        this.address = address;
        this.interests = interests;
    }
    
    public Users(int uId, String uName, String fName, String lName, String bDate, String password, String job, String email, float creditLimit, float balance, String address, String interests, boolean isAdmin) 
    {
        this.uId = uId;
        this.uName = uName;
        this.fName = fName;
        this.lName = lName;
        this.bDate = bDate;
        this.password = password;
        this.job = job;
        this.email = email;
        this.creditLimit = creditLimit;
        this.balance = balance;
        this.address = address;
        this.interests = interests;
        this.isAdmin = isAdmin;
    }    

    public int getuId() 
    {
        return uId;
    }

    public void setuId(int uId) 
    {
        this.uId = uId;
    }

    public String getuName() 
    {
        return uName;
    }

    public void setuName(String uName) 
    {
        this.uName = uName;
    }

    public String getfName() 
    {
        return fName;
    }

    public void setfName(String fName) 
    {
        this.fName = fName;
    }

    public String getlName() 
    {
        return lName;
    }

    public void setlName(String lName) 
    {
        this.lName = lName;
    }

    public String getbDate() 
    {
        return bDate;
    }

    public void setbDate(String bDate) 
    {
        this.bDate = bDate;
    }

    public String getPassword() 
    {
        return password;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getJob() 
    {
        return job;
    }

    public void setJob(String job) 
    {
        this.job = job;
    }

    public String getEmail() 
    {
        return email;
    }

    public void setEmail(String email) 
    {
        this.email = email;
    }

    public float getCreditLimit() 
    {
        return creditLimit;
    }

    public void setCreditLimit(float creditLimit) 
    {
        this.creditLimit = creditLimit;
    }

    public float getBalance() 
    {
        return balance;
    }

    public void setBalance(float balance) 
    {
        this.balance = balance;
    }

    public String getAddress() 
    {
        return address;
    }

    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getInterests() 
    {
        return interests;
    }

    public void setInterests(String interests) 
    {
        this.interests = interests;
    }

    public boolean isIsAdmin() 
    {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) 
    {
        this.isAdmin = isAdmin;
    }

    public Vector<Users> getUsers() 
    {
        return users;
    }

    public void setUsers(Vector<Users> users) 
    {
        this.users = users;
    }
    
    public String getUNameOrEmail ()
    {
        return uNameOrEmail;
    }
    
    public void setUNameOrEmail (String uNameOrEmail)
    {
        this.uNameOrEmail = uNameOrEmail;
    }    
}
