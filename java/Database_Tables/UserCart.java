/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database_Tables;

import java.sql.Date;

/**
 *
 * @author MohabOmar
 */
public class UserCart {
    
    private int cartId;
    private int uId;
    private boolean submit;
    private Date submitDate;

    public UserCart(int cartId, int uId, boolean submit, Date submitDate) {
        this.cartId = cartId;
        this.uId = uId;
        this.submit = submit;
        this.submitDate = submitDate;
    }

    public int getCartId() {
        return cartId;
    }

    public int getuId() {
        return uId;
    }

    public boolean isSubmit() {
        return submit;
    }

    public Date getSubmitDate() {
        return submitDate;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public void setSubmit(boolean submit) {
        this.submit = submit;
    }

    public void setSubmitDate(Date submitDate) {
        this.submitDate = submitDate;
    }
    
    
    
    
    
}
