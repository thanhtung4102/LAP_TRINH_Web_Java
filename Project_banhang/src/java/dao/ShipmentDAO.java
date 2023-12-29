/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Order;
import entity.Shipment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class ShipmentDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public int addShipment(String addr, String phone)
    {
        int id = 0;
        String query = "INSERT INTO [dbo].[Shipment]\n" +
                        "           ([address]\n" +
                        "           ,[phone])\n" +
                        "     VALUES\n" +
                        "           (?\n" +
                        "           ,?)\n" 
                        ;
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, addr);
            ps.setString(2, phone);
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                // Lấy kết quả auto-generated keys
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    id = generatedKeys.getInt(1); // Lấy giá trị ID của bản ghi vừa được insert
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return id;
    }
    public void addSubtable(int idp, int ids)
    {
        String query = "Insert into Payment_Shipment values (?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, idp);
            ps.setInt(2, ids);
           ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public Shipment getShipmentById(int id)
    {
        Shipment a = new Shipment();
        String query = "select * from Shipment where ID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next())
            {
                a.setId(id);
                a.setAddress(rs.getString(2));
                a.setPhone(rs.getString(3));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return a;
    }
    public List<Shipment> getShipmentFromOrder(List<Order> listo)
    {
        List<Shipment> listp = new ArrayList<>();
        try {
            if (listo.size()>0)
            {
                for(Order o : listo)
                {
                    ShipmentDAO sdao = new ShipmentDAO();
                    listp.add(sdao.getShipmentById(o.getShipmentId()));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listp;
    }
    public void deleteShipmentByid(int id)
    {
        String query = "delete from Shipment where ID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareCall(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        ShipmentDAO sp = new ShipmentDAO();
        System.out.println(sp.getShipmentById(62).getAddress());
//        sp.addSubtable(1, 1);
    }
}
