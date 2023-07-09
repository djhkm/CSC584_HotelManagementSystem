<%-- 
    Document   : dashboard
    Created on : Jul 9, 2023, 4:59:11 PM
    Author     : haziq
--%>
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
        request.setAttribute("guestRooms", guestRooms);
        request.setAttribute("executiveRooms", executiveRooms);
        request.setAttribute("presidentialRooms", presidentialRooms);
        %>
        <c:import url="topNav.jsp"/>
        <div class="container-fluid p-4">
            <p><a class="link-secondary" href="dashboard.jsp"><b>Room & Suite Status</b></a> | <a class="link-secondary" href="./SalesReport">Sales Report</a></p>
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
                                <c:forEach items="${guestRooms}" var="roomRow">
                                    <tr>
                                        <td><c:out value="${roomRow.getRoom_number()}"/></td>
                                        <td>
                                            <c:if test="${roomRow.getRoom_roomtype_id() == 1}">
                                                2 Twin (3 pax)
                                            </c:if>
                                            <c:if test="${roomRow.getRoom_roomtype_id() == 2}">
                                                1 King (2 pax)
                                            </c:if>    
                                        </td>
                                        <td>
                                            <div class="container rounded text-center 
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Available\")}">
                                                     room-available
                                                 </c:if>
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Needs Cleaning\")}">
                                                     room-needs-cleaning
                                                 </c:if>
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Occupied\")}">
                                                     room-occupied
                                                 </c:if>
                                                 ">
                                                <form method="post" action="./DashboardServlet">
                                                    <input type="hidden" name="room_id" value="<c:out value="${roomRow.getRoom_id()}"/>">
                                                    <select name="status" class="form-select bg-transparent border-0" onchange="this.form.submit()">
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Available\")}">
                                                                selected
                                                            </c:if>
                                                            value="Available"
                                                            >
                                                            Available
                                                        </option>
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Needs Cleaning\")}">
                                                                selected
                                                            </c:if>
                                                            value="Needs Cleaning"
                                                            >
                                                            Needs Cleaning
                                                        </option>
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Occupied\")}">
                                                                selected
                                                            </c:if>
                                                            value="Occupied"
                                                            >
                                                            Occupied
                                                        </option>
                                                    </select>
                                                </form>                                                   
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
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
                                <c:forEach items="${executiveRooms}" var="roomRow">
                                    <tr>
                                        <td><c:out value="${roomRow.getRoom_number()}"/></td>
                                        <td>
                                            <c:if test="${roomRow.getRoom_roomtype_id() == 3}">
                                                2 Twin (3 pax)
                                            </c:if>
                                            <c:if test="${roomRow.getRoom_roomtype_id() == 4}">
                                                1 King (3 pax)
                                            </c:if>
                                        </td>
                                        <td>
                                            <div class="container rounded text-center 
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Available\")}">
                                                     room-available
                                                 </c:if>
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Needs Cleaning\")}">
                                                     room-needs-cleaning
                                                 </c:if>
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Occupied\")}">
                                                     room-occupied
                                                 </c:if>
                                                 ">
                                                <form method="post" action="./DashboardServlet">
                                                    <input type="hidden" name="room_id" value="<c:out value="${roomRow.getRoom_id()}"/>">
                                                    <select name="status" class="form-select bg-transparent border-0" onchange="this.form.submit()">
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Available\")}">
                                                                selected
                                                            </c:if>
                                                            value="Available"
                                                            >
                                                            Available
                                                        </option>
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Needs Cleaning\")}">
                                                                selected
                                                            </c:if>
                                                            value="Needs Cleaning"
                                                            >
                                                            Needs Cleaning
                                                        </option>
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Occupied\")}">
                                                                selected
                                                            </c:if>
                                                            value="Occupied"
                                                            >
                                                            Occupied
                                                        </option>
                                                    </select>
                                                </form>       
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
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
                                <c:forEach items="${presidentialRooms}" var="roomRow">
                                    <tr>
                                        <td><c:out value="${roomRow.getRoom_number()}"/></td>
                                        <td>
                                            1 King (2 max)
                                        </td>
                                        <td>
                                            <div class="container rounded text-center 
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Available\")}">
                                                     room-available
                                                 </c:if>
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Needs Cleaning\")}">
                                                     room-needs-cleaning
                                                 </c:if>
                                                 <c:if test="${roomRow.getRoom_status().equals(\"Occupied\")}">
                                                     room-occupied
                                                 </c:if>
                                                 ">
                                                <form method="post" action="./DashboardServlet">
                                                    <input type="hidden" name="room_id" value="<c:out value="${roomRow.getRoom_id()}"/>">
                                                    <select name="status" class="form-select bg-transparent border-0" onchange="this.form.submit()">
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Available\")}">
                                                                selected
                                                            </c:if>
                                                            value="Available"
                                                            >
                                                            Available
                                                        </option>
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Needs Cleaning\")}">
                                                                selected
                                                            </c:if>
                                                            value="Needs Cleaning"
                                                            >
                                                            Needs Cleaning
                                                        </option>
                                                        <option 
                                                            <c:if test="${roomRow.getRoom_status().equals(\"Occupied\")}">
                                                                selected
                                                            </c:if>
                                                            value="Occupied"
                                                            >
                                                            Occupied
                                                        </option>
                                                    </select>
                                                </form>       
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
