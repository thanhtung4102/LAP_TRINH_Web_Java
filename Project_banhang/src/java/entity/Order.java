/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author Hi
 */
public class Order{
    private int orderId;
    private int AccId;
    private String OrderDate;
    private double totalAmount;
    private int ShipmentId;
    private int PaymentId;

    public Order() {
    }

    public Order(int orderId, int AccId, String OrderDate, double totalAmount, int ShipmentId, int PaymentId) {
        this.orderId = orderId;
        this.AccId = AccId;
        this.OrderDate = OrderDate;
        this.totalAmount = totalAmount;
        this.ShipmentId = ShipmentId;
        this.PaymentId = PaymentId;
    }

    public int getShipmentId() {
        return ShipmentId;
    }

    public void setShipmentId(int ShipmentId) {
        this.ShipmentId = ShipmentId;
    }

    public int getPaymentId() {
        return PaymentId;
    }

    public void setPaymentId(int PaymentId) {
        this.PaymentId = PaymentId;
    }
    
    
    
    public Order(int orderId, int AccId, String OrderDate, double totalAmount) {
        this.orderId = orderId;
        this.AccId = AccId;
        this.OrderDate = OrderDate;
        this.totalAmount = totalAmount;
    }

    public Order(int AccId, double totalAmount) {
        this.AccId = AccId;
        this.totalAmount = totalAmount;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getAccId() {
        return AccId;
    }

    public void setAccId(int AccId) {
        this.AccId = AccId;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
}
