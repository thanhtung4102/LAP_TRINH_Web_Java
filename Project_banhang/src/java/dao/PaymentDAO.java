/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class PaymentDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Payment> getAllPayment()
    {
        List<Payment> ls = new ArrayList<>();
        String query = "select * from dbo.[Payment]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next())
            {
                ls.add(new Payment(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return ls;
    }
//    public static void main(String[] args) {
//        PaymentDAO pdao = new PaymentDAO();
//        System.out.println(pdao.getAllPayment().get(0).getMethod());
//    }
}
