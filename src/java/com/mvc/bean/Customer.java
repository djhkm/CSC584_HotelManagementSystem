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
public class Customer {
    private int customer_id;
    private String customer_honorific;
    private String customer_name;
    private String customer_email;
    private String customer_phoneNumber;
    private int customer_user_id;

    public Customer() {
    }

    public Customer(int customer_id, String customer_honorific, String customer_name, String customer_email, String customer_phoneNumber, int customer_user_id) {
        this.customer_id = customer_id;
        this.customer_honorific = customer_honorific;
        this.customer_name = customer_name;
        this.customer_email = customer_email;
        this.customer_phoneNumber = customer_phoneNumber;
        this.customer_user_id = customer_user_id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }
    
    public String getCustomer_honorific() {
        return customer_honorific;
    }

    public void setCustomer_honorific(String customer_honorific) {
        this.customer_honorific = customer_honorific;
    }

    public String getCustomer_name() {
        return customer_name;
    }

    public void setCustomer_name(String customer_name) {
        this.customer_name = customer_name;
    }

    public String getCustomer_email() {
        return customer_email;
    }

    public void setCustomer_email(String customer_email) {
        this.customer_email = customer_email;
    }

    public String getCustomer_phoneNumber() {
        return customer_phoneNumber;
    }

    public void setCustomer_phoneNumber(String customer_phoneNumber) {
        this.customer_phoneNumber = customer_phoneNumber;
    }
    
    public int getCustomer_user_id() {
        return customer_user_id;
    }

    public void setCustomer_user_id(int customer_user_id) {
        this.customer_user_id = customer_user_id;
    }
}
