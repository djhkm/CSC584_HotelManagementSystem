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
public class Booking {
    private int booking_id;
    private String invoice_number;
    private String booking_date;
    private int booking_pax;
    private int booking_dayofstay;
    private String booking_checkindate;
    private String booking_checkoutdate;
    private double booking_totalfee;
    private int booking_customer_id;
    private int booking_room_id;

    public Booking() {
    }

    public Booking(int booking_id, String invoice_number, String booking_date, int booking_pax, int booking_dayofstay, String booking_checkindate, String booking_checkoutdate, double booking_totalfee, int booking_customer_id, int booking_room_id) {
        this.booking_id = booking_id;
        this.invoice_number = invoice_number;
        this.booking_date = booking_date;
        this.booking_pax = booking_pax;
        this.booking_dayofstay = booking_dayofstay;
        this.booking_checkindate = booking_checkindate;
        this.booking_checkoutdate = booking_checkoutdate;
        this.booking_totalfee = booking_totalfee;
        this.booking_customer_id = booking_customer_id;
        this.booking_room_id = booking_room_id;
    }

    public int getBooking_id() {
        return booking_id;
    }

    public void setBooking_id(int booking_id) {
        this.booking_id = booking_id;
    }

    public String getInvoice_number() {
        return invoice_number;
    }

    public void setInvoice_number(String invoice_number) {
        this.invoice_number = invoice_number;
    }

    public String getBooking_date() {
        return booking_date;
    }

    public void setBooking_date(String booking_date) {
        this.booking_date = booking_date;
    }

    public int getBooking_pax() {
        return booking_pax;
    }

    public void setBooking_pax(int booking_pax) {
        this.booking_pax = booking_pax;
    }

    public int getBooking_dayofstay() {
        return booking_dayofstay;
    }

    public void setBooking_dayofstay(int booking_dayofstay) {
        this.booking_dayofstay = booking_dayofstay;
    }

    public String getBooking_checkindate() {
        return booking_checkindate;
    }

    public void setBooking_checkindate(String booking_checkindate) {
        this.booking_checkindate = booking_checkindate;
    }

    public String getBooking_checkoutdate() {
        return booking_checkoutdate;
    }

    public void setBooking_checkoutdate(String booking_checkoutdate) {
        this.booking_checkoutdate = booking_checkoutdate;
    }

    public double getBooking_totalfee() {
        return booking_totalfee;
    }

    public void setBooking_totalfee(double booking_totalfee) {
        this.booking_totalfee = booking_totalfee;
    }

    public int getBooking_customer_id() {
        return booking_customer_id;
    }

    public void setBooking_customer_id(int booking_customer_id) {
        this.booking_customer_id = booking_customer_id;
    }

    public int getBooking_room_id() {
        return booking_room_id;
    }

    public void setBooking_room_id(int booking_room_id) {
        this.booking_room_id = booking_room_id;
    }
}
