<%-- 
    Document   : index
    Created on : Jun 9, 2023, 10:42:00 AM
    Author     : hakimchi
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS Hotel | Home</title>
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
        <div class="container-fluid text-center p-4" style="background:lightgray;">
            <form action="reservation.jsp" method="GET">
                <div class="row justify-content-center mb-2">
                    <div class="col-md-4">Dates</div>
                    <div class="col-md-4">Rooms & Guests</div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-2">
                        <input class="form-control" type="date" name="dateStart"/>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        &rarr;
                    </div>
                    <div class="col-md-2 border-right">
                        <input class="form-control" type="date" name="dateEnd"/>
                    </div>
                    <div class="col-md-1">
                        <input class="form-control" type="number" name="roomCount" min="1" max="3" value="1"/>
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        Room,
                    </div>
                    <div class="col-md-1">
                        <input class="form-control" type="number" name="guestCount" min="1" max="8" value="1"/> 
                    </div>
                    <div class="col-md-auto d-flex align-items-center">
                        Pax
                    </div>
                    <div class="col-md-1">
                        <button class="btn btn-secondary" type="submit">VIEW RATES</button>
                    </div>
                </div>
            </form>
        </div>
        <div style="height:400px; overflow:clip">
            <img src="./hotel-front.jpg"
                 class="img-fluid"
                 style="object-position: 0px -135px;"/>
        </div>
        <div class="container mt-2 mb-4">
            <h3>Rooms and Suites</h3>
            <div class="row justify-content-center">
                <div class="col-2 border">
                    <img class="img-fluid" src="1-guesttwins.jpg"/>
                </div>
                <div class="col-2 border offset-1">
                    <img class="img-fluid" src="2-guestking.jpg"/>
                </div>
                <div class="col-2 border offset-1">
                    <img class="img-fluid" src="3-executiveking.jpg"/>
                </div>
                <div class="col-2 border offset-1">
                    <img class="img-fluid" src="4-presidential.jpg"/>
                </div>
            </div>
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
        <c:if test="${requestScope.errMessage != null || requestScope.successMessage != null}">
        <script>
            $(document).ready(function () {
                $('#loginModal').modal('show');
            });
        </script>
        </c:if>
    </body>
</html>
