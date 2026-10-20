<%-- 
    Document   : st6
    Created on : 29 Jan, 2024, 10:23:40 AM
    Author     : Win11
--%>

<%@page import="java.io.IOException"%>
<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.jdbc.JDBCCategoryDataset"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Time Table - Faculty Location Tracking</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        background: #eef3f8;
        color: #333;
    }

    .container {
        width: 90%;
        max-width: 1100px;
        margin: 20px auto;
        background: #ffffff;
        box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    }

    /* HEADER */
    .header {
        background: #ffffff;
        padding: 22px;
        text-align: center;
        border-bottom: 4px solid #003366;
    }

    .header h1 {
        color: #003366;
        font-size: 30px;
        font-weight: bold;
        letter-spacing: 1px;
    }

    .header p {
        color: #777;
        margin-top: 8px;
        font-size: 14px;
    }

    /* BANNER */
    .banner {
        width: 100%;
        height: 280px;
        overflow: hidden;
    }

    .banner img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        display: block;
    }

    /* NAVIGATION */
    .navbar {
        background: #003366;
    }

    .navbar ul {
        list-style: none;
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }

    .navbar ul li {
        margin: 0;
    }

    .navbar ul li a {
        display: block;
        padding: 16px 20px;
        color: #ffffff;
        text-decoration: none;
        font-weight: bold;
        font-size: 13px;
        transition: 0.3s;
    }

    .navbar ul li a:hover {
        background: #00509e;
    }

    /* MAIN CONTENT */
    .content {
        min-height: 500px;
        padding: 40px 25px;
    }

    .page-heading {
        text-align: center;
        margin-bottom: 25px;
    }

    .page-heading h2 {
        color: #003366;
        font-size: 27px;
        margin-bottom: 8px;
    }

    .page-heading p {
        color: #666;
        font-size: 15px;
    }

    /* TIMETABLE BOX */
    .timetable-box {
        width: 100%;
        background: #ffffff;
        border: 1px solid #d9e2ec;
        border-radius: 5px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        overflow: hidden;
    }

    .timetable-title {
        background: #003366;
        color: #ffffff;
        text-align: center;
        padding: 16px;
        font-size: 18px;
        font-weight: bold;
    }

    .table-wrapper {
        width: 100%;
        overflow-x: auto;
        padding: 20px;
    }

    .timetable {
        width: 100%;
        min-width: 850px;
        border-collapse: collapse;
        font-size: 13px;
    }

    .timetable th {
        background: #003366;
        color: #ffffff;
        padding: 13px 8px;
        border: 1px solid #d0d7de;
        text-align: center;
        white-space: nowrap;
    }

    .timetable td {
        padding: 12px 8px;
        border: 1px solid #d0d7de;
        text-align: center;
        color: #333;
        background: #ffffff;
    }

    .timetable tr:nth-child(even) td {
        background: #f5f8fb;
    }

    .timetable tr:hover td {
        background: #e8f1fa;
    }

    .day-cell {
        color: #003366;
        font-weight: bold;
    }

    /* FOOTER */
    .footer {
        background: #003366;
        color: #ffffff;
        text-align: center;
        padding: 18px;
        font-size: 14px;
    }

    /* MOBILE */
    @media screen and (max-width: 768px) {

        .container {
            width: 95%;
            margin: 10px auto;
        }

        .header h1 {
            font-size: 22px;
        }

        .banner {
            height: 180px;
        }

        .navbar ul {
            flex-direction: column;
        }

        .navbar ul li a {
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        .content {
            padding: 30px 15px;
        }

        .page-heading h2 {
            font-size: 22px;
        }

        .table-wrapper {
            padding: 10px;
        }
    }
</style>

</head> <body> <form action="sv2" method="post"> <div class="container">
<!-- HEADER -->
<div class="header">
    <h1>Faculty Location Tracking</h1>
    <p>Student Academic Management Portal</p>
</div>

<!-- BANNER -->
<div class="banner">
    <img src="images/cloud-computing-banner1.jpg"
         alt="Student Performance System">
</div>

<!-- NAVIGATION -->
<div class="navbar">
       <div class="navigation">

        <a href="student.jsp" class="active">
            HOME
        </a>

        <a href="st1.jsp">
            PROFILE
        </a>
  <a href="st2.jsp">
            STAFF STATUS
        </a>
        <a href="st6.jsp">
            TIME TABLE DETAILS
        </a>

        <a href="i1.jsp">
            LOGOUT
        </a>

    </div>
</div>

<!-- MAIN CONTENT -->
<div class="content">

    <div class="page-heading">
        <h2>Student Time Table</h2>
        <p>View your course and daily period schedule</p>
    </div>

    <div class="timetable-box">

        <div class="timetable-title">
            TIME TABLE GENERATED
        </div>

        <div class="table-wrapper">

            <table class="timetable">

                <thead>
                    <tr>
                        <th>DAY</th>
                        <th>COURSE</th>
                        <th>SEMESTER</th>
                        <th>PERIOD 1</th>
                        <th>PERIOD 2</th>
                        <th>PERIOD 3</th>
                        <th>PERIOD 4</th>
                        <th>PERIOD 5</th>
                        <th>PERIOD 6</th>
                    </tr>
                </thead>

                <tbody>

                <%
                    String a11 = (String) request.getAttribute("a1");
                    String a12 = (String) request.getAttribute("a2");

                    try {

                        int flag = 0;
                        String max = null;
                        int vt = 0;
                        int vt1 = 0;

                        String url =
                            "jdbc:mysql://localhost:3306/student_db";

                        Class.forName("com.mysql.jdbc.Driver");

                        Connection con =
                            DriverManager.getConnection(
                                url,
                                "root",
                                "root"
                            );

                        Statement st = con.createStatement();
                        Statement st1 = con.createStatement();

                        HttpSession so =
                            request.getSession(true);

                        String a1 = "";
                        String a2 = "";
                        String a3 = "";
                        String a4 = "";
                        String a5 = "";
                        String a6 = "";

                        ResultSet rs1 =
                            st.executeQuery(
                                "SELECT * FROM timetable WHERE course='"
                                + so.getAttribute("un3")
                                + "'"
                            );

                        while(rs1.next()) {

                %>

                    <tr>

                        <%
                            if(rs1.getString(2).equals("1")) {
                                a1 = "Monday";
                            }
                            else if(rs1.getString(2).equals("2")) {
                                a1 = "Tuesday";
                            }
                            else if(rs1.getString(2).equals("3")) {
                                a1 = "Wednesday";
                            }
                            else if(rs1.getString(2).equals("4")) {
                                a1 = "Thursday";
                            }
                            else if(rs1.getString(2).equals("5")) {
                                a1 = "Friday";
                            }
                            else {
                                a1 = "";
                            }
                        %>

                        <td class="day-cell">
                            <%=a1%>
                        </td>

                        <td>
                            <%=rs1.getString(3)%>
                        </td>

                        <td>
                            <%=rs1.getString(4)%>
                        </td>

                        <td>
                            <%=rs1.getString(5)%>
                        </td>

                        <td>
                            <%=rs1.getString(6)%>
                        </td>

                        <td>
                            <%=rs1.getString(7)%>
                        </td>

                        <td>
                            <%=rs1.getString(8)%>
                        </td>

                        <td>
                            <%=rs1.getString(9)%>
                        </td>

                        <td>
                            <%=rs1.getString(10)%>
                        </td>

                    </tr>

                <%
                        }

                    }
                    catch(Exception e) {

                        out.println(e);

                    }
                %>

                </tbody>

            </table>

        </div>

    </div>

</div>

<!-- FOOTER -->
<div class="footer">
    © 2026 Student Performance System | All Rights Reserved
</div>

</div> </form> </body> </html>