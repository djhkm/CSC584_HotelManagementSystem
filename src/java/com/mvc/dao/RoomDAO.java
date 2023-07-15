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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author hakimchi
 */
public class RoomDAO {

    public RoomDAO() {
    }
    
    Connection conn = DBConnection.createConnection();
    
    public Room getRoom(int roomid) {
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement("SELECT room_number, room_status, roomtype_id FROM room WHERE room_id = ?");
            ps.setInt(1, roomid);
            ResultSet rs = ps.executeQuery();
            rs.next();
            return new Room(
                    roomid,
                    rs.getInt("room_number"),
                    rs.getString("room_status"),
                    rs.getInt("roomtype_id"));
        } catch (SQLException ex) {
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
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
            
            String query = "SELECT * FROM ROOM ORDER BY room_number ASC";
            
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
    
    public int updateRoom(Room room) {
        List<Room> rooms = getAllRoom();
        
        try {
            int takenFlag = 0;
            
            for (Room value : rooms) {
                int checkRoomNumber = value.getRoom_number();
                if (checkRoomNumber == room.getRoom_number()) {
                    takenFlag = 1;
                }
            }
            
            if (takenFlag == 0) {
                PreparedStatement ps = conn.prepareStatement("UPDATE room SET room_number = ?, roomtype_id = ? WHERE room_id = ?");
                ps.setInt(1, room.getRoom_number());
                ps.setInt(2, room.getRoom_roomtype_id());
                ps.setInt(3, room.getRoom_id());
                return ps.executeUpdate();
            } else {
                return -2;
            }            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int deleteRoom(int roomid) {
        
        try {            
            PreparedStatement ps = conn.prepareStatement("DELETE FROM room WHERE room_id = ?");
            ps.setInt(1, roomid);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return -1;
    }
    
    public String addRoom(int roomNumber, int roomType) {
        List<Room> rooms = getAllRoom();
        
        try {
            int takenFlag = 0;
            
            for (Room room : rooms) {
                int checkRoomNumber = room.getRoom_number();
                if (checkRoomNumber == roomNumber) {
                    takenFlag = 1;
                }
            }
            
            if (takenFlag == 0) {
                PreparedStatement ps;
            
                String query = "INSERT INTO ROOM (ROOM_NUMBER, ROOM_STATUS, ROOMTYPE_ID) VALUES (?, 'Available', ?)";

                ps = conn.prepareStatement(query);
                ps.setInt(1, roomNumber);
                ps.setInt(2, roomType);
                ps.executeUpdate();
                //conn.close();
                return "Add room success";
            }
            else {
                return "Room number taken";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Add room failed";
    }
}
