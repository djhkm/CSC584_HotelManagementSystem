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
    </head>
    
    <!-- verify get parameter -->
    <%
        try {
    %>
    <c:if test="${param.dateStart == '' || param.dateEnd == '' || param.roomCount == '' || param.guestCount == '' || param.roomCount == 0 || param.guestCount == 0}">
        <script>
            location.href="index.jsp";
        </script>
    </c:if>
    <c:if test="${param.dateStart != '' && param.dateEnd != '' && param.roomCount != '' && param.guestCount != '' && param.roomCount != 0 && param.guestCount != 0}">
        <%
            LocalDate localDate = LocalDate.now();
            SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
            Date today_date = Date.from(localDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
            Date dateStart = parser.parse(request.getParameter("dateStart"));
            Date dateEnd = parser.parse(request.getParameter("dateEnd"));

            if ((dateStart.compareTo(today_date) < 0) || (dateEnd.compareTo(dateStart) < 0)) {
        %>
        <script>
            location.href="index.jsp";
        </script>
        <%
            }
        %>
    </c:if>
    <%
        } catch (Exception e) {
            e.printStackTrace();
    %>
    <script>
        location.href="index.jsp";
    </script>
    <%
        }
        SimpleDateFormat parser = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formatter = new SimpleDateFormat("E, dd MMM yyyy");
        Date dateStart = parser.parse(request.getParameter("dateStart"));
        Date dateEnd = parser.parse(request.getParameter("dateEnd"));
        String stringDateStart = formatter.format(dateStart);
        String stringDateEnd = formatter.format(dateEnd);
    %>
    
    <body>
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
                        <% out.print(stringDateStart); %>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        &rarr;
                    </div>
                    <div class="col-md-2 d-flex justify-content-start align-items-center border-right">
                        <!--<input class="form-control" type="date" name="dateEnd"/>-->
                        <% out.print(stringDateEnd); %>
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
                List<RoomType> roomTypes = new ArrayList();
                RoomTypeDAO rtdao = new RoomTypeDAO();
                roomTypes = rtdao.getAllRoomType();
                
                //roomdao availableSameRoomTypeWithCheckInOutDate(String checkIn, String checkOut, int roomtype_id)
                for (RoomType rtvalue : roomTypes) {
                    List<Room> rooms = new ArrayList();
                    RoomDAO rdao = new RoomDAO();
                    rooms = rdao.availableSameRoomTypeWithCheckInOutDate(request.getParameter("dateStart"), request.getParameter("dateEnd"), rtvalue.getRoomtype_id());
                    
                    if (rooms.size() > 0) {
                        //int price = (int) rtvalue.getRoom_price();
            %>
            <div class="card mb-3">
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 d-flex justify-content-between">
                            <h4 class="mb-0"><% out.print(rtvalue.getRoom_description()); %></h4>
                            <p class="mb-0"><% out.print(rooms.size()); %> Room(s) Available</p>
                        </div>
                    </div>
                </div>
                <hr class="mt-0 mb-0">
                <div class="card-body">
                    <div class="row">
                        <div class="col-4">
                            <img class="img-thumbnail" src="<% out.print(rtvalue.getRoomtype_id()); %>.jpg" style="max-width: 250px;">
                        </div>
                        <div class="col-4 d-flex justify-content-center align-items-center">
                            <h3><% out.print((int) rtvalue.getRoom_price()); %></h3>
                            <small class="pt-1">&nbsp;MYR / night</small>
                        </div>
                        <div class="col-4 text-end d-flex justify-content-end align-items-center">
                            <a class="btn btn-primary" href="#">Select</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                    }
                } 
            %>
            
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
                            <c:if test="${requestScope.errMessage != null}">
                                <div class="container-fluid" style="color: red">
                                    <c:out value="${requestScope.errMessage}"/>
                                </div>
                            </c:if>
                            <c:if test="${requestScope.successMessage != null}">
                                <div class="container-fluid" style="color:blue">
                                    <c:out value="${requestScope.successMessage}"/>
                                </div>
                            </c:if>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-secondary" name="SignUp">Sign Up</button>
                            <button type="submit" class="btn btn-primary" name="SignIn">Sign In</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
