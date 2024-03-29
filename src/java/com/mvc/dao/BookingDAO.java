/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Booking;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hakimchi
 */
public class BookingDAO {

    public BookingDAO() {
    }
    
    Connection conn = DBConnection.createConnection();
    
    public String addBooking(Booking booking) {
        int booking_pax = booking.getBooking_pax();
        int booking_dayofstay = booking.getBooking_dayofstay();
        String booking_checkindate = booking.getBooking_checkindate();
        String booking_checkoutdate = booking.getBooking_checkoutdate();
        double booking_totalfee = booking.getBooking_totalfee();
        int booking_customer_id = booking.getBooking_customer_id();
        int booking_room_id = booking.getBooking_room_id();
        
        String invoice_number = generateInvoiceNumber(); //Example: INV2312121
        
        LocalDate date = LocalDate.now();
        Date today_date = Date.from(date.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String booking_date = formatter.format(today_date);
        
        try {
            PreparedStatement ps;
            
            String query = "INSERT INTO BOOKING (INVOICE_NUMBER, BOOKING_DATE, BOOKING_PAX, BOOKING_DAYSOFSTAY, BOOKING_CHECKINDATE, BOOKING_CHECKOUTDATE, BOOKING_TOTALFEE, CUSTOMER_ID, ROOM_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            ps = conn.prepareStatement(query);
            ps.setString(1, invoice_number);
            ps.setString(2, booking_date);
            ps.setInt(3, booking_pax);
            ps.setInt(4, booking_dayofstay);
            ps.setString(5, booking_checkindate);
            ps.setString(6, booking_checkoutdate);
            ps.setDouble(7, booking_totalfee);
            ps.setInt(8, booking_customer_id);
            ps.setInt(9, booking_room_id);
            ps.executeUpdate();
            //conn.close();
            return invoice_number;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Add booking failed";
    }
    
    public String generateInvoiceNumber() {
        LocalDate date = LocalDate.now();
        Date today_date = Date.from(date.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
        String booking_date = formatter.format(today_date);
        int startCode = 1;
        int proceed = 1;        
        String compiledIN = "";
        
        do {
            try {
                compiledIN = "INV" + booking_date + Integer.toString(startCode);

                Statement s;
                ResultSet rs;

                String query = "SELECT INVOICE_NUMBER FROM BOOKING WHERE INVOICE_NUMBER = '" + compiledIN + "'";

                s = conn.createStatement();
                rs = s.executeQuery(query);
                
                if (rs.next()) {
                    startCode++;
                }
                else {
                    proceed = 0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } while (proceed == 1);
        return compiledIN;
    }
    
    public List<Booking> getAllBooking() {
        List<Booking> bookings = new ArrayList();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT BOOKING_ID, "
                    + "INVOICE_NUMBER, "
                    + "BOOKING_DATE, "
                    + "BOOKING_PAX, "
                    + "BOOKING_DAYSOFSTAY, "
                    + "BOOKING_CHECKINDATE, "
                    + "BOOKING_CHECKOUTDATE, "
                    + "BOOKING_TOTALFEE, "
                    + "CUSTOMER_NAME, "
                    + "ROOM_NUMBER "
                    + "FROM booking b "
                    + "INNER JOIN customer c ON c.CUSTOMER_ID = b.CUSTOMER_ID "
                    + "INNER JOIN ROOM r ON r.ROOM_ID = b.ROOM_ID ORDER BY INVOICE_NUMBER";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formatter = new SimpleDateFormat("dd / MM / yyyy");
            
            while (rs.next()) {
                int booking_id = rs.getInt("BOOKING_ID");
                String invoice_number = rs.getString("INVOICE_NUMBER");
                String booking_date = formatter.format(parser.parse(rs.getString("BOOKING_DATE")));
                int booking_pax = rs.getInt("BOOKING_PAX");
                int booking_dayofstay = rs.getInt("BOOKING_DAYSOFSTAY");
                String booking_checkindate = formatter.format(parser.parse(rs.getString("BOOKING_CHECKINDATE")));
                String booking_checkoutdate = formatter.format(parser.parse(rs.getString("BOOKING_CHECKOUTDATE")));
                double booking_totalfee = rs.getDouble("BOOKING_TOTALFEE");
                String booking_customer_name = rs.getString("CUSTOMER_NAME");
                int booking_room_number = rs.getInt("ROOM_NUMBER");
                
                Booking b = new Booking(booking_id, invoice_number, booking_date, booking_pax, booking_dayofstay, booking_checkindate, booking_checkoutdate, booking_totalfee, booking_customer_name, booking_room_number);
                bookings.add(b);
            }
            //conn.close();
            return bookings;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // using boolean to signify if query is successful or not, can change to string if u want
    public boolean deleteBooking(int bookingID){
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM booking WHERE booking_id = ?");
            ps.setInt(1, bookingID);
            ps.executeUpdate();
            ps.close();
            return true;
        } catch (SQLException ex) {
            //Logger.getLogger(BookingDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        }
        return false;
    }
    
    public List<Booking> occupiedRoomWithTodayDate(String todayDate) {
        List<Booking> bookings = new ArrayList();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT BOOKING.*, ROOM.ROOM_STATUS FROM BOOKING INNER JOIN ROOM ON BOOKING.ROOM_ID = room.ROOM_ID WHERE BOOKING_CHECKINDATE <= '" + todayDate + "' AND BOOKING_CHECKOUTDATE >= '" + todayDate + "' AND ROOM_STATUS = 'Available'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formatter = new SimpleDateFormat("dd / MM / yyyy");
            
            while (rs.next()) {
                int booking_id = rs.getInt("BOOKING_ID");
                String invoice_number = rs.getString("INVOICE_NUMBER");
                String booking_date = formatter.format(parser.parse(rs.getString("BOOKING_DATE")));
                int booking_pax = rs.getInt("BOOKING_PAX");
                int booking_dayofstay = rs.getInt("BOOKING_DAYSOFSTAY");
                String booking_checkindate = formatter.format(parser.parse(rs.getString("BOOKING_CHECKINDATE")));
                String booking_checkoutdate = parser.format(parser.parse(rs.getString("BOOKING_CHECKOUTDATE")));
                double booking_totalfee = rs.getDouble("BOOKING_TOTALFEE");
                int booking_customer_id = rs.getInt("CUSTOMER_ID");
                int booking_room_id = rs.getInt("ROOM_ID");
                String room_status = rs.getString("ROOM_STATUS");
                
                Booking b = new Booking(booking_id, invoice_number, booking_date, booking_pax, booking_dayofstay, booking_checkindate, booking_checkoutdate, booking_totalfee, booking_customer_id, booking_room_id, room_status);
                bookings.add(b);
            }
            //conn.close();
            return bookings;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Booking> getAllBookingWithCustomerId(int customer_id) {
        List<Booking> bookings = new ArrayList();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT booking.*, room.ROOM_NUMBER, roomtype.ROOM_NAME FROM booking INNER JOIN room ON booking.ROOM_ID = room.ROOM_ID INNER JOIN roomtype ON room.ROOMTYPE_ID = roomtype.ROOMTYPE_ID INNER JOIN customer ON booking.CUSTOMER_ID = customer.CUSTOMER_ID WHERE customer.CUSTOMER_ID = " + customer_id + "";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formatter = new SimpleDateFormat("dd / MM / yyyy");
            
            while (rs.next()) {
                int booking_id = rs.getInt("BOOKING_ID");
                String invoice_number = rs.getString("INVOICE_NUMBER");
                String booking_date = formatter.format(parser.parse(rs.getString("BOOKING_DATE")));
                int booking_pax = rs.getInt("BOOKING_PAX");
                int booking_dayofstay = rs.getInt("BOOKING_DAYSOFSTAY");
                String booking_checkindate = formatter.format(parser.parse(rs.getString("BOOKING_CHECKINDATE")));
                String booking_checkoutdate = formatter.format(parser.parse(rs.getString("BOOKING_CHECKOUTDATE")));
                double booking_totalfee = rs.getDouble("BOOKING_TOTALFEE");
                int booking_room_number = rs.getInt("ROOM_NUMBER");
                String booking_room_type = rs.getString("ROOM_NAME");
                
                Booking b = new Booking(booking_id, invoice_number, booking_date, booking_pax, booking_dayofstay, booking_checkindate, booking_checkoutdate, booking_totalfee, booking_room_number, booking_room_type);
                bookings.add(b);
            }
            //conn.close();
            return bookings;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
