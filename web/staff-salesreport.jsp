<%-- 
    Document   : staff-salesreport
    Created on : Jul 8, 2023, 10:47:31 AM
    Author     : haziq
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS Hotel | Sales Report</title>
        <!-- jQuery import -->
        <link rel="stylesheet" href="./style.css"/>
        <script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:import url="topNav.jsp"/>
        <div class="container-fluid p-4">
            <p><a class="link-secondary" href="dashboard.jsp">Room & Suite Status</a> | <a class="link-secondary" href="./SalesReport"><b>Sales Report</b></a></p>
            <table class="table table-striped table-hover text-center table-bordered">
                <tr class="table-primary">
                    <th>Invoice No</th>
                    <th>Guest Name</th>
                    <th>Pax</th>
                    <th>Room No</th>
                    <th>Check In</th>
                    <th>Check Out</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${requestScope.bookingList}" var="booking">
                    <tr>
                        <td><c:out value="${booking.getInvoice_number()}"/></td>
                        <td><c:out value="${booking.getCustomerName()}"/></td>
                        <td><c:out value="${booking.getBooking_pax()}"/></td>
                        <td><c:out value="${booking.getRoomNumber()}"/></td>
                        <td><c:out value="${booking.getBooking_checkindate()}"/></td>
                        <td><c:out value="${booking.getBooking_checkoutdate()}"/></td>
                        <td><c:out value="${booking.getBooking_totalfee()}"/></td>
                        <td>
                            <form action="./DeleteBookingServlet" method="post">
                                <input type="hidden" name="bookingID" value="<c:out value="${booking.getBooking_id()}"/>"/>
                                <button class="btn btn-danger" onclick="this.form.submit()">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
