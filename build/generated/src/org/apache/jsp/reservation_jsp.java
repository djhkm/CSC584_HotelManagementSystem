package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reservation_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("            \n");
      out.write("                    <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#loginModal\">\n");
      out.write("                        LOGIN / SIGN UP\n");
      out.write("                    </button>\n");
      out.write("             \n");
      out.write("                    <div class=\"fs-5 mb-1 d-inline\">\n");
      out.write("                   \n");
      out.write("                    </div>\n");
      out.write("                 \n");
      out.write("<!--                    <a href=\"login.jsp\">\n");
      out.write("                        <button class=\"btn btn-primary\">\n");
      out.write("                            LOGIN / SIGN UP\n");
      out.write("                        </button>\n");
      out.write("                    </a>-->\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div style=\"text-align: center;\">\n");
      out.write("  <h1>Search Result</h1>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid text-center\" style=\"background:lightgray; padding: 20px;\">\n");
      out.write("  <form action=\"#\">\n");
      out.write("    <div class=\"row justify-content-center mb-2\">\n");
      out.write("      <div class=\"col-md-5\">Dates</div>\n");
      out.write("      <div class=\"col-md-4\">Rooms & Guests</div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"row justify-content-center\">\n");
      out.write("      <div class=\"col-md-2\">\n");
      out.write("        <input class=\"form-control\"  type=\"date\" name=\"dateStart\"/>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-md-auto\">\n");
      out.write("        &rarr;\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-md-2 border-right\">\n");
      out.write("        <input class=\"form-control\"  type=\"date\" name=\"dateEnd\"/>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-md-1\">\n");
      out.write("        <input class=\"form-control\" style=\"//width:40px\" type=\"number\" name=\"roomCount\" value=\"1\"/>\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-md-auto\">\n");
      out.write("        Room,\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-md-1\">\n");
      out.write("        <input class=\"form-control\" style=\"//width:40px\" type=\"number\" name=\"guestCount\" value=\"1\"/> \n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-md-auto\">\n");
      out.write("        Pax\n");
      out.write("      </div>\n");
      out.write("      <div class=\"col-md-1\">\n");
      out.write("        <a href=\"reservation.jsp\">\n");
      out.write("          <div class=\"btn btn-secondary justify-content-end\">\n");
      out.write("            Edit\n");
      out.write("          </div>\n");
      out.write("        </a>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </form>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <!column 1>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"card-body\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("          <h5>2 Twin/Single Bed, Guest Room</h5>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("          <p>12 Rooms Available</p>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"card-body\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <img src=\"path/to/logo.png\">\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <h5>400 myr/night</h5>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <a class=\"btn btn-primary\">Select</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        <!column 2>\n");
      out.write("        <div class=\"container\">\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"card-body\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("          <h5>1 King Bed, Guest Room</h5>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("          <p>12 Rooms Available</p>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"card-body\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <img src=\"path/to/logo.png\">\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <h5>450 myr/night</h5>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <a class=\"btn btn-primary\">Select</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("        <!column 3>\n");
      out.write("        <div class=\"container\">\n");
      out.write("  <div class=\"card\">\n");
      out.write("    <div class=\"card-body\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("          <h5>2 Twin/Single Bed, Suite</h5>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-6\">\n");
      out.write("          <p>12 Rooms Available</p>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"card-body\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <img src=\"path/to/logo.png\">\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <h5>500 myr/night</h5>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"col-md-4\">\n");
      out.write("          <a class=\"btn btn-primary\">Select</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("    </div>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("        \n");
      out.write("        <!-- login -->\n");
      out.write("        <div class=\"modal fade\" id=\"loginModal\" tabindex=\"-1\" aria-labelledby=\"loginModalLabel\" aria-hidden=\"true\">\n");
      out.write("            <div class=\"modal-dialog\">\n");
      out.write("                <form action=\"LoginServlet\" method=\"POST\">\n");
      out.write("                    <div class=\"modal-content\">\n");
      out.write("                        <div class=\"modal-header\">\n");
      out.write("                            <h1 class=\"modal-title fs-4\" id=\"exampleModalLabel\">Welcome to HMS Hotel</h1>\n");
      out.write("                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-body\">\n");
      out.write("                            <p class=\"fs-5\">Sign in to your account</p>\n");
      out.write("                            <div class=\"mb-3\">\n");
      out.write("                                <label for=\"loginUsername\" class=\"form-label\">Username</label>\n");
      out.write("                                <input type=\"text\" name=\"login_username\" class=\"form-control\" id=\"loginUsername\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"mb-3\">\n");
      out.write("                                <label for=\"loginPassword\" class=\"form-label\">Password</label>\n");
      out.write("                                <input type=\"password\" name=\"login_password\" class=\"form-control\" id=\"loginPassword\">\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"modal-footer\">\n");
      out.write("                            <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Sign In</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
