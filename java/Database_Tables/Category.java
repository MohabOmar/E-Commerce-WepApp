package Database_Tables;

import java.util.Vector;

public class Category 
{
    int categoryid;    
    String categoryName;
    Vector<Category> allCategories;
    
    public Category ()
    {
        allCategories = new Vector();
    }

    public Category (int categoryid) 
    {
        this.categoryid = categoryid;
    }

    public Category (String categoryName) 
    {
        this.categoryName = categoryName;
    }

    public Category (int categoryid, String categoryName) 
    {
        this.categoryid = categoryid;
        this.categoryName = categoryName;
    }    
    

    public int getCategoryid() 
    {
        return categoryid;
    }

    public void setCategoryid(int categoryid) 
    {
        this.categoryid = categoryid;
    }

    public String getCategoryName() 
    {
        return categoryName;
    }

    public void setCategoryname(String categoryName)
    {
        this.categoryName = categoryName;
    }

    public Vector<Category> getAllCategories()
    {
        return allCategories;
    }

    public void setAllCategories(Vector<Category> allCategories) 
    {
        this.allCategories = allCategories;
    }    
}
