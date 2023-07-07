/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author hakimchi
 */
public class RoomDAO {

    public RoomDAO() {
    }
    
    Connection conn = DBConnection.createConnection();
    
    public int availableSameTypeRoom(int roomtype_id) { //this is wrong
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT COUNT(ROOM_ID) AS TOTAL FROM ROOM WHERE ROOMTYPE_ID = '" + roomtype_id + "' AND ROOM_STATUS = 'Available'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            if (rs.next()) {
                int numberOfAvailableRoom = rs.getInt("TOTAL");
                //conn.close();
                return numberOfAvailableRoom;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public void checkAvailableRoomWithCheckInOutDate() {
        
    }
    
    public void changeRoomStatus() {
        
    }
}
