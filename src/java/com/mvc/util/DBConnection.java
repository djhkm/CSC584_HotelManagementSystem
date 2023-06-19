/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hakimchi
 */
public class DBConnection {
    
    public static Connection createConnection() {
        Connection conn = null;
        
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/csc584_hms";
        String dbUser = "root";
        String dbPassword = "";
        
//        String driver = "org.apache.derby.jdbc.ClientDriver";
//        String url = "jdbc:derby://localhost:1527/CSC584_hotelManagementSystem";
//        String dbUser = "app", dbPassword = "app";
        
        try {
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return conn;
    }
    
}
