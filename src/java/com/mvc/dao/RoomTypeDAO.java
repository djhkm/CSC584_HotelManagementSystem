/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.RoomType;
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
public class RoomTypeDAO {

    public RoomTypeDAO() {
    }
    
    Connection conn = DBConnection.createConnection();
    
    public List<RoomType> getAllRoomType() {
        List<RoomType> roomTypes = new ArrayList<>();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT * FROM ROOMTYPE";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            while (rs.next()) {
                int roomtype_id = rs.getInt("ROOMTYPE_ID");
                String room_name = rs.getString("ROOM_NAME");
                String room_description = rs.getString("ROOM_DESCRIPTION");
                int room_maxpax = rs.getInt("ROOM_MAXPAX");
                int room_extrabedcount = rs.getInt("ROOM_EXTRABEDCOUNT");
                double room_price = rs.getDouble("ROOM_PRICE");
                
                RoomType rt = new RoomType(roomtype_id, room_name, room_description, room_maxpax, room_extrabedcount, room_price);
                roomTypes.add(rt);
            }
            //conn.close();
            return roomTypes;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public RoomType getRoomType(int roomtype_id) {
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT * FROM ROOMTYPE WHERE ROOMTYPE_ID = '" + roomtype_id + "'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            if (rs.next()) {
                String room_name = rs.getString("ROOM_NAME");
                String room_description = rs.getString("ROOM_DESCRIPTION");
                int room_maxpax = rs.getInt("ROOM_MAXPAX");
                int room_extrabedcount = rs.getInt("ROOM_EXTRABEDCOUNT");
                double room_price = rs.getDouble("ROOM_PRICE");
                
                RoomType rt = new RoomType(roomtype_id, room_name, room_description, room_maxpax, room_extrabedcount, room_price);
                //conn.close();
                return rt;
            }
        } catch (Exception e) {
            
        }
        return null;
    }
    
    public int updateRoomType(RoomType bean){
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE roomtype SET room_name = ?, room_description = ?, room_maxpax = ?, room_extrabedcount = ?, room_price = ? WHERE roomtype_id = ?");
            ps.setString(1, bean.getRoom_name());
            ps.setString(2, bean.getRoom_description());
            ps.setInt(3, bean.getRoom_maxpax());
            ps.setInt(4, bean.getRoom_extrabedcount());
            ps.setDouble(5, bean.getRoom_price());
            ps.setInt(6, bean.getRoomtype_id());
            
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return -1;
    }
}
