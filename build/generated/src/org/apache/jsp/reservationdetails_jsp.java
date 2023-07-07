package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reservationdetails_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Hotel Booking</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./style.css\"/>\n");
      out.write("        \n");
      out.write("        <!-- bootstrap stuff -->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz\" crossorigin=\"anonymous\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid text-center topNav\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-10\">\n");
      out.write("                    logo goes here\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-2\">\n");
      out.write("\n");
      out.write("                    <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#loginModal\">\n");
      out.write("                        LOGIN / SIGN UP\n");
      out.write("                    </button>\n");
      out.write("\n");
      out.write("                    <div class=\"fs-5 mb-1 d-inline\">\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("<!--                    <a href=\"login.jsp\">\n");
      out.write("                        <button class=\"btn btn-primary\">\n");
      out.write("                            LOGIN / SIGN UP\n");
      out.write("                        </button>\n");
      out.write("                    </a>-->\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"card-body\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-3\">\n");
      out.write("          <img src=\"path/to/image.jpg\" alt=\"Image\" width=\"200\" height=\"200\">\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-9\">\n");
      out.write("            <h5>Reservation Details</h5>\n");
      out.write("            <p>2 Twin/Single Beds, Suite</p>\n");
      out.write("            <p>Check in:</p>\n");
      out.write("            <p>Check out:</p>\n");
      out.write("            <p>Room(s):</p>\n");
      out.write("            <p>Guest(s) per room:</p>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("  <div class=\"row\">\n");
      out.write("    <div class=\"col-md-6\">\n");
      out.write("      <h2>Guest Information</h2>\n");
      out.write("      <form>\n");
      out.write("  <div class=\"form-group row\">\n");
      out.write("    <label for=\"firstName\" class=\"col-sm-3 col-form-label\">First Name:</label>\n");
      out.write("    <div class=\"col-sm-9\">\n");
      out.write("      <input type=\"text\" id=\"firstName\" name=\"firstName\" class=\"form-control\" required>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <div class=\"form-group row\">\n");
      out.write("    <label for=\"lastName\" class=\"col-sm-3 col-form-label\">Last Name:</label>\n");
      out.write("    <div class=\"col-sm-9\">\n");
      out.write("      <input type=\"text\" id=\"lastName\" name=\"lastName\" class=\"form-control\" required>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <div class=\"form-group\">\n");
      out.write("    <label for=\"address\" class=\"col-sm-3 col-form-label\">Address:</label>\n");
      out.write("    <textarea id=\"address\" name=\"address\" class=\"form-control\" rows=\"3\" required></textarea>\n");
      out.write("  </div>\n");
      out.write("\n");
      out.write("  <div class=\"form-group text-center\">\n");
      out.write("    <button type=\"submit\" class=\"btn btn-primary \">Reserve</button>\n");
      out.write("  </div>\n");
      out.write("</form>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"col-md-6 text-center allign-items-center\">\n");
      out.write("        <h1></h1>\n");
      out.write("      <h2>Or</h2>\n");
      out.write("      <a Class=\"btn btn-primary\">Sign in for faster booking</a>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
