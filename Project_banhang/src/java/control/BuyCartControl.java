/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.CartDAO;
import dao.DAO;
import dao.OrderDAO;
import dao.PaymentDAO;
import dao.ProductDAO;
import entity.Account;
import entity.Cart;
import entity.Order;
import entity.Payment;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.catalina.filters.RequestFilter;

/**
 *
 * @author Hi
 */
@WebServlet(name = "BuyCartControl", urlPatterns = {"/buyCart"})
public class BuyCartControl extends HttpServlet {

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
        try(PrintWriter out = response.getWriter()){
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart_list");
            
            Account auth = (Account) request.getSession().getAttribute("acc");
            String pid = request.getParameter("pid");
            String quantity = request.getParameter("quantity");
            if(pid != null && quantity != null && auth!=null)
            {
                PaymentDAO pdao = new PaymentDAO();
                List<Payment> listpay = pdao.getAllPayment();
                DAO dao = new DAO();
                Product p = dao.getProductByID(pid);
                request.setAttribute("pid", p);
                request.setAttribute("listpay", listpay);
                request.setAttribute("quantity", quantity);
                request.getRequestDispatcher("Order.jsp").forward(request, response);
            }
            
            if(cart_list != null && auth!=null && pid == null && quantity == null) {
                double total = Double.parseDouble(request.getParameter("total"));
                HttpSession session = request.getSession();
                session.setAttribute("total", total);
		PaymentDAO pdao = new PaymentDAO();
                List<Payment> listpay = pdao.getAllPayment();
                
                for (Cart c : cart_list)
                {
                    DAO dao = new DAO();
                    Product p = dao.getProductByID(String.valueOf(c.getId()));
                    if (c.getQuantity() > p.getSoluong())
                    {
                        request.setAttribute("Error2", true);
                        request.getRequestDispatcher("show").forward(request, response);
                    }
                }
                
                request.setAttribute("total", total);
                request.setAttribute("listpay", listpay);
		request.getRequestDispatcher("Order.jsp").forward(request, response);
            }
            else {
		if(auth==null) {
                    response.sendRedirect("Login.jsp");
                    return;
                }
		response.sendRedirect("home");
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
