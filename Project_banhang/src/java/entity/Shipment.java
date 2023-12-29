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
public class Shipment {
    private int id;
    private String address;
    private String phone;

    public Shipment(int id, String address) {
        this.id = id;
        this.address = address;
    }

    public Shipment(int id, String address, String phone) {
        this.id = id;
        this.address = address;
        this.phone = phone;
    }
    
    public Shipment() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    
    
}
