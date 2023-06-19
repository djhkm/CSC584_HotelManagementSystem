<%-- 
    Document   : regsiter-customer
    Created on : Jun 9, 2023, 1:07:52 PM
    Author     : hakimchi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register (Customer)</title>
    </head>
    <body>
        <h1>Register (Customer)</h1>
        <form action="RegisterCustomerServlet" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td colspan="2"><b>Personal Details</b></td>
                    </tr>
                    <tr>
                        <td>Honorific: </td>
                        <td>
                            <select name="customer_honorific">
                                <option value="Mr.">Mr.</option>
                                <option value="Mrs.">Mrs.</option>
                                <option value="Miss.">Miss.</option>
                                <option value="Ms.">Ms.</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Name: </td>
                        <td>
                            <input type="text" name="customer_name">
                        </td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td>
                            <input type="email" name="customer_email">
                        </td>
                    </tr>
                    <tr>
                        <td>Phone Number: </td>
                        <td>
                            <input type="text" name="customer_phoneNumber" placeholder="01234567890">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><b>Login Credential</b></td>
                    </tr>
                    <tr>
                        <td>Username: </td>
                        <td>
                            <input type="text" name="customer_username">
                        </td>
                    </tr>
                    <tr>
                        <td>Password: </td>
                        <td>
                            <input type="password" name="customer_password">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                <center><input type="submit" name="Register"></center>
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
    </body>
</html>
