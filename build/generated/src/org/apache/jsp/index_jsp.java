package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.mvc.dao.CustomerDAO;
import com.mvc.bean.CustomerBean;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.release();
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

    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        user_id = (Integer)session.getAttribute("user_id");
    }
    

      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      if (_jspx_meth_sql_setDataSource_0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Hotel Booking</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"./style.css\"/>\r\n");
      out.write("        \r\n");
      out.write("        <!-- bootstrap stuff -->\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM\" crossorigin=\"anonymous\">\r\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <div class=\"container-fluid text-center topNav\">\r\n");
      out.write("            <div class=\"row\">\r\n");
      out.write("                <div class=\"col-10\">\r\n");
      out.write("                    logo goes here\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-2\">\r\n");
      out.write("                    ");

                        if (user_id == 0) {
                    
      out.write("\r\n");
      out.write("                    <button type=\"button\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#loginModal\">\r\n");
      out.write("                        LOGIN / SIGN UP\r\n");
      out.write("                    </button>\r\n");
      out.write("                    ");

                        } else {
                        CustomerDAO customerDAO = new CustomerDAO();
                        CustomerBean customer = customerDAO.getCustomerDataUsingUserId(user_id);
                    
      out.write("\r\n");
      out.write("                    <div class=\"fs-5 mb-1 d-inline\">\r\n");
      out.write("                        ");
      out.print(customer.getCustomer_name());
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                    &emsp;\r\n");
      out.write("                    <a type=\"button\" class=\"btn btn-sm btn-secondary d-inline\" href=\"logout.do\">\r\n");
      out.write("                        LOG OUT\r\n");
      out.write("                    </a>\r\n");
      out.write("                    ");

                        }
                    
      out.write("\r\n");
      out.write("<!--                    <a href=\"login.jsp\">\r\n");
      out.write("                        <button class=\"btn btn-primary\">\r\n");
      out.write("                            LOGIN / SIGN UP\r\n");
      out.write("                        </button>\r\n");
      out.write("                    </a>-->\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"container-fluid text-center\" style=\"background:lightgray; padding: 20px;\">\r\n");
      out.write("            <form action=\"#\">\r\n");
      out.write("                <div class=\"row justify-content-center mb-2\">\r\n");
      out.write("                    <div class=\"col-md-5\">Dates</div>\r\n");
      out.write("                    <div class=\"col-md-4\">Rooms & Guests</div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"row justify-content-center\">\r\n");
      out.write("                    <div class=\"col-md-2\">\r\n");
      out.write("                        <input class=\"form-control\"  type=\"date\" name=\"dateStart\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-auto\">\r\n");
      out.write("                        &rarr;\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-2 border-right\">\r\n");
      out.write("                        <input class=\"form-control\"  type=\"date\" name=\"dateEnd\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-1\">\r\n");
      out.write("                        <input class=\"form-control\" style=\"//width:40px\" type=\"number\" name=\"roomCount\" value=\"1\"/>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-auto\">\r\n");
      out.write("                        Room,\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-1\">\r\n");
      out.write("                        <input class=\"form-control\" style=\"//width:40px\" type=\"number\" name=\"guestCount\" value=\"1\"/> \r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-auto\">\r\n");
      out.write("                        Pax\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <div class=\"col-md-1\">\r\n");
      out.write("                        <a href=\"reservation.jsp\">\r\n");
      out.write("                            <div class=\"btn btn-secondary\">\r\n");
      out.write("                                VIEW RATES\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </form>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div style=\"height:400px; overflow:clip\">\r\n");
      out.write("            <img src=\"./hotel-front.jpg\"\r\n");
      out.write("                 style=\"width:100%;object-position: 0px -135px;\"/>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"container mt-2\">\r\n");
      out.write("            <h3>Rooms and Suites</h3>\r\n");
      out.write("            <div class=\"row justify-content-center\">\r\n");
      out.write("                <div class=\"col-2 border\">\r\n");
      out.write("                    <img src=\"1-guesttwins.jpg\" style=\"width:100%\"/>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-2 border offset-1\">\r\n");
      out.write("                    <img src=\"2-guestking.jpg\" style=\"width:100%\"/>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-2 border offset-1\">\r\n");
      out.write("                    <img src=\"3-executiveking.jpg\" style=\"width:100%\"/>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"col-2 border offset-1\">\r\n");
      out.write("                    <img src=\"4-presidential.jpg\" style=\"width:100%\"/>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <!-- login -->\r\n");
      out.write("        <div class=\"modal fade\" id=\"loginModal\" tabindex=\"-1\" aria-labelledby=\"loginModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("            <div class=\"modal-dialog\">\r\n");
      out.write("                <form action=\"LoginServlet\" method=\"POST\">\r\n");
      out.write("                    <div class=\"modal-content\">\r\n");
      out.write("                        <div class=\"modal-header\">\r\n");
      out.write("                            <h1 class=\"modal-title fs-4\" id=\"exampleModalLabel\">Welcome to HMS Hotel</h1>\r\n");
      out.write("                            <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"modal-body\">\r\n");
      out.write("                            <p class=\"fs-5\">Sign in to your account</p>\r\n");
      out.write("                            <div class=\"mb-3\">\r\n");
      out.write("                                <label for=\"loginUsername\" class=\"form-label\">Username</label>\r\n");
      out.write("                                <input type=\"text\" name=\"login_username\" class=\"form-control\" id=\"loginUsername\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                            <div class=\"mb-3\">\r\n");
      out.write("                                <label for=\"loginPassword\" class=\"form-label\">Password</label>\r\n");
      out.write("                                <input type=\"password\" name=\"login_password\" class=\"form-control\" id=\"loginPassword\">\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"modal-footer\">\r\n");
      out.write("                            <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\r\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">Sign In</button>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
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

  private boolean _jspx_meth_sql_setDataSource_0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  sql:setDataSource
    org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag _jspx_th_sql_setDataSource_0 = (org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag) _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.get(org.apache.taglibs.standard.tag.rt.sql.SetDataSourceTag.class);
    _jspx_th_sql_setDataSource_0.setPageContext(_jspx_page_context);
    _jspx_th_sql_setDataSource_0.setParent(null);
    _jspx_th_sql_setDataSource_0.setVar("myDatasource");
    _jspx_th_sql_setDataSource_0.setDriver("org.apache.derby.jdbc.ClientDriver");
    _jspx_th_sql_setDataSource_0.setUrl("jdbc:derby://localhost:1527/CSC584_hotelManagementSystem");
    _jspx_th_sql_setDataSource_0.setUser("app");
    _jspx_th_sql_setDataSource_0.setPassword("app");
    int _jspx_eval_sql_setDataSource_0 = _jspx_th_sql_setDataSource_0.doStartTag();
    if (_jspx_th_sql_setDataSource_0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.reuse(_jspx_th_sql_setDataSource_0);
      return true;
    }
    _jspx_tagPool_sql_setDataSource_var_user_url_password_driver_nobody.reuse(_jspx_th_sql_setDataSource_0);
    return false;
  }
}
