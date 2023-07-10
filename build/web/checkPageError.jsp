<%
    //request.setAttribute("errMessageFromPage", "An error has occurred, Please try again");
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
    requestDispatcher.forward(request, response);
    //out.println("<script>location.href='index.jsp'</script>");
%>