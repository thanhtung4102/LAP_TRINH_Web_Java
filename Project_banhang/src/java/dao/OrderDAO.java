/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Order;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Hi
 */
public class OrderDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public int addOrder(int shipmentId, int paymentId, int accid, String paydate, double total)
    {
        int id = 0;
        String query = "INSERT INTO [dbo].[Order]\n" +
                        "           ([ShipmentID]\n" +
                        "           ,[PaymentID]\n" +
                        "           ,[AccountID]\n" +
                        "           ,[transaction_date]\n" +
                        "           ,[total_price])\n" +
                        "     VALUES\n" +
                        "           (?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?\n" +
                        "           ,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, shipmentId);
            ps.setInt(2, paymentId);
            ps.setInt(3, accid);
            ps.setString(4, paydate);
            ps.setDouble(5, total);
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
    public List<Order> getOrderByAccid(int accId)
    {
        List<Order> listOrder = new ArrayList<>();
        String query = "select * from dbo.[Order] where [AccountID] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accId);
            rs = ps.executeQuery();
            while(rs.next())
            {
                listOrder.add(new Order(rs.getInt(1), rs.getInt(4), rs.getString(5), rs.getDouble(6), rs.getInt(2), rs.getInt(3)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listOrder;
    }
    public void deleteOrder(int id)
    {
        String query = "delete from dbo.[Order] where [ID] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public List<Order> getCustomerBuying()
    {
        List<Order> listorder = new ArrayList<>();
        String query = "SELECT TOP 5 AccountID, SUM(total_price) AS TotalAmountPurchased\n" +
                        "FROM dbo.[Order]\n" +
                        "GROUP BY AccountID\n" +
                        "ORDER BY TotalAmountPurchased DESC;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next())
            {
                listorder.add(new Order(rs.getInt(1), rs.getDouble(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listorder;
    }
    public Order getOrderById(int id)
    {
        Order order = new Order();
        String query = "Select * from dbo.[Order] where [ID] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next())
            {
                return new Order(rs.getInt(1), rs.getInt(4), rs.getString(5), rs.getDouble(6), rs.getInt(2), rs.getInt(3));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Product> getProductBuying()
    {
        List<Product> listproduct = new ArrayList<>();
        String query = "SELECT TOP 5\n" +
                        "c.ProductID,\n" +
                        "SUM(c.Amount) AS TotalAmountSold\n" +
                        "FROM\n" +
                        "[Shop].[dbo].[Cart] c\n" +
                        "JOIN\n" +
                        "[Shop].[dbo].[Order] o ON c.AccountID = o.AccountID\n" +
                        "GROUP BY\n" +
                        "c.ProductID\n" +
                        "ORDER BY\n" +
                        "SUM(c.Amount) DESC;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next())
            {
                int pid = rs.getInt(1);
                DAO dao = new DAO();
                Product p = dao.getProductByID(String.valueOf(pid));
                p.setSoluong(rs.getInt(2));
                listproduct.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return listproduct;
    }
    public void deleteOrderByUid(int uid)
    {
        String query = "delete from dbo.[Order] where AccountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public static void main(String[] args) {
        OrderDAO odao = new OrderDAO();
        System.out.println(odao.getProductBuying().get(0).getSoluong());
    }
}
