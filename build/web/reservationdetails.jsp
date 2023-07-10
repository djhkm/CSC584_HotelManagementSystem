<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.dao.RoomDAO"%>
<%@page import="com.mvc.bean.Room"%>
<%@page import="com.mvc.bean.Users"%>
<%@page import="com.mvc.dao.CustomerDAO"%>
<%@page import="com.mvc.bean.Customer"%>
<%@page import="com.mvc.util.DateUtil"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="com.mvc.dao.RoomTypeDAO"%>
<%@page import="com.mvc.bean.RoomType"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <%
        try {
            LocalDate localDate = LocalDate.now();
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formatter = new SimpleDateFormat("E, dd MMMM yyyy");
            SimpleDateFormat formatterReset = new SimpleDateFormat("yyyy-MM-dd");
            Date today_date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
            Date dateStart = parser.parse(request.getParameter("dateStart"));
            Date dateStartAdd = parser.parse(request.getParameter("dateStart"));
            Date dateEnd = parser.parse(request.getParameter("dateEnd"));
            String stringDateStart = formatter.format(dateStart);
            String stringDateEnd = formatter.format(dateEnd);
            String stringResetDateStart = formatterReset.format(dateStart);
            String stringResetDateEnd = formatterReset.format(dateEnd);
            
            long dateBeforeInMs = dateStart.getTime();
            long dateAfterInMs = dateEnd.getTime();
            long timeDiff = Math.abs(dateAfterInMs - dateBeforeInMs);
            long daysDiff = TimeUnit.DAYS.convert(timeDiff, TimeUnit.MILLISECONDS);
            
            int roomCount = Integer.parseInt(request.getParameter("roomCount"));
            int guestCount = Integer.parseInt(request.getParameter("guestCount"));
            int newGuestCount = guestCount / roomCount;
            
            if ((dateStart.compareTo(today_date) < 0) || (dateEnd.compareTo(dateStart) < 0) || (dateStart.compareTo(dateEnd) == 0)) {
                request.setAttribute("errMessageFromPage", "Invalid date range or format, Please try again");
    %>
    <%@include file="checkPageError.jsp"%>
    <%
            } else if (roomCount == 0 || guestCount == 0) {
                request.setAttribute("errMessageFromPage", "Invalid room or guest number, Please try again");
    %>
    <%@include file="checkPageError.jsp"%>
    <%
            }            
    %>
    
    <body class="bg-body-secondary">
        <c:import url="topNav.jsp"/>
        <div class="container mt-5">
            <h1>Review Reservation Details</h1>
        </div>
        <div class="container">
            <%
                RoomType rt;
                RoomTypeDAO rtdao = new RoomTypeDAO();
                rt = rtdao.getRoomType(Integer.parseInt(request.getParameter("roomType")));
                
                Customer cus;
                CustomerDAO cdao = new CustomerDAO();
                cus = cdao.getCustomerDataUsingUserId(((Users)session.getAttribute("user")).getUser_id());
                
                List<Room> rooms = new ArrayList();
                RoomDAO rdao = new RoomDAO();
                rooms = rdao.availableSameRoomTypeWithCheckInOutDate(stringResetDateStart, stringResetDateEnd, Integer.parseInt(request.getParameter("roomType")));
                
                long booking_totalfee = (int)rt.getRoom_price() * daysDiff * Integer.valueOf(request.getParameter("roomCount"));
            %>
            <form action="BookingServlet" method="POST">
                <input type="hidden" name="operation" value="C">
                <input type="hidden" name="booking_pax" value="${param.guestCount}">
                <input type="hidden" name="booking_dayofstay" value="<%= daysDiff %>">
                <input type="hidden" name="booking_checkindate" value="${param.dateStart}">
                <input type="hidden" name="booking_checkoutdate" value="${param.dateEnd}">
                <input type="hidden" name="booking_totalfee" value="<%= booking_totalfee %>">
                <input type="hidden" name="booking_customer_id" value="<%= cus.getCustomer_id() %>">
                <input type="hidden" name="booking_room_id_1" value="<% if (Integer.valueOf(request.getParameter("roomCount")) >= 1) {out.print(rooms.get(0).getRoom_id());} else {out.print(0);} %>">
                <input type="hidden" name="booking_room_id_2" value="<% if (Integer.valueOf(request.getParameter("roomCount")) >= 2) {out.print(rooms.get(1).getRoom_id());} else {out.print(0);} %>">
                <input type="hidden" name="booking_room_id_3" value="<% if (Integer.valueOf(request.getParameter("roomCount")) >= 3) {out.print(rooms.get(2).getRoom_id());} else {out.print(0);} %>">
                <div class="row">
                    <div class="col-12 mt-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-auto">
                                        <img class="img-thumbnail" src="${param.roomType}.jpg" style="max-width: 450px;">
                                    </div>
                                    <div class="col-auto">
                                        <h5 class="mb-3"><%= rt.getRoom_description() %></h5>
                                        <p class="fw-bold">Check in:&nbsp;<span class="fw-normal"><%= stringDateStart %></span></p>
                                        <p class="fw-bold">Check out:&nbsp;<span class="fw-normal"><%= stringDateEnd %></span></p>
                                        <p class="fw-bold">Room(s):&nbsp;<span class="fw-normal">${param.roomCount}</span></p>
                                        <p class="fw-bold">Guest(s):&nbsp;<span class="fw-normal">${param.guestCount}</span></p>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="text-center">
                                    <button type="submit" class="btn btn-outline-success btn-lg">Book</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 mt-3">
                        <div class="card">
                            <div class="card-header fw-bold">
                                <h5 class="mb-1">Summary of Charges</h5>
                            </div>
                            <div class="card-body">
                                <div class="row d-flex justify-content-center">
                                    <div class="col-9">
                                        <table class="table table-borderless table-hover">
                                            <thead>
                                                <tr>
                                                    <th>${param.roomCount} room(s) for <%= daysDiff %> night(s)</th>
                                                    <th class="fw-light text-end">Prices in MYR</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (int i = 0; i < daysDiff; i++) { %>
                                                <tr>
                                                    <td><%= formatter.format(dateStartAdd) %></td>
                                                    <td class="text-end"><%= (int)rt.getRoom_price() * Integer.valueOf(request.getParameter("roomCount")) %></td>
                                                </tr>
                                                <%
                                                    dateStartAdd = DateUtil.addDays(dateStartAdd, 1);
                                                    }
                                                %>
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th class="fs-4">Total Stay</th>
                                                    <th class="fs-4 text-end"><%= booking_totalfee %> MYR</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
    
    <%
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errMessageFromPage", "An error has occurred, Please try again");
    %>
    <%@include file="checkPageError.jsp"%>
    <%
        }
    %>
    
</html>
            