/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.Room;
import com.mvc.dao.RoomDAO;
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
public class RoomServlet extends HttpServlet {

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
        
        Room room = new Room();
        RoomDAO dao = new RoomDAO();
        
        int roomID = (Integer.parseInt(request.getParameter("roomID")));
        room.setRoom_id(roomID);
        
        switch(request.getParameter("operation")){
            case "Save": // from editRoom.jsp, "operation" is the submit button
                room.setRoom_number(Integer.parseInt(request.getParameter("roomNumber")));
                room.setRoom_roomtype_id(Integer.parseInt(request.getParameter("roomType")));
                
                System.out.println("updating room " + dao.updateRoom(room));
                request.getRequestDispatcher("editRoom.jsp?roomID=" + room.getRoom_id()).forward(request, response);
                break;
            case "Delete": // from editRoom.jsp, "operation" is the submit button
                if(dao.deleteRoom(roomID) != -1){ // if delete success, go back to dashboard
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                }else{ // if delete failed, go back to edit page
                    request.getRequestDispatcher("editRoom.jsp?roomID=" + roomID).forward(request, response);
                }
                break;
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
