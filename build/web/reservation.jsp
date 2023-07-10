<%@include file="checkSession.jsp" %>
<%@page import="com.mvc.bean.RoomType"%>
<%@page import="com.mvc.dao.RoomDAO"%>
<%@page import="com.mvc.bean.Room"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.dao.RoomTypeDAO"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Booking</title>
        <link rel="stylesheet" href="./style.css"/>
        <!-- jQuery import -->
        <script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <!-- fontawasome icon -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    
    <!-- verify get parameter -->
    <%
        try {
            LocalDate localDate = LocalDate.now();
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat formatter = new SimpleDateFormat("E, dd MMM yyyy");
            Date today_date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
            Date dateStart = parser.parse(request.getParameter("dateStart"));
            Date dateEnd = parser.parse(request.getParameter("dateEnd"));
            String stringDateStart = formatter.format(dateStart);
            String stringDateEnd = formatter.format(dateEnd);
            
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
        <div style="text-align: center;">
            <h1>Search Result</h1>
        </div>
        <div class="container-fluid text-center p-4 mb-5" style="background:lightgray;">
            <form action="" method="GET">
                <div class="row justify-content-center mb-2">
                    <div class="col-md-4">Dates</div>
                    <div class="col-md-4">Rooms & Guests</div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-2 d-flex justify-content-end align-items-center">
                        <!--<input class="form-control" type="date" name="dateStart"/>-->
                        <%= stringDateStart %>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        &rarr;
                    </div>
                    <div class="col-md-2 d-flex justify-content-start align-items-center border-right">
                        <!--<input class="form-control" type="date" name="dateEnd"/>-->
                        <%= stringDateEnd %>
                    </div>
                    <div class="col-md-1 d-flex justify-content-end align-items-center">
                        <!--<input class="form-control" type="number" name="roomCount" min="1" max="3" value="1"/>-->
                        <c:out value="${param.roomCount}"></c:out>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        Room,
                    </div>
                    <div class="col-md-1 d-flex justify-content-end align-items-center">
                        <!--<input class="form-control" type="number" name="guestCount" min="1" max="8" value="1"/>--> 
                        <c:out value="${param.guestCount}"></c:out>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        Pax
                    </div>
                    <div class="col-md-1">
                        <a class="btn btn-secondary" href="index.jsp">EDIT</a>
                    </div>
                </div>
            </form>
        </div>

        <div class="container">
            
            <%
                //roomtypedao getroomtype
                int cannot_accomodate = 0;
                List<RoomType> roomTypes = new ArrayList();
                RoomTypeDAO rtdao = new RoomTypeDAO();
                roomTypes = rtdao.getAllRoomType();
                
                //roomdao availableSameRoomTypeWithCheckInOutDate(String checkIn, String checkOut, int roomtype_id)
                for (RoomType rtvalue : roomTypes) {
                    List<Room> rooms = new ArrayList();
                    RoomDAO rdao = new RoomDAO();
                    rooms = rdao.availableSameRoomTypeWithCheckInOutDate(request.getParameter("dateStart"), request.getParameter("dateEnd"), rtvalue.getRoomtype_id());
                    
                    if (rooms.size() > 0 && rooms.size() >= roomCount && rtvalue.getRoom_maxpax() >= newGuestCount) {
                        //int price = (int) rtvalue.getRoom_price();
            %>
            <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-between">
                            <h4 class="mb-0"><%= rtvalue.getRoom_description() %></h4>
                            <p class="mb-0"><%= rooms.size() %> Room(s) Available</p>
                        </div>
                    </div>
                </div>
                <hr class="mt-0 mb-0">
                <div class="card-body">
                    <div class="row">
                        <div class="col-4 d-flex align-items-end">
                            <img class="img-thumbnail" src="<%= rtvalue.getRoomtype_id() %>.jpg" style="max-width: 250px;">
                            <% for (int i = 0; i < rtvalue.getRoom_maxpax(); i++) { %><i class="pb-1 fa-solid fa-person"></i><% } %>
                        </div>
                        <div class="col-4 d-flex justify-content-center align-items-center">
                            <h3><%= (int)rtvalue.getRoom_price() %></h3>
                            <small class="pt-1">&nbsp;MYR / night</small>
                        </div>
                        <div class="col-4 text-end d-flex justify-content-end align-items-center">
                            <a class="btn btn-primary" href="reservationdetails.jsp?dateStart=<c:out value="${param.dateStart}"></c:out>&dateEnd=<c:out value="${param.dateEnd}"></c:out>&roomCount=<c:out value="${param.roomCount}"></c:out>&guestCount=<c:out value="${param.guestCount}"></c:out>&roomType=<%= rtvalue.getRoomtype_id() %>">Select</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                    else {
                        cannot_accomodate++;
                    }
                }

                if (cannot_accomodate == 5) {
            %>
            <div class="card mb-3">
                <div class="card-body text-center">
                    <svg class="mt-3" xmlns="http://www.w3.org/2000/svg" height="80" viewBox="0 0 576 512"><path d="M112 48a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm40 304V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V256.9L59.4 304.5c-9.1 15.1-28.8 20-43.9 10.9s-20-28.8-10.9-43.9l58.3-97c17.4-28.9 48.6-46.6 82.3-46.6h29.7c33.7 0 64.9 17.7 82.3 46.6l44.9 74.7c-16.1 17.6-28.6 38.5-36.6 61.5c-1.9-1.8-3.5-3.9-4.9-6.3L232 256.9V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V352H152zM432 224a144 144 0 1 1 0 288 144 144 0 1 1 0-288zm0 240a24 24 0 1 0 0-48 24 24 0 1 0 0 48zM368 321.6V328c0 8.8 7.2 16 16 16s16-7.2 16-16v-6.4c0-5.3 4.3-9.6 9.6-9.6h40.5c7.7 0 13.9 6.2 13.9 13.9c0 5.2-2.9 9.9-7.4 12.3l-32 16.8c-5.3 2.8-8.6 8.2-8.6 14.2V384c0 8.8 7.2 16 16 16s16-7.2 16-16v-5.1l23.5-12.3c15.1-7.9 24.5-23.6 24.5-40.6c0-25.4-20.6-45.9-45.9-45.9H409.6c-23 0-41.6 18.6-41.6 41.6z"/></svg>
                    <p class="lead mt-4 text-800 font-sans-serif fw-semi-bold">Correction needed, the hotel cannot proceed with your request due to rooms being fully booked or too many guests per room.</p>
                    <hr />
                    <button class="btn btn-primary btn-sm mb-3" onClick="location.href='index.jsp'"><i class="fa-solid fa-rotate-left"></i>&nbsp;Go Back</button>
                </div>
            </div>
            <%
                }
            %>
            
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
