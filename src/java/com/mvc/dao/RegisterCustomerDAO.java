/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.RegisterCustomerBean;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author hakimchi
 */
public class RegisterCustomerDAO {
    
    public String registerCustomerData (RegisterCustomerBean registerCustomer) {
        String customer_honorific = registerCustomer.getCustomer_honorific();
        String customer_name = registerCustomer.getCustomer_name();
        String customer_email = registerCustomer.getCustomer_email();
        String customer_phoneNumber = registerCustomer.getCustomer_phoneNumber();
        String customer_username = registerCustomer.getCustomer_username();
        String customer_password = registerCustomer.getCustomer_password();
        
        Connection conn = DBConnection.createConnection();
        
        try {
            Statement sCheckUsername;
            PreparedStatement psCheckUsername;
            ResultSet rsCheckUsername;
            
            // check existing customer username (used Statement)
            String queryCheckUsername = "SELECT USERNAME FROM USERS WHERE USERNAME = '" + customer_username + "'";
            
            sCheckUsername = conn.createStatement();
            rsCheckUsername = sCheckUsername.executeQuery(queryCheckUsername);

            if (rsCheckUsername.next()) {
                return "Registration failed, username already taken";
            }
            else {
                return "Registration success";
            }

//            String queryCheckUsername = "SELECT USERNAME FROM USERS WHERE USERNAME = '?'";
//            
//            psCheckUsername = conn.prepareStatement(queryCheckUsername);
//            psCheckUsername.setString(1, customer_username);
//            
//            rsCheckUsername = psCheckUsername.executeQuery();
//            int n = rsCheckUsername.getRow();
//
//            if (n > 0) {
//                return "Registration failed, username already taken";
//            }
//            else {
//                return "Registration success";
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return "Registration failed";
    }
}
