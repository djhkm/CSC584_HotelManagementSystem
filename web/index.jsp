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
    </head>
    <body>
        <div width="100%" class="topNav">
            <div style="width:90%; display:inline-block" align="center">
                asd
            </div>
            <a href="login.jsp">
                <div class="circleButton">
                    LOGIN / SIGN UP
                </div>
            </a>
        </div>
        <div style="background:lightgray; padding: 20px; text-align:center">
            <form action="#">
                <table style="width:90%">
                    <tr>
                        <th>Dates</th>
                        <th>Rooms & Guests</th>
                    </tr>
                    <tr>
                        <td style="border-right: solid black 1px;">
                            <input type="date" name="dateStart"/> &rarr;
                            <input type="date" name="dateEnd"/>
                        </td>
                        <td>
                            <input style="width:20px" type="number" name="roomCount" value="1"/> Room,
                            <input style="width:20px" type="number" name="guestCount" value="1"/> Adult
                        </td>
                        <td rowspan="2">
                            <a href="reservation.jsp">
                                <div class="circleButton">
                                    VIEW RATES
                                </div>
                            </a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>
