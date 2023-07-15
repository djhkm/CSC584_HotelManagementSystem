<%-- 
    Document   : editRoom
    Created on : Jul 11, 2023, 3:11:49 PM
    Author     : haziq
--%>
<%@include file="checkSession.jsp" %>
<%@page import="com.mvc.bean.RoomType"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.bean.Room"%>
<%@page import="com.mvc.dao.RoomTypeDAO"%>
<%@page import="com.mvc.dao.RoomDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int roomid = Integer.parseInt(request.getParameter("roomID"));
    
    
    RoomDAO roomDAO = new RoomDAO();
    RoomTypeDAO rtDAO = new RoomTypeDAO();

    Room room = roomDAO.getRoom(roomid);
    RoomType rt = rtDAO.getRoomType(room.getRoom_roomtype_id());
    List<RoomType> rtList = rtDAO.getAllRoomType();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS Staff | Update Room</title>
        
        <link rel="stylesheet" href="./style.css"/>
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:import url="topNav.jsp"/>
        <div class="container-fluid p-4">
            <p>
                <a class="link-secondary" href="dashboard.jsp">
                    <b>Room & Suite Status</b>
                </a> | 
                <a class="link-secondary" href="./SalesReport">
                    Sales Report
                </a> | 
                <a class="link-secondary" href="updateRoomType.jsp"> Update Room Type</a>
            </p>
        </div>
        <div class="container p-4 pt-0">
            <div class="row">
                <div class="d-flex justify-content-center">
                    <div class="col-6">
                        <h3>Update Room</h3>
                        <form action="./RoomServlet" method="post">
                            <input type="hidden" name="roomID" value="<%= roomid %>"/>
                            <table class="table">
                                <tr>
                                    <td>Room Number:</td>
                                    <td>
                                        <input type="number" name="roomNumber" class="form-control" value="<%= room.getRoom_number() %>"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Room Type:</td>
                                    <td>
                                        <select name="roomType" class="form-select">
                                            <%
                                            for(RoomType rtRow : rtList){    
                                            %>
                                            <option value="<%= rtRow.getRoomtype_id() %>" <%= rtRow.getRoomtype_id() == rt.getRoomtype_id() ? "selected" : "" %>>
                                                <%= rtRow.getRoom_name() %>
                                            </option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                            <p class="text-center">
                                <input type="submit" name="operation" class="btn btn-danger" value="Delete"/>
                                <a class="btn btn-secondary ms-1 me-1" href="dashboard.jsp">Back</a>
                                <input type="submit" name="operation" class="btn btn-primary" value="Save"/>
                            </p>
                        </form>
                        <c:if test="${requestScope.errMessage != null}">
                        <div class="container-fluid" style="color: red">
                            <c:out value="${requestScope.errMessage}"/>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
