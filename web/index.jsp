<%-- 
    Document   : index
    Created on : Jun 9, 2023, 10:42:00 AM
    Author     : hakimchi
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" 
driver="org.apache.derby.jdbc.ClientDriver"
url="jdbc:derby://localhost:1527/CSC584_hotelManagementSystem" user="app" 
password="app"/>
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
 
        <style>
            .boxDiv{
                border: 1px solid;
                height: 150px;
                width: 200px;
                text-
            }
        </style>
    </head>
    <body>
        <div class="container-fluid text-center topNav">
            <div class="row">
                <div class="col-10">
                    logo goes here
                </div>
                <div class="col-2">
                    <a href="login.jsp">
                        <button class="btn btn-primary">
                            LOGIN / SIGN UP
                        </button>
                    </a>
                </div>
            </div>
        </div>
        <div class="container-fluid text-center" style="background:lightgray; padding: 20px;">
            <form action="#">
                <div class="row justify-content-center mb-2">
                    <div class="col-md-5">Dates</div>
                    <div class="col-md-4">Rooms & Guests</div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-2">
                        <input class="form-control"  type="date" name="dateStart"/>
                    </div>
                    <div class="col-md-auto">
                        &rarr;
                    </div>
                    <div class="col-md-2 border-right">
                        <input class="form-control"  type="date" name="dateEnd"/>
                    </div>
                    <div class="col-md-1">
                        <input class="form-control" style="//width:40px" type="number" name="roomCount" value="1"/>
                    </div>
                    <div class="col-md-auto">
                        Room,
                    </div>
                    <div class="col-md-1">
                        <input class="form-control" style="//width:40px" type="number" name="guestCount" value="1"/> 
                    </div>
                    <div class="col-md-auto">
                        Pax
                    </div>
                    <div class="col-md-1">
                        <a href="reservation.jsp">
                            <div class="btn btn-secondary">
                                VIEW RATES
                            </div>
                        </a>
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
    </body>
</html>
