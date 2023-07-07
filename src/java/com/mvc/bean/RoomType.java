/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

/**
 *
 * @author hakimchi
 */
public class RoomType {
    private int roomtype_id;
    private String room_name;
    private String room_description;
    private int room_maxpax;
    private int room_extrabedcount;
    private double room_price;

    public RoomType() {
    }

    public RoomType(int roomtype_id, String room_name, String room_description, int room_maxpax, int room_extrabedcount, double room_price) {
        this.roomtype_id = roomtype_id;
        this.room_name = room_name;
        this.room_description = room_description;
        this.room_maxpax = room_maxpax;
        this.room_extrabedcount = room_extrabedcount;
        this.room_price = room_price;
    }

    public int getRoomtype_id() {
        return roomtype_id;
    }

    public void setRoomtype_id(int roomtype_id) {
        this.roomtype_id = roomtype_id;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getRoom_description() {
        return room_description;
    }

    public void setRoom_description(String room_description) {
        this.room_description = room_description;
    }

    public int getRoom_maxpax() {
        return room_maxpax;
    }

    public void setRoom_maxpax(int room_maxpax) {
        this.room_maxpax = room_maxpax;
    }

    public int getRoom_extrabedcount() {
        return room_extrabedcount;
    }

    public void setRoom_extrabedcount(int room_extrabedcount) {
        this.room_extrabedcount = room_extrabedcount;
    }

    public double getRoom_price() {
        return room_price;
    }

    public void setRoom_price(double room_price) {
        this.room_price = room_price;
    }
}
