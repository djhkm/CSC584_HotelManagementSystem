<%-- 
    Document   : dashboard
    Created on : Jul 9, 2023, 4:59:11 PM
    Author     : haziq
--%>
<%@page import="com.mvc.dao.RoomTypeDAO"%>
<%@page import="com.mvc.bean.RoomType"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.mvc.dao.BookingDAO"%>
<%@page import="com.mvc.bean.Booking"%>
<%@include file="checkSession.jsp" %>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.bean.Room"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.dao.RoomDAO"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS Staff | Dashboard</title>
        
        <link rel="stylesheet" href="./style.css"/>
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <style>
            .room-available{
                background-color: lightgreen;
                border: 2px green solid;
            }
            
            .room-needs-cleaning{
                background-color: khaki;
                border: 2px goldenrod solid;             
            }
            
            .room-occupied{
                background-color: lightcoral;
                border: 2px maroon solid; 
            }
        </style>
    </head>
    <body>
        <%
        RoomDAO dao = new RoomDAO();
        List<Room> rooms = dao.getAllRoom();
        //System.out.println("all rooms total to " + rooms.size());
        List<Room> guestRooms = new LinkedList(),
                executiveRooms = new ArrayList(),
                presidentialRooms = new ArrayList();
        
        // separate rooms by type
        for(Room room : rooms){
            switch(room.getRoom_roomtype_id()){
                case 1: case 2:
                    guestRooms.add(room); break;
                case 3: case 4:
                    executiveRooms.add(room); break;
                default:
                    presidentialRooms.add(room); break;
            }
        }
        
        // set as request attribute to make it available for jstl
