/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Room;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hakimchi
 */
public class RoomDAO {

    public RoomDAO() {
    }
    
    Connection conn = DBConnection.createConnection();
    
    //for customer to check if the room is booked for a duration, get number of rooms available
    public List<Room> availableSameRoomTypeWithCheckInOutDate(String checkIn, String checkOut, int roomtype_id) { 
        List<Room> rooms = new ArrayList();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT * FROM ROOM WHERE ROOM_ID NOT IN (SELECT ROOM_ID FROM BOOKING WHERE BOOKING_CHECKINDATE <= '" + checkOut + "' AND BOOKING_CHECKOUTDATE >= '" + checkIn + "') AND ROOMTYPE_ID = '" + roomtype_id + "' AND ROOM_STATUS = 'Available'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            while (rs.next()) {
                int room_id = rs.getInt("ROOM_ID");
                int room_number = rs.getInt("ROOM_NUMBER");
                String room_status = rs.getString("ROOM_STATUS");
                int room_roomtype_id = rs.getInt("ROOMTYPE_ID");
                
                Room r = new Room(room_id, room_number, room_status, room_roomtype_id);
                rooms.add(r);
            }
            //conn.close();
            return rooms;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public List<Room> occupiedRoomWithTodayDate(String todayDate) {
        List<Room> rooms = new ArrayList();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT ROOM_ID FROM ROOM WHERE ROOM_ID IN (SELECT ROOM_ID FROM BOOKING WHERE BOOKING_CHECKINDATE <= '" + todayDate + "' AND BOOKING_CHECKOUTDATE >= '" + todayDate + "') AND ROOM_STATUS = 'Available'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            while (rs.next()) {
                int room_id = rs.getInt("ROOM_ID");
                int room_number = rs.getInt("ROOM_NUMBER");
                String room_status = rs.getString("ROOM_STATUS");
                int room_roomtype_id = rs.getInt("ROOMTYPE_ID");
                
                Room r = new Room(room_id, room_number, room_status, room_roomtype_id);
                rooms.add(r);
            }
            //conn.close();
            return rooms;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public String changeRoomStatus(String room_status, int room_id) { //for staff
        
        try {
            PreparedStatement ps;
            
            String query = "UPDATE ROOM SET ROOM_STATUS = ? WHERE ROOM_ID = ?;";
            
            ps = conn.prepareStatement(query);
            ps.setString(1, room_status);
            ps.setInt(2, room_id);
            ps.executeUpdate();
            //conn.close();
            return "Change room status success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Change room status failed";
    }
    
    public List<Room> getAllRoom() {
        List<Room> rooms = new ArrayList();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT * FROM ROOM";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            while (rs.next()) {
                int room_id = rs.getInt("ROOM_ID");
                int room_number = rs.getInt("ROOM_NUMBER");
                String room_status = rs.getString("ROOM_STATUS");
                int room_roomtype_id = rs.getInt("ROOMTYPE_ID");
                
                Room r = new Room(room_id, room_number, room_status, room_roomtype_id);
                rooms.add(r);
            }
            //conn.close();
            return rooms;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
