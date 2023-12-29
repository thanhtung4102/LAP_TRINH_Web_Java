/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class CartDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public void addProductToCart(Account acc, Cart cart) {
        String query = "insert into cart values (?,?,?,0)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, acc.getId());
            ps.setInt(2, cart.getId());
            ps.setInt(3, cart.getQuantity());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void updateProductToCart(Account acc, Cart cart) {
        String query = "UPDATE cart\n" +
                       "SET [Amount] = ?\n" +
                       "WHERE [AccountID] = ? AND [ProductID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, cart.getQuantity());
            ps.setInt(2, acc.getId());
            ps.setInt(3, cart.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void removeProductToCart(Account acc, Cart cart) {
        String query = "DELETE FROM cart\n" +
                        "WHERE [AccountID] = ? AND [ProductID] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, acc.getId());
            ps.setInt(2, cart.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void updateCartToOrder(Account acc, Cart cart, int ido) {
        String query = "UPDATE cart\n" +
                       "SET [InOrder] = ?\n" +
                       "WHERE [AccountID] = ? AND [ProductID] = ? AND [InOrder] = 0";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ido);
            ps.setInt(2, acc.getId());
            ps.setInt(3, cart.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void addProductToCartNow(Account acc, int pid, int quantity, int orderId) {
        String query = "insert into cart values (?,?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, acc.getId());
            ps.setInt(2, pid);
            ps.setInt(3, quantity);
            ps.setInt(4, orderId);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public ArrayList<Cart> getCartByOrderId(int oid)
    {
        ArrayList<Cart> list = new ArrayList<>();
        String query = "Select * from Cart where [InOrder] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, oid);
            rs = ps.executeQuery();
            while(rs.next())
            {
                Cart c = new Cart(rs.getInt(3), rs.getInt(1));
                c.setId(rs.getInt(2));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public void removeCart(int oid) {
        String query = "DELETE FROM cart\n" +
                        "WHERE [InOrder] = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, oid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public int numbersOfProducts(int orderId, int pid, Account acc)
    {
        
        String query = "SELECT [Amount]\n" +
                       "  FROM [Shop].[dbo].[Cart] WHERE [AccountID] = ? AND [ProductID] = ? AND [InOrder] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(3, orderId);
            ps.setInt(2, pid);
            ps.setInt(1, acc.getId());
            rs = ps.executeQuery();
            while(rs.next())
            {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
    public void removeCartByUid(int uid) {
        String query = "DELETE FROM cart\n" +
                        "WHERE AccountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, uid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public static void main(String[] args) {
        CartDAO cdao = new CartDAO();
//        System.out.println(cdao.numbersOfProducts(56, c, acc));
        System.out.println(cdao.getCartByOrderId(56).get(0).getQuantity());
    }
}
