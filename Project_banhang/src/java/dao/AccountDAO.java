/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import entity.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hi
 */
public class AccountDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public Account getAccountByID(int id)
    {
        String query = "select * FROM dbo.[Account] where uID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next())
            {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Account> getAllAccountUser()
    {
        List<Account> acc = new ArrayList<>();
        String query = "select * FROM dbo.[Account] where isSell = 0 and isAdmin = 0";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next())
            {
                acc.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getInt(5)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return acc;
    }
    public void deleteUserById(int id)
    {
        String query = "delete from dbo.[Account] where uID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void upgradeById(int id)
    {
        String query = "UPDATE [dbo].[Account]\n" +
                        "   SET [isSell] = 1\n" +
                        " WHERE uID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public void updatePassword(Account acc)
    {
        String query = "UPDATE [dbo].[Account]\n" +
                        "   SET pass = ?\n" +
                        " WHERE uID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, acc.getPass());
            ps.setInt(2, acc.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
//    public static void main(String[] args) {
//        AccountDAO adao = new AccountDAO();
//        System.out.println(adao.getAllAccount().get(0).getUser());
//    }
}
