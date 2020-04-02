/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database_Tables;

/**
 *
 * @author MohabOmar
 */
public class Product {

    private int productKey;
    private int categoryId;
    private String productName;
    private float price;
    private int quantity;
    private String desc;
    private String img;
    private boolean isAvail;

    public Product(int productKey, int categoryId, String productName, float price, int quantity, String desc, String img, boolean isAvail) {
        this.productKey = productKey;
        this.categoryId = categoryId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.desc = desc;
        this.img = img;
        this.isAvail = isAvail;
    }


    public int getProductKey() {
        return productKey;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getProductName() {
        return productName;
    }

    public float getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getDesc() {
        return desc;
    }

    public String getImg() {
        return img;
    }

    public boolean isIsAvail() {
        return isAvail;
    }

    public void setProductKey(int productKey) {
        this.productKey = productKey;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setIsAvail(boolean isAvail) {
        this.isAvail = isAvail;
    }
    
    

    
}
