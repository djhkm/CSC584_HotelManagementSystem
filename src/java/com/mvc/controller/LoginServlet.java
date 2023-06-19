/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.CustomerBean;
import com.mvc.bean.UsersBean;
import com.mvc.dao.CustomerDAO;
import com.mvc.dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hakimchi
 */
public class LoginServlet extends HttpServlet {
    
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
        String username = request.getParameter("login_username");
        String password = request.getParameter("login_password");
        
        // initialize
        CustomerBean customer = new CustomerBean();
        UsersBean users = new UsersBean();
        
        CustomerDAO customerDAO = new CustomerDAO();
        UsersDAO userDAO = new UsersDAO();
        
        // validate username and password
        users.setUsername(username);
        users.setPassword(password);
        String statusA = userDAO.authenticateUser(users);
        if (statusA.equals("Authentication success")) {
            int user_id = userDAO.findUserId(username);
//            customer = customerDAO.getCustomerDataUsingUserId(user_id);
            HttpSession session = request.getSession();
            session.setAttribute("user_id",user_id);
            request.setAttribute("successMessage", statusA);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        else {
            request.setAttribute("errMessage", statusA);
            request.getRequestDispatcher("register-customer.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "For all users login form";
    }// </editor-fold>

}
