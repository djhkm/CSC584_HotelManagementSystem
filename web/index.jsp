<%-- 
    Document   : index
    Created on : Jun 9, 2023, 10:42:00 AM
    Author     : hakimchi
--%>
<%@page import="com.mvc.dao.CustomerDAO"%>
<%@page import="com.mvc.bean.Customer"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        user_id = (Integer)session.getAttribute("user_id");
    }
    
%>
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
    <body>
        <div class="container-fluid text-center topNav">
            <div class="row">
                <div class="col-10">
                    logo goes here
                </div>
                <div class="col-2">
                    <%
                        if (user_id == 0) {
                    %>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">
                        LOGIN / SIGN UP
                    </button>
                    <%
                        } else {
                        CustomerDAO customerDAO = new CustomerDAO();
                        Customer customer = customerDAO.getCustomerDataUsingUserId(user_id);
                    %>
                    <div class="fs-5 mb-1 d-inline">
                        <%=customer.getCustomer_name()%>
                    </div>
                    &emsp;
                    <a type="button" class="btn btn-sm btn-secondary d-inline" href="logout.do">
                        LOG OUT
                    </a>
                    <%
                        }
                    %>
<!--                    <a href="login.jsp">
                        <button class="btn btn-primary">
                            LOGIN / SIGN UP
                        </button>
                    </a>-->
                </div>
            </div>
        </div>
        <div class="container-fluid text-center" style="background:lightgray; padding: 20px;">
            <form action="reservation.jsp" method="GET">
                <div class="row justify-content-center mb-2">
                    <div class="col-md-5">Dates</div>
                    <div class="col-md-4">Rooms & Guests</div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-2">
                        <input class="form-control"  type="date" name="dateStart"/>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        &rarr;
                    </div>
                    <div class="col-md-2 border-right">
                        <input class="form-control"  type="date" name="dateEnd"/>
                    </div>
                    <div class="col-md-1">
                        <input class="form-control" style="//width:40px" type="number" name="roomCount" value="1"/>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        Room,
                    </div>
                    <div class="col-md-1">
                        <input class="form-control" style="//width:40px" type="number" name="guestCount" value="1"/> 
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        Pax
                    </div>
                    <div class="col-md-1">
                        <button class="btn btn-secondary" type="submit">VIEW RATES</button>
                    </div>
                </div>
            </form>
        </div>
        <div style="height:400px; overflow:clip">
            <img src="./hotel-front.jpg"
                 style="width:100%;object-position: 0px -135px;"/>
        </div>
        <div class="container mt-2">
            <h3>Rooms and Suites</h3>
            <div class="row justify-content-center">
                <div class="col-2 border">
                    <img src="1-guesttwins.jpg" style="width:100%"/>
                </div>
                <div class="col-2 border offset-1">
                    <img src="2-guestking.jpg" style="width:100%"/>
                </div>
                <div class="col-2 border offset-1">
                    <img src="3-executiveking.jpg" style="width:100%"/>
                </div>
                <div class="col-2 border offset-1">
                    <img src="4-presidential.jpg" style="width:100%"/>
                </div>
            </div>
        </div>
        
        <!-- login -->
        <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <form action="LoginServlet" method="POST">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-4" id="exampleModalLabel">Welcome to HMS Hotel</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p class="fs-5">Sign in to your account</p>
                            <div class="mb-3">
                                <label for="loginUsername" class="form-label">Username</label>
                                <input type="text" name="login_username" class="form-control" id="loginUsername">
                            </div>
                            <div class="mb-3">
                                <label for="loginPassword" class="form-label">Password</label>
                                <input type="password" name="login_password" class="form-control" id="loginPassword">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Sign In</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