//        request.setAttribute("guestRooms", guestRooms);
        request.setAttribute("executiveRooms", executiveRooms);
        request.setAttribute("presidentialRooms", presidentialRooms);
        
        LocalDate date = LocalDate.now();
        Date today_date = Date.from(date.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String todayDateString = formatter.format(today_date);
        
        SimpleDateFormat formatter2 = new SimpleDateFormat("E, dd MMMM yyyy");
        
        Booking b = new Booking();
        BookingDAO bdao = new BookingDAO();
        List<Booking> occupiedList = bdao.occupiedRoomWithTodayDate(todayDateString);
        
        RoomType rt = new RoomType();
        RoomTypeDAO rtdao = new RoomTypeDAO();
        List<RoomType> roomTypeList = rtdao.getAllRoomType();
        %>
        <c:import url="topNav.jsp"/>
        <div class="container-fluid p-4">
            <div class="d-flex justify-content-between mb-3">
                <div>
                    <p><a class="link-secondary" href="dashboard.jsp"><b>Room & Suite Status</b></a> | <a class="link-secondary" href="./SalesReport">Sales Report</a></p>
                </div>
                <div>
                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addRoom">Add Room</button>
                </div>
            </div>
            <div class="modal fade" id="addRoom" tabindex="-1" aria-labelledby="addRoomLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form action="LoginServlet" method="POST">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Add Room</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="roomNumber" class="form-label">Room Number</label>
                                    <input type="text" name="room_number" class="form-control" id="roomNumber">
                                </div>
                                <div class="mb-3">
                                    <label for="roomType" class="form-label">Room Type</label>
                                    <select class="form-select" name="room_type" id="roomType">
                                        <% for (RoomType roomType : roomTypeList) { %>
                                        <option value="<%= roomType.getRoomtype_id() %>"><%= roomType.getRoom_name() %></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <p>
                <a class="link-secondary" href="dashboard.jsp">
                    <b>Room & Suite Status</b>
                </a> | 
                <a class="link-secondary" href="./SalesReport">
                    Sales Report
                </a> | 
                <a class="link-secondary" href="updateRoomType.jsp"> Update Room Type</a>
            </p>
            <!-- guest room accordion -->
            <div class="accordion" id="guestAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#guestBody" aria-expanded="true" aria-controls="guestBody">
                            <b>Guest Room</b>
                        </button>
                    </h2>
                    <div id="guestBody" class="accordion-collapse collapse show" data-bs-parent="#guestAccordion">
                        <div class="accordion-body">
                            <table class="table align-middle text-center">
                                <tr>
                                    <th>Room No</th>
                                    <th>Room Type (Max pax)</th>
                                    <th>Status</th>
                                </tr>
                                <% 
                                    int occupiedFlag = 0;
                                    String endDateOccupied = "";
                                    for (Room guest : guestRooms) {
                                        occupiedFlag = 0;
                                        for (Booking book : occupiedList) {
                                            if (book.getBooking_room_id() == guest.getRoom_id()) {
                                                occupiedFlag = 1;
                                                Date occupied_date = formatter.parse(book.getBooking_checkoutdate());
                                                endDateOccupied = formatter2.format(occupied_date);
                                            }
                                        }
                                %>
                                <tr>
                                    <td style="width: 20%;">
                                        <a class="link-secondary" href="editRoom.jsp?roomID=<%= guest.getRoom_id() %>">
                                            <%= guest.getRoom_number() %>
                                        </a>
                                    </td>
                                    <td style="width: 30%;">
                                        <% if (guest.getRoom_roomtype_id() == 1) { %>2 Twin (3 pax)<% } %>
                                        <% if (guest.getRoom_roomtype_id() == 2) { %>1 King (2 pax)<% } %>
                                    </td>
                                    <td style="width: 50%;">
                                        <div class="container rounded text-center <% if (occupiedFlag == 1) { %>room-occupied<% } else { %><% if (guest.getRoom_status().equals("Available")) { %>room-available<% } %> <% if (guest.getRoom_status().equals("Needs Cleaning")) { %>room-needs-cleaning<% } %> <% if (guest.getRoom_status().equals("Occupied")) { %>room-occupied<% } %>" id="<%= guest.getRoom_id() %><% } %>">
                                            <form method="post" action="./DashboardServlet">
                                                <input type="hidden" name="room_id" value="<%= guest.getRoom_id() %>">
                                                <select name="status" class="form-select bg-transparent border-0" onchange="this.form.submit()" <% if (occupiedFlag == 1) { %> disabled <% } %>>
                                                    <% if (occupiedFlag == 1) { %>
                                                    <option>Occupied until&nbsp;<%= endDateOccupied %></option>
                                                    <% } else { %>
                                                    <option <% if (guest.getRoom_status().equals("Available")) { %>Selected<% } %> value="Available">
                                                        Available
                                                    </option>
                                                    <option <% if (guest.getRoom_status().equals("Needs Cleaning")) { %>Selected<% } %> value="Needs Cleaning">
                                                        Needs Cleaning
                                                    </option>
                                                    <option <% if (guest.getRoom_status().equals("Occupied")) { %>Selected<% } %> value="Occupied">
                                                        Occupied
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </form>                                                   
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- executive suite accordion -->
            <div class="accordion mt-4" id="execAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#execBody" aria-expanded="true" aria-controls="execBody">
                            <b>Executive Suite</b>
                        </button>
                    </h2>
                    <div id="execBody" class="accordion-collapse collapse show" data-bs-parent="#execAccordion">
                        <div class="accordion-body">
                            <table class="table align-middle text-center">
                                <tr>
                                    <th>Room No</th>
                                    <th>Room Type (Max pax)</th>
                                    <th>Status</th>
                                </tr>
                                <% 
                                    for (Room guest : executiveRooms) {
                                        occupiedFlag = 0;
                                        for (Booking book : occupiedList) {
                                            if (book.getBooking_room_id() == guest.getRoom_id()) {
                                                occupiedFlag = 1;
                                                Date occupied_date = formatter.parse(book.getBooking_checkoutdate());
                                                endDateOccupied = formatter2.format(occupied_date);
                                            }
                                        }
                                %>
                                <tr>
                                    <td style="width: 20%;">
                                        <a class="link-secondary" href="editRoom.jsp?roomID=<%= guest.getRoom_id() %>">
                                            <%= guest.getRoom_number() %>
                                        </a>
                                    </td>
                                    <td style="width: 30%;">
                                        <% if (guest.getRoom_roomtype_id() == 3) { %>2 Twin (3 pax)<% } %>
                                        <% if (guest.getRoom_roomtype_id() == 4) { %>1 King (3 pax)<% } %>
                                    </td>
                                    <td style="width: 50%;">
                                        <div class="container rounded text-center <% if (occupiedFlag == 1) { %>room-occupied<% } else { %><% if (guest.getRoom_status().equals("Available")) { %>room-available<% } %> <% if (guest.getRoom_status().equals("Needs Cleaning")) { %>room-needs-cleaning<% } %> <% if (guest.getRoom_status().equals("Occupied")) { %>room-occupied<% } %>" id="<%= guest.getRoom_id() %><% } %>">
                                            <form method="post" action="./DashboardServlet">
                                                <input type="hidden" name="room_id" value="<%= guest.getRoom_id() %>">
                                                <select name="status" class="form-select bg-transparent border-0" onchange="this.form.submit()" <% if (occupiedFlag == 1) { %> disabled <% } %>>
                                                    <% if (occupiedFlag == 1) { %>
                                                    <option>Occupied until&nbsp;<%= endDateOccupied %></option>
                                                    <% } else { %>
                                                    <option <% if (guest.getRoom_status().equals("Available")) { %>Selected<% } %> value="Available">
                                                        Available
                                                    </option>
                                                    <option <% if (guest.getRoom_status().equals("Needs Cleaning")) { %>Selected<% } %> value="Needs Cleaning">
                                                        Needs Cleaning
                                                    </option>
                                                    <option <% if (guest.getRoom_status().equals("Occupied")) { %>Selected<% } %> value="Occupied">
                                                        Occupied
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </form>                                                   
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- presidential suite accordion -->
            <div class="accordion mt-4" id="presAccordion">
                <div class="accordion-item">
                    <h2 class="accordion-header">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#presBody" aria-expanded="true" aria-controls="presBody">
                            <b>Presidential Suite</b>
                        </button>
                    </h2>
                    <div id="presBody" class="accordion-collapse collapse show" data-bs-parent="#presAccordion">
                        <div class="accordion-body">
                            <table class="table align-middle text-center">
                                <tr>
                                    <th>Room No</th>
                                    <th>Room Type (Max pax)</th>
                                    <th>Status</th>
                                </tr>
                                <% 
                                    for (Room guest : presidentialRooms) {
                                        occupiedFlag = 0;
                                        for (Booking book : occupiedList) {
                                            if (book.getBooking_room_id() == guest.getRoom_id()) {
                                                occupiedFlag = 1;
                                                Date occupied_date = formatter.parse(book.getBooking_checkoutdate());
                                                endDateOccupied = formatter2.format(occupied_date);
                                            }
                                        }
                                %>
                                <tr>
                                    <td style="width: 20%;">
                                        <a class="link-secondary" href="editRoom.jsp?roomID=<%= guest.getRoom_id() %>">
                                            <%= guest.getRoom_number() %>
                                        </a>
                                    </td>
                                    <td style="width: 30%;">
                                        1 King (2 max)
                                    </td>
                                    <td style="width: 50%;">
                                        <div class="container rounded text-center <% if (occupiedFlag == 1) { %>room-occupied<% } else { %><% if (guest.getRoom_status().equals("Available")) { %>room-available<% } %> <% if (guest.getRoom_status().equals("Needs Cleaning")) { %>room-needs-cleaning<% } %> <% if (guest.getRoom_status().equals("Occupied")) { %>room-occupied<% } %>" id="<%= guest.getRoom_id() %><% } %>">
                                            <form method="post" action="./DashboardServlet">
                                                <input type="hidden" name="room_id" value="<%= guest.getRoom_id() %>">
                                                <select name="status" class="form-select bg-transparent border-0" onchange="this.form.submit()" <% if (occupiedFlag == 1) { %> disabled <% } %>>
                                                    <% if (occupiedFlag == 1) { %>
                                                    <option>Occupied until&nbsp;<%= endDateOccupied %></option>
                                                    <% } else { %>
                                                    <option <% if (guest.getRoom_status().equals("Available")) { %>Selected<% } %> value="Available">
                                                        Available
                                                    </option>
                                                    <option <% if (guest.getRoom_status().equals("Needs Cleaning")) { %>Selected<% } %> value="Needs Cleaning">
                                                        Needs Cleaning
                                                    </option>
                                                    <option <% if (guest.getRoom_status().equals("Occupied")) { %>Selected<% } %> value="Occupied">
                                                        Occupied
                                                    </option>
                                                    <% } %>
                                                </select>
                                            </form>                                                   
                                        </div>
                                    </td>
                                </tr>
                                <% } %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:if test="${requestScope.editHREF != null}">
        <script>
            window.location.href = "dashboard.jsp#<c:out value="${requestScope.editHREF}"/>";
        </script>
        </c:if>
    </body>
</html>
