/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.CustomerBean;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author hakimchi
 */
public class CustomerDAO {
    
    Connection conn = DBConnection.createConnection();
    
    // add new customer data
    public String registerCustomerData (CustomerBean customer) {
        String customer_honorific = customer.getCustomer_honorific();
        String customer_name = customer.getCustomer_name();
        String customer_email = customer.getCustomer_email();
        String customer_phoneNumber = customer.getCustomer_phoneNumber();
        int customer_user_id = customer.getCustomer_user_id();
        
        try {
            Statement s;
            PreparedStatement ps;
            ResultSet rs;
            
            String query = "INSERT INTO CUSTOMER (CUSTOMER_HONORIFIC, CUSTOMER_NAME, CUSTOMER_EMAIL, CUSTOMER_PHONENUMBER, USER_ID) VALUES (?, ?, ?, ?, ?)";
            
            ps = conn.prepareStatement(query);
            ps.setString(1, customer_honorific);
            ps.setString(2, customer_name);
            ps.setString(3, customer_email);
            ps.setString(4, customer_phoneNumber);
            ps.setInt(5, customer_user_id);
            ps.executeUpdate();
            //conn.close();
            return "Registration success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Registration failed";
    }
    
    public CustomerBean getCustomerDataUsingUserId (int user_id){
        
        try {
            Statement s;
            PreparedStatement ps;
            ResultSet rs;
            
            String query = "SELECT * FROM CUSTOMER WHERE USER_ID = '" + user_id + "'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            if (rs.next()) {
                CustomerBean customer = new CustomerBean(rs.getInt("CUSTOMER_ID"), rs.getString("CUSTOMER_HONORIFIC"), rs.getString("CUSTOMER_NAME"), rs.getString("CUSTOMER_EMAIL"), rs.getString("CUSTOMER_PHONENUMBER"), rs.getInt("USER_ID"));
                //conn.close();
                return customer;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
