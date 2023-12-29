/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Order;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Hi
 */
public class ProductDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) throws Exception {
        List<Cart> book = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    Cart row = new Cart();
                    DAO dao = new DAO();
                    Product p = dao.getProductByID(String.valueOf(item.getId()));
                    row.setId(item.getId());
                    row.setName(p.getName());
                    row.setImage(p.getImage());
                    row.setDescription(p.getDescription());
                    row.setPrice(p.getPrice()*item.getQuantity());
                    row.setTitle(p.getTitle());
                    row.setQuantity(item.getQuantity());
                    book.add(row);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
    
    public List<Cart> getCartProductByAccId(Account acc)
    {
        List<Cart> book = new ArrayList<>();
        try {
            try {
                conn = new DBContext().getConnection();//mo ket noi voi sql
            } catch (Exception ex) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            String query = "select * from Cart where AccountID=? and InOrder = 0";
            ps = conn.prepareStatement(query);
            ps.setInt(1, acc.getId());
            rs = ps.executeQuery();
            while (rs.next()) 
            {
                Cart row = new Cart();
                int pid = rs.getInt("ProductID");
                int quantity = rs.getInt("Amount");
                DAO dao = new DAO();
                Product p = dao.getProductByID(String.valueOf(pid));
                row.setId(pid);
                row.setName(p.getName());
                row.setImage(p.getImage());
                row.setDescription(p.getDescription());
                row.setPrice(p.getPrice()*quantity);
                row.setTitle(p.getTitle());
                row.setQuantity(quantity);
                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
//    public static void main(String[] args) {
//        ProductDAO pd = new ProductDAO();
//        System.out.println(pd.getOrderProductByAccId(acc));
//    }
}
