/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.RoomType;
import com.mvc.dao.RoomTypeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author haziq
 */
public class RoomTypeServlet extends HttpServlet {

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
        
        // assume that operation is updating because that's the only operation allowed
        int id = Integer.parseInt(request.getParameter("rtID"));
        String name = request.getParameter("rtName");
        String desc = request.getParameter("rtDesc");
        int maxPax = Integer.parseInt(request.getParameter("rtMaxPax"));
        int extraBeds = Integer.parseInt(request.getParameter("rtExtraBeds"));
        double price = Double.parseDouble(request.getParameter("rtPrice"));
        
        RoomType roomType = new RoomType(id, name, desc, maxPax, extraBeds, price);
        RoomTypeDAO dao = new RoomTypeDAO();
        
        int result = dao.updateRoomType(roomType);
        if(result != -1){ // if successful
            request.setAttribute("successMessage", "Update successful.");
        }else if(result == -1){
            request.setAttribute("errorMessage", "Update failed.");
        }
        
        request.getRequestDispatcher("updateRoomType.jsp").forward(request, response);
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
