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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        Room room = new Room();
        RoomDAO dao = new RoomDAO();
        
        int roomID = 0;
        int roomNumber = 0;
        int roomType = 0;
        
        switch(request.getParameter("operation")){
            case "Save": // from editRoom.jsp, "operation" is the submit button
                roomID = (Integer.parseInt(request.getParameter("roomID")));
                room.setRoom_id(roomID);
        
                room.setRoom_number(Integer.parseInt(request.getParameter("roomNumber")));
                room.setRoom_roomtype_id(Integer.parseInt(request.getParameter("roomType")));
                
                //System.out.println("updating room " + dao.updateRoom(room));
                int statusB = dao.updateRoom(room);
                if (statusB == -1) { // if edit failed, go back to edit page
                    request.getRequestDispatcher("editRoom.jsp?roomID=" + roomID).forward(request, response);
                } else if (statusB == -2) { // if room number is same as existed
                    request.setAttribute("errMessage", "Room number taken");
                    request.getRequestDispatcher("editRoom.jsp?roomID=" + roomID).forward(request, response);
                } else { // if edit success, go back to dashboard
                    request.setAttribute("goHREF", roomID);
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                }
                break;
            case "Delete": // from editRoom.jsp, "operation" is the submit button
                roomID = (Integer.parseInt(request.getParameter("roomID")));
                room.setRoom_id(roomID);
                
                if (dao.deleteRoom(roomID) != -1) { // if delete success, go back to dashboard
                    request.getRequestDispatcher("dashboard.jsp").forward(request, response);
                } else { // if delete failed, go back to edit page
                    request.getRequestDispatcher("editRoom.jsp?roomID=" + roomID).forward(request, response);
                }
                break;
            case "AddRoom":
                roomNumber = Integer.parseInt(request.getParameter("room_number"));
                roomType = Integer.parseInt(request.getParameter("room_type"));
                
                String statusA = dao.addRoom(roomNumber, roomType);
                if (statusA.equals("Room number taken")) {
                    request.setAttribute("errMessage", statusA);
                } else if (statusA.equals("Add room failed")) {
                    request.setAttribute("errMessage", statusA);
                } else {
                    request.setAttribute("goHREF", roomID);
                }
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
