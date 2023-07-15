<%-- 
    Document   : updateRoomType
    Created on : Jul 14, 2023, 11:13:20 AM
    Author     : haziq
--%>
<%@include file="checkSession.jsp" %>
<%@page import="com.mvc.bean.RoomType"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.dao.RoomTypeDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS Staff | Room Types</title>
        
        <link rel="stylesheet" href="./style.css"/>
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <c:import url="topNav.jsp"/>
        <div class="container-fluid p-4">
            <p class="mb-4">
                <a class="link-secondary" href="dashboard.jsp">
                    Room & Suite Status
                </a> | 
                <a class="link-secondary" href="./SalesReport">
                    Sales Report
                </a> | 
                <a class="link-secondary" href="updateRoomType.jsp"> 
                    <b>Update Room Type</b>
                </a>
            </p>
            <%
                if(request.getAttribute("successMessage") != null)
                    System.out.println("success");
                
                if(request.getAttribute("errorMessage") != null)
                    System.out.println("error");
                
                RoomTypeDAO dao = new RoomTypeDAO();
                List<RoomType> types = dao.getAllRoomType();

                request.setAttribute("types", types);
            %>
            <table class="table table-striped table-hover text-center table-bordered align-middle">
                <tr class="table-primary">
                    <th>Name</th> 
                    <th>Description</th> 
                    <th>Max Pax</th> 
                    <th>Extra Beds</th> 
                    <th>Price</th>
                    <th></th>
                </tr>
                <c:forEach items="${types}" var="row">
                    <form action="./RoomTypeServlet" method="post">
                        <input type="hidden" name="rtID" value="${row.getRoomtype_id()}"/>
                        <tr>
                            <td>
                                <input type="text" class="form-control" name="rtName" value="${row.getRoom_name()}"/>
                            </td>
                            <td>
                                <textarea class="form-control" name="rtDesc">${row.getRoom_description()}</textarea>
                            </td>
                            <td>
                                <input type="number" min="1" class="form-control" name="rtMaxPax" value="${row.getRoom_maxpax()}"/>
                            </td>
                            <td>
                                <input type="number" min="0" class="form-control" name="rtExtraBeds" value="${row.getRoom_extrabedcount()}"/>
                            </td>
                            <td>
                                <input type="number" class="form-control" name="rtPrice" value="${row.getRoom_price()}"/>
                            </td>
                            <td>
                                <button class="btn btn-primary" onclick="this.form.submit()">Update</button>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
