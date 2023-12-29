/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Hi
 */
public class Cart extends Product{
    private int quantity;
    private int AccId;
    private int idu;
    private int PaymentId;

    public Cart() {
    }

    public Cart(int quantity, int AccId) {
        this.quantity = quantity;
        this.AccId = AccId;
    }

    public int getAccId() {
        return AccId;
    }

    public void setAccId(int AccId) {
        this.AccId = AccId;
    }
    
    public Cart(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
}
