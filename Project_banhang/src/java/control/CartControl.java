/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.CartDAO;
import entity.Account;
import entity.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hi
 */
@WebServlet(name = "CartControl", urlPatterns = {"/cart"})
public class CartControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Account acc = (Account) request.getSession().getAttribute("acc");
        if (acc == null)
        {
            ArrayList<Cart> cartList = new ArrayList<>();
            int pid = Integer.parseInt(request.getParameter("pid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Cart cart = new Cart();
            cart.setId(pid);
            cart.setQuantity(quantity);
            HttpSession session = request.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart_list");
            if(cart_list == null)
            {
                cartList.add(cart);
                session.setAttribute("cart_list", cartList);
                response.sendRedirect("home");
            }
            else 
            {
                cartList = cart_list;
                boolean exist = false;
                for (Cart c : cartList)
                {
                    if (c.getId() == pid){
                        exist = true;
                        break;
                    }
                }
                if (exist)
                {
                    request.setAttribute("productExistsInCart", true);
                    request.getRequestDispatcher("home").forward(request, response);
                }
                else 
                {
                    cartList.add(cart);
                    response.sendRedirect("home");
                }
            }
        }
        else 
        {
            ArrayList<Cart> cartList = new ArrayList<>();
            int pid = Integer.parseInt(request.getParameter("pid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Cart cart = new Cart();
            cart.setId(pid);
            cart.setQuantity(quantity);
            HttpSession session = request.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart_list");
            if(cart_list == null)
            {
                cartList.add(cart);
                session.setAttribute("cart_list", cartList);
                response.sendRedirect("home");
            }
            else 
            {
                cartList = cart_list;
                boolean exist = false;
                for (Cart c : cartList)
                {
                    if (c.getId() == pid){
                        exist = true;
                        break;
                    }
                }
                if (exist)
                {
                    request.setAttribute("productExistsInCart", true);
                    request.getRequestDispatcher("home").forward(request, response);
                }
                else 
                {
                    CartDAO cdao = new CartDAO();
                    cdao.addProductToCart(acc, cart);
                    cartList.add(cart);
                    response.sendRedirect("home");
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
