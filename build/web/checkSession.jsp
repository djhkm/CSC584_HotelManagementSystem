<%
    if (session.getAttribute("user") == null) {
        request.setAttribute("errMessage", "You are not logged in");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request, response);
        //out.println("<script>location.href='index.jsp'</script>");
    }
%>