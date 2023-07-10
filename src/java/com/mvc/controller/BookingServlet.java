/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.Booking;
import com.mvc.dao.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hakimchi
 */
public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

        //get what type of operation
        String operation = request.getParameter("operation");
        
        if (operation.equals("C")) {
            //get form data
            int booking_pax = Integer.valueOf(request.getParameter("booking_pax"));
            int booking_dayofstay = Integer.valueOf(request.getParameter("booking_dayofstay"));
            String booking_checkindate = request.getParameter("booking_checkindate");
            String booking_checkoutdate = request.getParameter("booking_checkoutdate");
            Double booking_totalfee = Double.parseDouble(request.getParameter("booking_totalfee"));
            int booking_customer_id = Integer.valueOf(request.getParameter("booking_customer_id"));
            int booking_room_id_1 = Integer.valueOf(request.getParameter("booking_room_id_1"));
            int booking_room_id_2 = Integer.valueOf(request.getParameter("booking_room_id_2"));
            int booking_room_id_3 = Integer.valueOf(request.getParameter("booking_room_id_3"));
            List<Integer> booking_room_id_list = new ArrayList();
            
            if (booking_room_id_1 != 0) { booking_room_id_list.add(booking_room_id_1); }
            if (booking_room_id_2 != 0) { booking_room_id_list.add(booking_room_id_2); }
            if (booking_room_id_3 != 0) { booking_room_id_list.add(booking_room_id_3); }
            
            int successA = 0;
            String invoiceNumber = "";
            
            //initialize
            Booking b = new Booking();
            BookingDAO bdao = new BookingDAO();
            
            b.setBooking_pax(booking_pax);
            b.setBooking_dayofstay(booking_dayofstay);
            b.setBooking_checkindate(booking_checkindate);
            b.setBooking_checkoutdate(booking_checkoutdate);
            b.setBooking_totalfee(booking_totalfee);
            b.setBooking_customer_id(booking_customer_id);
            
            for (int i = 1; i <= booking_room_id_list.size(); i++) {
                b.setBooking_room_id(booking_room_id_list.get(i - 1));
                String statusA = bdao.addBooking(b);
                System.out.println(statusA);
                if (!statusA.equals("Add booking failed")) {
                    successA++;
                    invoiceNumber = invoiceNumber.concat(statusA);
                    if (i != booking_room_id_list.size()) {
                        invoiceNumber = invoiceNumber.concat(" & ");
                    }
                }
            }
            
            if (successA == booking_room_id_list.size()) {
                request.setAttribute("successMessageBooking", invoiceNumber);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            else {
                request.setAttribute("errMessageFromPage", "An error has occurred, Please try again");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }
    
    @Override
    public String getServletInfo() {
        return "Booking CRUD";
    }// </editor-fold>

}
