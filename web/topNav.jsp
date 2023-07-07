<%-- 
    Document   : topNav
    Created on : Jul 7, 2023, 12:16:36 PM
    Author     : haziq
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid text-center topNav">
    <div class="row">
        <div class="col-10 p-3 text-start">
            <a class="btn btn-light" href="index.jsp">HMS Hotel</a>
        </div>
        <% // only display button if not in sign up page
           //System.out.println("before if");%>
        <c:if test="${param.SignUp == null}">
            <% //System.out.println("signup is null"); %>
            <div class="col-2 p-3">
                <c:if test="${sessionScope.user == null}">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#loginModal">
                        LOGIN / SIGN UP
                    </button>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <jsp:useBean id="user" class="com.mvc.bean.Users" scope="session"/>
                    <div class="fs-5 mb-1 d-inline">
                        <c:out value="${user.username}"/>
                    </div>
                    &emsp;
                    <a type="button" class="btn btn-sm btn-secondary d-inline" href="logout.do">
                        LOG OUT
                    </a>
                </c:if>
            </div>
        </c:if>
        
    </div>
</div>

