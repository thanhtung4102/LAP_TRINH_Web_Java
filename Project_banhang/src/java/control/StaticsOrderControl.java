/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.AccountDAO;
import dao.DAO;
import dao.OrderDAO;
import entity.Account;
import entity.Order;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "StaticsOrderControl", urlPatterns = {"/statics"})
public class StaticsOrderControl extends HttpServlet {

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
//        HttpSession session = request.getSession();
//        session.invalidate();
        DAO dao = new DAO();
        AccountDAO adao = new AccountDAO();
        
        List<Account> listacc = adao.getAllAccountUser();
        List<Product> listp = dao.getAllProduct();

        request.setAttribute("listacc", listacc);
        request.setAttribute("listp", listp);
        if(Integer.parseInt(request.getParameter("act")) == 1){
            OrderDAO odao = new OrderDAO();
           
            List<Order> orders = odao.getCustomerBuying();
            List<Account> accounts = new ArrayList<>();
            for (Order i : orders)
            {
                accounts.add(adao.getAccountByID(i.getAccId()));
            }
            request.setAttribute("orders", orders);
            request.setAttribute("accounts", accounts);
            request.getRequestDispatcher("ManagerStatics.jsp").forward(request, response);
        }
        else if (Integer.parseInt(request.getParameter("act")) == 2)
        {
            OrderDAO odao = new OrderDAO();
           
            List<Product> product = odao.getProductBuying();
            request.setAttribute("product", product);
            request.getRequestDispatcher("ManagerStatics.jsp").forward(request, response);
        }
        else if (Integer.parseInt(request.getParameter("act")) == 3)
        {
            request.setAttribute("listacc1", listacc);
            request.getRequestDispatcher("ManagerStatics.jsp").forward(request, response);
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
