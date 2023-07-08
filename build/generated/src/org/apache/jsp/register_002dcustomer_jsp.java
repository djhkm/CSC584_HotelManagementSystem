package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_002dcustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Register (Customer)</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <h1>Register (Customer)</h1>\r\n");
      out.write("        <a href=\"index.jsp\">Back</a>\r\n");
      out.write("        <br><br>\r\n");
      out.write("        <form action=\"RegisterCustomerServlet\" method=\"POST\">\r\n");
      out.write("            <table border=\"0\">\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td colspan=\"2\"><b>Personal Details</b></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>Honorific: </td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <select name=\"customer_honorific\">\r\n");
      out.write("                                <option value=\"Mr.\">Mr.</option>\r\n");
      out.write("                                <option value=\"Mrs.\">Mrs.</option>\r\n");
      out.write("                                <option value=\"Miss.\">Miss.</option>\r\n");
      out.write("                                <option value=\"Ms.\">Ms.</option>\r\n");
      out.write("                            </select>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>Name: </td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <input type=\"text\" name=\"customer_name\" required>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>Email: </td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <input type=\"email\" name=\"customer_email\" required>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>Phone Number: </td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <input type=\"tel\" name=\"customer_phoneNumber\" placeholder=\"01234567890\" required>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td colspan=\"2\"><b>Login Credential</b></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>Username: </td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <input type=\"text\" name=\"customer_username\" required>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>Password: </td>\r\n");
      out.write("                        <td>\r\n");
      out.write("                            <input type=\"password\" name=\"customer_password\" required>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td colspan=\"2\"></td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td colspan=\"2\">\r\n");
      out.write("                <center><input type=\"submit\" name=\"Register\"></center>\r\n");
      out.write("                        </td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("        </form>\r\n");
      out.write("        ");
 if(request.getAttribute("errMessage")!= null) { 
      out.write("\r\n");
      out.write("        <span style=\"font-size: 14px; color: red;\">\r\n");
      out.write("            ");
      out.print( request.getAttribute("errMessage") );
      out.write("\r\n");
      out.write("        </span>\r\n");
      out.write("        ");
 } 
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
