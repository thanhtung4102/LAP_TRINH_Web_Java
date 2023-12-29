/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hi
 */
@WebServlet(name = "quantityProductCart", urlPatterns = {"/quantity"})
public class quantityProductCart extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) 
        {
            String action = request.getParameter("action");
            int id = Integer.parseInt(request.getParameter("pid"));
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart_list");

            if (action != null && id >= 1) {
		if (action.equals("inc")) {
                    for (Cart c : cart_list) {
			if (c.getId() == id) {
                            DAO dao = new DAO();
                            Product p = dao.getProductByID(String.valueOf(id));
                            double price = c.getPrice()/c.getQuantity();
                            int quantity = c.getQuantity();
                            quantity++;
                            if (p.getSoluong() < quantity)
                            {
                                request.setAttribute("hethang", true);
                            }
                            else
                            {
                                c.setQuantity(quantity);
                                c.setPrice(price*quantity);
                            }
                            }
			}
		}

		if (action.equals("dec")) {
                    for (Cart c : cart_list) {
			if (c.getId() == id && c.getQuantity() > 1) {
                            double price = c.getPrice()/c.getQuantity();
                            int quantity = c.getQuantity();
                            quantity--;
                            c.setQuantity(quantity);
                            c.setPrice(price*quantity);
                            break;
                            }
                        }
                    
		}
//                request.setAttribute("list", cart_list);
                request.getRequestDispatcher("show").forward(request, response);
		} 
            else {
		response.sendRedirect("show");
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
