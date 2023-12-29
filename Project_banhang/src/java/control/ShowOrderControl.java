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
import dao.ShipmentDAO;
import entity.Account;
import entity.Cart;
import entity.Order;
import entity.Payment;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hi
 */
@WebServlet(name = "ShowOrderControl", urlPatterns = {"/showOrder"})
public class ShowOrderControl extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try(PrintWriter out = response.getWriter()){
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart_list");
            Account auth = (Account) request.getSession().getAttribute("acc");
            int paymentMethodId = Integer.parseInt(request.getParameter("paymentMethodId"));
            String addr = request.getParameter("addr");
            String pid = request.getParameter("pid");
            String quantity = request.getParameter("quantity");
            String phone = request.getParameter("phone");
            ShipmentDAO sdao = new ShipmentDAO();
            OrderDAO odao = new OrderDAO();
            DAO dao = new DAO();
            if(pid != null && quantity != null && auth != null)
            {
                Product p = dao.getProductByID(pid);
                int idshipment = sdao.addShipment(addr, phone);
                int orderId = odao.addOrder(idshipment, paymentMethodId, auth.getId(), formatter.format(date), Integer.parseInt(quantity)*p.getPrice());
                if(orderId != 0)
                {
                    CartDAO cdao = new CartDAO();
                    cdao.addProductToCartNow(auth, Integer.parseInt(pid), Integer.parseInt(quantity), orderId);
                    int sl = cdao.numbersOfProducts(orderId, Integer.parseInt(pid), auth);
                    p.setSoluong(p.getSoluong() - sl);
                    dao.editNumberProduct(p);
                    response.sendRedirect("managerOrder");
                }
            }
                        
            else if (cart_list != null && auth!=null) {
                
                double total =  (double) request.getSession().getAttribute("total");
                int idshipment = sdao.addShipment(addr, phone);
                
                int orderId = odao.addOrder(idshipment, paymentMethodId, auth.getId(), formatter.format(date), total);
                if(orderId != 0)
                {
                    for(Cart c : cart_list)
                    {
                        CartDAO cdao = new CartDAO();
                        cdao.updateCartToOrder(auth, c, orderId);
                        int sl = cdao.numbersOfProducts(orderId, c.getId(), auth);
                        Product p = dao.getProductByID(String.valueOf(c.getId()));
                        p.setSoluong(p.getSoluong() - sl);
                        dao.editNumberProduct(p);
                    }
                    cart_list.clear();
                    response.sendRedirect("managerOrder");
                }
            }
            else {
		if(auth==null) {
                    response.sendRedirect("login.jsp");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ShowOrderControl.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ShowOrderControl.class.getName()).log(Level.SEVERE, null, ex);
        }
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
