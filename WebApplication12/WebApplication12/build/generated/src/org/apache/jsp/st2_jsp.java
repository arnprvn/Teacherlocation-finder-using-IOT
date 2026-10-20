package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class st2_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\n");
      out.write("    <meta http-equiv=\"Content-Type\"\n");
      out.write("          content=\"text/html; charset=UTF-8\">\n");
      out.write("\n");
      out.write("    <title>Staff Details - Time Table Generation System</title>\n");
      out.write("\n");
      out.write("    <style type=\"text/css\">\n");
      out.write("\n");
      out.write("        * {\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        body {\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            background: #eef3f8;\n");
      out.write("            font-family: Arial, Helvetica, sans-serif;\n");
      out.write("            color: #333333;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .container {\n");
      out.write("            width: 90%;\n");
      out.write("            max-width: 1100px;\n");
      out.write("            margin: 25px auto;\n");
      out.write("            background: #ffffff;\n");
      out.write("            box-shadow: 0 4px 15px rgba(0,0,0,0.15);\n");
      out.write("            border-radius: 5px;\n");
      out.write("            overflow: hidden;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* HEADER */\n");
      out.write("\n");
      out.write("        .header {\n");
      out.write("            background: #ffffff;\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 20px 10px;\n");
      out.write("            border-bottom: 4px solid #003366;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .header h1 {\n");
      out.write("            margin: 0;\n");
      out.write("            color: #003366;\n");
      out.write("            font-size: 26px;\n");
      out.write("            font-weight: bold;\n");
      out.write("            font-style: italic;\n");
      out.write("            letter-spacing: 1px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .header p {\n");
      out.write("            margin: 7px 0 0 0;\n");
      out.write("            color: #666666;\n");
      out.write("            font-size: 14px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* BANNER */\n");
      out.write("\n");
      out.write("        .banner img {\n");
      out.write("            display: block;\n");
      out.write("            width: 100%;\n");
      out.write("            height: 280px;\n");
      out.write("            object-fit: cover;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* NAVIGATION */\n");
      out.write("\n");
      out.write("        .navigation {\n");
      out.write("            background: #003366;\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: center;\n");
      out.write("            flex-wrap: wrap;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .navigation a {\n");
      out.write("            color: #ffffff;\n");
      out.write("            text-decoration: none;\n");
      out.write("            font-size: 12px;\n");
      out.write("            font-weight: bold;\n");
      out.write("            padding: 15px 12px;\n");
      out.write("            display: block;\n");
      out.write("            transition: background 0.3s;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .navigation a:hover,\n");
      out.write("        .navigation a.active {\n");
      out.write("            background: #006699;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* CONTENT */\n");
      out.write("\n");
      out.write("        .content {\n");
      out.write("            padding: 40px 25px;\n");
      out.write("            min-height: 450px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* CARD */\n");
      out.write("\n");
      out.write("        .table-card {\n");
      out.write("            width: 100%;\n");
      out.write("            max-width: 850px;\n");
      out.write("            margin: 0 auto;\n");
      out.write("            background: #ffffff;\n");
      out.write("            border: 1px solid #d8e0e8;\n");
      out.write("            border-radius: 6px;\n");
      out.write("            box-shadow: 0 3px 10px rgba(0,0,0,0.08);\n");
      out.write("            overflow: hidden;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table-title {\n");
      out.write("            background: #006699;\n");
      out.write("            color: #ffffff;\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 16px 10px;\n");
      out.write("            font-size: 21px;\n");
      out.write("            font-weight: bold;\n");
      out.write("            letter-spacing: 0.5px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .table-wrapper {\n");
      out.write("            width: 100%;\n");
      out.write("            overflow-x: auto;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .staff-table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            min-width: 650px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .staff-table th {\n");
      out.write("            background: #003366;\n");
      out.write("            color: #ffffff;\n");
      out.write("            padding: 13px 10px;\n");
      out.write("            text-align: center;\n");
      out.write("            font-size: 13px;\n");
      out.write("            font-weight: bold;\n");
      out.write("            border: 1px solid #d0d7de;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .staff-table td {\n");
      out.write("            padding: 13px 10px;\n");
      out.write("            text-align: center;\n");
      out.write("            font-size: 13px;\n");
      out.write("            border: 1px solid #d0d7de;\n");
      out.write("            background: #ffffff;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .staff-table tr:nth-child(even) td {\n");
      out.write("            background: #f5f8fb;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .staff-table tr:hover td {\n");
      out.write("            background: #e8f2f8;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-id {\n");
      out.write("            font-weight: bold;\n");
      out.write("            color: #003366;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .staff-name {\n");
      out.write("            font-weight: bold;\n");
      out.write("            color: #333333;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .department {\n");
      out.write("            color: #555555;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* STATUS */\n");
      out.write("\n");
      out.write("        .status {\n");
      out.write("            display: inline-block;\n");
      out.write("            min-width: 95px;\n");
      out.write("            padding: 7px 12px;\n");
      out.write("            border-radius: 20px;\n");
      out.write("            color: #ffffff;\n");
      out.write("            font-size: 12px;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .available {\n");
      out.write("            background: #009933;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .not-available {\n");
      out.write("            background: #cc0000;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .message {\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 15px;\n");
      out.write("            color: #cc0000;\n");
      out.write("            font-weight: bold;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* FOOTER */\n");
      out.write("\n");
      out.write("        .footer {\n");
      out.write("            background: #003366;\n");
      out.write("            color: #ffffff;\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 18px 10px;\n");
      out.write("            font-size: 13px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* RESPONSIVE */\n");
      out.write("\n");
      out.write("        @media screen and (max-width: 900px) {\n");
      out.write("\n");
      out.write("            .navigation a {\n");
      out.write("                padding: 13px 10px;\n");
      out.write("                font-size: 11px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .banner img {\n");
      out.write("                height: 220px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table-title {\n");
      out.write("                font-size: 19px;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @media screen and (max-width: 768px) {\n");
      out.write("\n");
      out.write("            .container {\n");
      out.write("                width: 95%;\n");
      out.write("                margin: 10px auto;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header {\n");
      out.write("                padding: 16px 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header h1 {\n");
      out.write("                font-size: 20px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header p {\n");
      out.write("                font-size: 12px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .banner img {\n");
      out.write("                height: 180px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .navigation {\n");
      out.write("                flex-direction: column;\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .navigation a {\n");
      out.write("                width: 100%;\n");
      out.write("                text-align: center;\n");
      out.write("                padding: 12px;\n");
      out.write("                border-bottom: 1px solid rgba(255,255,255,0.15);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content {\n");
      out.write("                padding: 30px 12px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table-card {\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table-title {\n");
      out.write("                font-size: 18px;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @media screen and (max-width: 480px) {\n");
      out.write("\n");
      out.write("            .header h1 {\n");
      out.write("                font-size: 17px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .banner img {\n");
      out.write("                height: 150px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .content {\n");
      out.write("                padding: 20px 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .table-title {\n");
      out.write("                font-size: 16px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .footer {\n");
      out.write("                font-size: 11px;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<form action=\"cost\" method=\"post\">\n");
      out.write("\n");

    String ss = (String) request.getAttribute("ok");
    String msg = "";

    if (ss != null) {
        msg = (String) request.getAttribute("msg");
    }

      out.write("\n");
      out.write("\n");
      out.write("<div class=\"container\">\n");
      out.write("\n");
      out.write("    <!-- HEADER -->\n");
      out.write("\n");
      out.write("    <div class=\"header\">\n");
      out.write("\n");
      out.write("        <h1>TIME TABLE GENERATION SYSTEM</h1>\n");
      out.write("\n");
      out.write("        <p>Staff Availability &amp; Management Portal</p>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- BANNER -->\n");
      out.write("\n");
      out.write("    <div class=\"banner\">\n");
      out.write("\n");
      out.write("        <img src=\"images/cloud-computing-banner1.jpg\"\n");
      out.write("             alt=\"Time Table Generation System\">\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- NAVIGATION -->\n");
      out.write("\n");
      out.write("    <div class=\"navigation\">\n");
      out.write("\n");
      out.write("        <a href=\"student.jsp\" class=\"active\">\n");
      out.write("            HOME\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <a href=\"st1.jsp\">\n");
      out.write("            PROFILE\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <a href=\"st6.jsp\">\n");
      out.write("            TIME TABLE DETAILS\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <a href=\"i1.jsp\">\n");
      out.write("            LOGOUT\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- CONTENT -->\n");
      out.write("\n");
      out.write("    <div class=\"content\">\n");
      out.write("\n");
      out.write("        <div class=\"table-card\">\n");
      out.write("\n");
      out.write("            <div class=\"table-title\">\n");
      out.write("                STAFF DETAIL\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <div class=\"table-wrapper\">\n");
      out.write("\n");
      out.write("                <table class=\"staff-table\">\n");
      out.write("\n");
      out.write("                    <thead>\n");
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("\n");
      out.write("                            <th>EMPLOYEE ID</th>\n");
      out.write("\n");
      out.write("                            <th>NAME</th>\n");
      out.write("\n");
      out.write("                            <th>DEPARTMENT</th>\n");
      out.write("\n");
      out.write("                            <th>STATUS</th>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("\n");
      out.write("                    </thead>\n");
      out.write("\n");
      out.write("                    <tbody>\n");
      out.write("\n");

    Connection con = null;
    Statement st = null;
    ResultSet rs1 = null;

    try {

        String url =
            "jdbc:mysql://localhost:3306/student_db";

        Class.forName("com.mysql.jdbc.Driver");

        con = DriverManager.getConnection(
                url,
                "root",
                "root"
        );

        st = con.createStatement();

        rs1 = st.executeQuery(
                "SELECT * FROM staff"
        );

        while (rs1.next()) {

            String status = "Not available";

            if ("1".equals(rs1.getString(7))) {

                status = "Available";

      out.write("\n");
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("\n");
      out.write("                            <td class=\"employee-id\">\n");
      out.write("                                ");
      out.print(rs1.getString(1));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                            <td class=\"staff-name\">\n");
      out.write("                                ");
      out.print(rs1.getString(2));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                            <td class=\"department\">\n");
      out.write("                                ");
      out.print(rs1.getString(3));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                            <td>\n");
      out.write("                                <span class=\"status available\">\n");
      out.write("                                    ");
      out.print(status);
      out.write("\n");
      out.write("                                </span>\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("\n");

            } else {

      out.write("\n");
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("\n");
      out.write("                            <td class=\"employee-id\">\n");
      out.write("                                ");
      out.print(rs1.getString(1));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                            <td class=\"staff-name\">\n");
      out.write("                                ");
      out.print(rs1.getString(2));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                            <td class=\"department\">\n");
      out.write("                                ");
      out.print(rs1.getString(3));
      out.write("\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                            <td>\n");
      out.write("                                <span class=\"status not-available\">\n");
      out.write("                                    ");
      out.print(status);
      out.write("\n");
      out.write("                                </span>\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("\n");

            }
        }

    } catch (Exception e) {


      out.write("\n");
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("\n");
      out.write("                            <td colspan=\"4\"\n");
      out.write("                                class=\"message\">\n");
      out.write("\n");
      out.write("                                Database Error:\n");
      out.write("                                ");
      out.print(e.getMessage());
      out.write("\n");
      out.write("\n");
      out.write("                            </td>\n");
      out.write("\n");
      out.write("                        </tr>\n");
      out.write("\n");

    } finally {

        try {
            if (rs1 != null) {
                rs1.close();
            }
        } catch (Exception e) {
        }

        try {
            if (st != null) {
                st.close();
            }
        } catch (Exception e) {
        }

        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
        }
    }

      out.write("\n");
      out.write("\n");
      out.write("                    </tbody>\n");
      out.write("\n");
      out.write("                </table>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- FOOTER -->\n");
      out.write("\n");
      out.write("    <div class=\"footer\">\n");
      out.write("\n");
      out.write("        &copy; 2026 Time Table Generation System\n");
      out.write("        | All Rights Reserved\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</form>\n");
      out.write("\n");
      out.write("</body>\n");
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
