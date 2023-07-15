<%-- 
    Document   : regsiter-customer
    Created on : Jun 9, 2023, 1:07:52 PM
    Author     : hakimchi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS Hotel | Register</title>
        <!-- style import -->
        <link rel="stylesheet" href="./style.css"/>
        <!-- jQuery import -->
        <script src="https://code.jquery.com/jquery-3.7.0.slim.min.js" integrity="sha256-tG5mcZUtJsZvyKAxYLVXrmjKBVLd6VpVccqz/r4ypFE=" crossorigin="anonymous"></script>
        <!-- bootstrap stuff -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </head>
    <body>
        <c:if test="${sessionScope.user != null}">
            <script>
                $(document).ready(function(){
                    window.location.replace("index.jsp");
                });
            </script>
        </c:if>
        <jsp:include page="topNav.jsp">
            <jsp:param name="SignUp" value="SignUp"/>
        </jsp:include>
        <div class="container mt-4">
            <h1>Account Registration</h1>
            <br><br>
            <form action="RegisterCustomerServlet" method="POST">
                <table border="0" class="table">
                    <tbody>
                        <tr>
                            <td colspan="2"><b>Personal Details</b></td>
                        </tr>
                        <tr>
                            <td>Honorific: </td>
                            <td>
                                <select class="form-select" name="customer_honorific">
                                    <option value="Mr.">Mr.</option>
                                    <option value="Sir">Sir</option>
                                    <option value="Mrs.">Mrs.</option>
                                    <option value="Ms.">Ms.</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Name: </td>
                            <td>
                                <input class="form-control" type="text" name="customer_name" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Email: </td>
                            <td>
                                <input class="form-control" type="email" name="customer_email" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Phone Number: </td>
                            <td>
                                <input class="form-control" type="tel" name="customer_phoneNumber" placeholder="01234567890" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><b>Login Credential</b></td>
                        </tr>
                        <tr>
                            <td>Username: </td>
                            <td>
                                <input class="form-control" type="text" name="customer_username" required>
                            </td>
                        </tr>
                        <tr>
                            <td>Password: </td>
                            <td>
                                <input class="form-control" type="password" name="customer_password" required>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <center>
                                    <a class="btn btn-secondary me-1" href="index.jsp">Back</a>
                                    <input class="btn btn-primary" type="submit" name="Register" value="Register">
                                </center>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
            <% if(request.getAttribute("errMessage")!= null) { %>
            <span style="font-size: 14px; color: red;">
                <%= request.getAttribute("errMessage") %>
            </span>
            <% } %>
        </div>
    </body>
</html>
