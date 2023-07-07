/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.bean.Customer;
import com.mvc.bean.Users;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author hakimchi
 */
public class UsersDAO {

    public UsersDAO() {
    }
    
    Connection conn = DBConnection.createConnection();
    
    // find existing username
    public String findExistingUsername (String username) {
        
        try {            
            Statement s;
            ResultSet rs;
            
            String query = "SELECT USERNAME FROM USERS WHERE USERNAME = '" + username + "'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            if (rs.next()) {
                //conn.close();
                return "Username already taken";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Username available";
    }
    
    // find user id
    public int findUserId (String username) {
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT USER_ID FROM USERS WHERE USERNAME = '" + username + "'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            if (rs.next()) {
                int user_id = rs.getInt("USER_ID");
                //conn.close();
                return user_id;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    // add new user data
    public String addUser (Users users) {
        String username = users.getUsername();
        String password = users.getPassword();
        int user_type = users.getUser_type();
        
        try {
            PreparedStatement ps;
            
            String query = "INSERT INTO USERS (USERNAME, USER_PASSWORD, USER_TYPE) VALUES (?, ?, ?)";
            
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, user_type);
            ps.executeUpdate();
            //conn.close();
            return "Add user success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Add user failed";
    }
    
    // validate username and password
    public String authenticateUser(Users users) {
        String username = users.getUsername();
        String password = users.getPassword();
        
        try {
            Statement s;
            ResultSet rs;
            
            String query = "SELECT * FROM USERS WHERE USERNAME = '" + username + "' AND USER_PASSWORD = '" + password + "'";
            
            s = conn.createStatement();
            rs = s.executeQuery(query);
            
            if (rs.next()) {
                String user_type = Integer.toString(rs.getInt("USER_TYPE"));
                //conn.close();
                return user_type;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "Authentication failed";
    }
}
