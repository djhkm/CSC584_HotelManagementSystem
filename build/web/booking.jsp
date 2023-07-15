<%-- 
    Document   : booking
    Created on : Jul 14, 2023, 6:45:04 PM
    Author     : hakimchi
--%>
<%@include file="checkSession.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.dao.CustomerDAO"%>
<%@page import="com.mvc.bean.Customer"%>
<%@page import="com.mvc.bean.Users"%>
<%@page import="com.mvc.dao.BookingDAO"%>
<%@page import="com.mvc.bean.Booking"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Booking</title>
        <link rel="stylesheet" href="./style.css"/>
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </head>
    
    <body class="bg-body-secondary">
        <c:import url="topNav.jsp"/>
        <div class="container mt-3">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="mb-3">Reserved Room(s)</h3>
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr class="table-secondary">
                                        <th>Invoice Number</th>
                                        <th>Room No</th>
                                        <th>Room Type</th>
                                        <th>Guest(s)</th>
                                        <th>Check In</th>
                                        <th>Check Out</th>
                                        <th>Total Fee</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%  
                                        Customer c = new Customer();
                                        CustomerDAO cdao = new CustomerDAO();
                                        
                                        c = cdao.getCustomerDataUsingUserId(((Users)session.getAttribute("user")).getUser_id());
                                        
                                        List<Booking> b = new ArrayList();
                                        BookingDAO bdao = new BookingDAO();
                                        b = bdao.getAllBookingWithCustomerId(c.getCustomer_id());
                                        
                                        if (b != null) {
                                            for (Booking value : b) {
                                        %>
                                        <tr>
                                            <td><%= value.getInvoice_number() %></td>
                                            <td><%= value.getRoomNumber()%></td>
                                            <td><%= value.getRoomType()%></td>
                                            <td><%= value.getBooking_pax()%></td>
                                            <td><%= value.getBooking_checkindate()%></td>
                                            <td><%= value.getBooking_checkoutdate()%></td>
                                            <td><%= (int)value.getBooking_totalfee()%></td>
                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>
                                        <tr>
                                            <td colspan="7" class="text-center">No reservation data.</td>
                                        </tr>
                                        <%
                                        }   
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </body>
</html>