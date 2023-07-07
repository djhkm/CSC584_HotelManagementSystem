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
public class Room {
    private int room_id;
    private int room_number;
    private String room_status;
    private int room_roomtype_id;

    public Room() {
    }

    public Room(int room_id, int room_number, String room_status, int room_roomtype_id) {
        this.room_id = room_id;
        this.room_number = room_number;
        this.room_status = room_status;
        this.room_roomtype_id = room_roomtype_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getRoom_number() {
        return room_number;
    }

    public void setRoom_number(int room_number) {
        this.room_number = room_number;
    }

    public String getRoom_status() {
        return room_status;
    }

    public void setRoom_status(String room_status) {
        this.room_status = room_status;
    }

    public int getRoom_roomtype_id() {
        return room_roomtype_id;
    }

    public void setRoom_roomtype_id(int room_roomtype_id) {
        this.room_roomtype_id = room_roomtype_id;
    }
}
