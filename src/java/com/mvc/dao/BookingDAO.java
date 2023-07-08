/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Booking;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author haziq
 */
public class BookingDAO {
    Connection conn = DBConnection.createConnection();
    
    public void saveBooking(Booking booking){
        try {
            PreparedStatement ps;
            
            String query = "INSERT INTO booking(INVOICE_NUMBER, "
                                                + "BOOKING_DATE, "
                                                + "BOOKING_PAX, "
                                                + "BOOKING_DAYSOFSTAY, "
                                                + "BOOKING_CHECKINDATE, "
                                                + "BOOKING_CHECKOUTDATE, "
                                                + "BOOKING_TOTALFEE, "
                                                + "CUSTOMER_ID, "
                                                + "ROOM_ID) "
                                                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, booking.getInvoice_number());
            ps.setString(2, booking.getBooking_date());
            ps.setInt(3, booking.getBooking_pax());
            ps.setInt(4, booking.getBooking_dayofstay());
            ps.setString(5, booking.getBooking_checkindate());
            ps.setString(6, booking.getBooking_checkoutdate());
            ps.setDouble(7, booking.getBooking_totalfee());
            ps.setInt(8, booking.getBooking_customer_id());
            ps.setInt(9, booking.getBooking_room_id());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Booking getBooking(int bookingID){
        try {
            Statement s;
            ResultSet rs;
            
            s = conn.createStatement();
            rs = s.executeQuery("SELECT * FROM booking WHERE BOOKING_ID = " + bookingID);
            
            if(rs.next()){
                return new Booking(
                        rs.getInt("BOOKING_ID"),
                        rs.getString("INVOICE_NUMBER"),
                        rs.getString("BOOKING_DATE"),
                        rs.getInt("BOOKING_PAX"),
                        rs.getInt("BOOKING_DAYSOFSTAY"),
                        rs.getString("BOOKING_CHECKINDATE"),
                        rs.getString("BOOKING_CHECKOUTDATE"),
                        rs.getDouble("BOOKING_TOTALFEE"),
                        rs.getInt("CUSTOMER_ID"),
                        rs.getInt("ROOM_ID")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<Booking> getAllBooking(){
        ArrayList<Booking> array = new ArrayList();
        try {
            Statement s;
            ResultSet rs;
            
            s = conn.createStatement();
            rs = s.executeQuery("SELECT * FROM booking");
            
            while(rs.next()){
                Booking booking =  new Booking(
                        rs.getInt("BOOKING_ID"),
                        rs.getString("INVOICE_NUMBER"),
                        rs.getString("BOOKING_DATE"),
                        rs.getInt("BOOKING_PAX"),
                        rs.getInt("BOOKING_DAYSOFSTAY"),
                        rs.getString("BOOKING_CHECKINDATE"),
                        rs.getString("BOOKING_CHECKOUTDATE"),
                        rs.getDouble("BOOKING_TOTALFEE"),
                        rs.getInt("CUSTOMER_ID"),
                        rs.getInt("ROOM_ID")
                );
                array.add(booking);
            }
            return array;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
