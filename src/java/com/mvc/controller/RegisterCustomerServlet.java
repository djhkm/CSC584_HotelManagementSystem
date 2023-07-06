/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.Customer;
import com.mvc.bean.Users;
import com.mvc.dao.CustomerDAO;
import com.mvc.dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hakimchi
 */
public class RegisterCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        
        // get form data
        String customer_honorific = request.getParameter("customer_honorific");
        String customer_name = request.getParameter("customer_name");
        String customer_email = request.getParameter("customer_email");
        String customer_phoneNumber = request.getParameter("customer_phoneNumber");
        String customer_username = request.getParameter("customer_username");
        String customer_password = request.getParameter("customer_password");
        
        // initialize
        Customer customer = new Customer();
        Users users = new Users();
        
        CustomerDAO customerDAO = new CustomerDAO();
        UsersDAO userDAO = new UsersDAO();
        
        // check if theres existing username
        String statusA = userDAO.findExistingUsername(customer_username);
        if (statusA.equals("Username already taken")) {
            request.setAttribute("errMessage", "Registration failed, "+statusA);
            request.getRequestDispatcher("register-customer.jsp").forward(request, response);
        }
        else {
            // add new user data
            users.setUsername(customer_username);
            users.setPassword(customer_password);
            users.setUser_type(2);
            String statusB = userDAO.addUser(users);
            if (statusB.equals("Add user success")) {
                int user_id = userDAO.findUserId(customer_username);

                // add new customer data
                customer.setCustomer_honorific(customer_honorific);
                customer.setCustomer_name(customer_name);
                customer.setCustomer_email(customer_email);
                customer.setCustomer_phoneNumber(customer_phoneNumber);
                customer.setCustomer_user_id(user_id);
                String statusC = customerDAO.registerCustomerData(customer);
                if (statusC.equals("Registration success")) {
                    request.setAttribute("successMessage", statusC);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                else {
                    request.setAttribute("errMessage", statusC);
                    request.getRequestDispatcher("register-customer.jsp").forward(request, response);
                }
            }
            else {
                request.setAttribute("errMessage", statusB);
                request.getRequestDispatcher("register-customer.jsp").forward(request, response);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "For customer registration form";
    }// </editor-fold>
}
