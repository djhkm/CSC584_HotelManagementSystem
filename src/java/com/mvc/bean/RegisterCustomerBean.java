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
public class RegisterCustomerBean {
    private String customer_honorific;
    private String customer_name;
    private String customer_email;
    private String customer_phoneNumber;
    private String customer_username;
    private String customer_password;

    public RegisterCustomerBean() {
    }

    public RegisterCustomerBean(String customer_honorific, String customer_name, String customer_email, String customer_phoneNumber, String customer_username, String customer_password) {
        this.customer_honorific = customer_honorific;
        this.customer_name = customer_name;
        this.customer_email = customer_email;
        this.customer_phoneNumber = customer_phoneNumber;
        this.customer_username = customer_username;
        this.customer_password = customer_password;
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

    public String getCustomer_username() {
        return customer_username;
    }

    public void setCustomer_username(String customer_username) {
        this.customer_username = customer_username;
    }

    public String getCustomer_password() {
        return customer_password;
    }

    public void setCustomer_password(String customer_password) {
        this.customer_password = customer_password;
    }
}
