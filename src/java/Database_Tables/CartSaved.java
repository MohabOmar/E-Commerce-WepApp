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
public class CartSaved {
    
    private int cartId;
    private int productId;
    private int quantity;
    private float priceAfterBut;

    public CartSaved(int cartId, int productId, int quantity, float priceAfterBut) {
        this.cartId = cartId;
        this.productId = productId;
        this.quantity = quantity;
        this.priceAfterBut = priceAfterBut;
    }

    public int getCartId() {
        return cartId;
    }

    public int getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public float getPriceAfterBut() {
        return priceAfterBut;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPriceAfterBut(float priceAfterBut) {
        this.priceAfterBut = priceAfterBut;
    }
    
    
    
}
