<%-- 
    Document   : s8
    Created on : 29 Jan, 2024, 10:20:23 AM
    Author     : Win11
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Time Table - Student Performance System</title>

    <style type="text/css">

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: #eef3f8;
            font-family: Arial, Helvetica, sans-serif;
            color: #333333;
        }

        .container {
            width: 90%;
            max-width: 1100px;
            margin: 25px auto;
            background: #ffffff;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            border-radius: 5px;
            overflow: hidden;
        }

        /* ================= HEADER ================= */

        .header {
            background: #ffffff;
            text-align: center;
            padding: 20px 10px;
            border-bottom: 4px solid #003366;
        }

        .header h1 {
            margin: 0;
            color: #003366;
            font-size: 26px;
            font-weight: bold;
            font-style: italic;
            letter-spacing: 1px;
        }

        .header p {
            margin: 7px 0 0 0;
            color: #666666;
            font-size: 14px;
        }

        /* ================= BANNER ================= */

        .banner img {
            display: block;
            width: 100%;
            height: 280px;
            object-fit: cover;
        }

        /* ================= NAVIGATION ================= */

        .navigation {
            background: #003366;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
        }

        .navigation a {
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            padding: 15px 30px;
            display: block;
            transition: background 0.3s;
        }

        .navigation a:hover {
            background: #006699;
        }

        .navigation a.active {
            background: #006699;
        }

        /* ================= CONTENT ================= */

        .content {
            padding: 35px 25px 45px 25px;
            min-height: 450px;
        }

        .page-title {
            background: #006699;
            color: #ffffff;
            text-align: center;
            padding: 14px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
            margin-bottom: 25px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
            border: 1px solid #dddddd;
        }

        .timetable {
            width: 100%;
            min-width: 950px;
            border-collapse: collapse;
            background: #ffffff;
        }

        .timetable th {
            background: #003366;
            color: #ffffff;
            font-size: 13px;
            font-weight: bold;
            padding: 13px 8px;
            text-align: center;
            border: 1px solid #ffffff;
            white-space: nowrap;
        }

        .timetable td {
            padding: 12px 8px;
            text-align: center;
            font-size: 13px;
            color: #333333;
            border: 1px solid #dddddd;
            height: 45px;
        }

        .timetable tr:nth-child(even) {
            background: #f5f9fc;
        }

        .timetable tr:hover {
            background: #e8f3f8;
        }

        .day {
            font-weight: bold;
            color: #003366 !important;
        }

        .period {
            font-weight: bold;
            color: #006699 !important;
        }

        .no-record {
            text-align: center;
            padding: 25px;
            color: #777777;
            font-size: 14px;
        }

        /* ================= FOOTER ================= */

        .footer {
            background: #003366;
            color: #ffffff;
            text-align: center;
            padding: 18px 10px;
            font-size: 13px;
        }

        /* ================= RESPONSIVE ================= */

        @media screen and (max-width: 768px) {

            .container {
                width: 95%;
                margin: 10px auto;
            }

            .header {
                padding: 16px 8px;
            }

            .header h1 {
                font-size: 20px;
            }

            .header p {
                font-size: 12px;
            }

            .banner img {
                height: 180px;
            }

            .navigation {
                flex-direction: column;
                width: 100%;
            }

            .navigation a {
                width: 100%;
                text-align: center;
                padding: 12px;
                border-bottom: 1px solid rgba(255,255,255,0.15);
            }

            .content {
                padding: 20px 10px 30px 10px;
            }

            .page-title {
                font-size: 16px;
            }

            .timetable {
                min-width: 950px;
            }
        }

        @media screen and (max-width: 480px) {

            .header h1 {
                font-size: 17px;
            }

            .banner img {
                height: 150px;
            }

            .page-title {
                font-size: 14px;
                padding: 12px;
            }

            .footer {
                font-size: 11px;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <!-- ================= HEADER ================= -->

    <div class="header">

        <h1>STUDENT PERFORMANCE SYSTEM</h1>

        <p>Staff Management Portal</p>

    </div>


    <!-- ================= BANNER ================= -->

    <div class="banner">

        <img src="images/cloud-computing-banner1.jpg"
             alt="Student Performance System Banner">

    </div>


    <!-- ================= NAVIGATION ================= -->

    <div class="navigation">

                <a href="staff.jsp">HOME</a>
          
         
                <a href="s1.jsp">PROFILE</a>
         
                <a href="s5.jsp">Staff Status</a>
         
                <a href="s8.jsp">TIME TABLE DETAILS</a>
        
                <a href="i1.jsp">LOGOUT</a>
         
    </div>


    <!-- ================= CONTENT ================= -->

    <div class="content">

        <div class="page-title">
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

                        HttpSession so =
                            request.getSession(true);

                        String course =
                            String.valueOf(
                                so.getAttribute("un3")
                            );

                        rs1 = st.executeQuery(
                            "SELECT * FROM timetable WHERE course='"
                            + course +
                            "'"
                        );

                        int recordCount = 0;

                        while (rs1.next()) {

                            recordCount++;

                            String day = "";

                            if ("1".equals(rs1.getString(2))) {

                                day = "Monday";

                            } else if ("2".equals(rs1.getString(2))) {

                                day = "Tuesday";

                            } else if ("3".equals(rs1.getString(2))) {

                                day = "Wednesday";

                            } else if ("4".equals(rs1.getString(2))) {

                                day = "Thursday";

                            } else if ("5".equals(rs1.getString(2))) {

                                day = "Friday";

                            }

                %>

                    <tr>

                        <td class="day">
                            <%=day%>
                        </td>

                        <td>
                            <%=rs1.getString(3)%>
                        </td>

                        <td>
                            <%=rs1.getString(4)%>
                        </td>

                        <td class="period">
                            <%=rs1.getString(5)%>
                        </td>

                        <td class="period">
                            <%=rs1.getString(6)%>
                        </td>

                        <td class="period">
                            <%=rs1.getString(7)%>
                        </td>

                        <td class="period">
                            <%=rs1.getString(8)%>
                        </td>

                        <td class="period">
                            <%=rs1.getString(9)%>
                        </td>

                        <td class="period">
                            <%=rs1.getString(10)%>
                        </td>

                    </tr>

                <%

                        }

                        if (recordCount == 0) {

                %>

                    <tr>

                        <td colspan="9" class="no-record">

                            No timetable details found.

                        </td>

                    </tr>

                <%

                        }

                    } catch (Exception e) {

                %>

                    <tr>

                        <td colspan="9"
                            class="no-record">

                            Unable to load timetable details.

                        </td>

                    </tr>

                <%

                        e.printStackTrace();

                    } finally {

                        try {

                            if (rs1 != null)
                                rs1.close();

                        } catch (Exception e) {
                        }

                        try {

                            if (st != null)
                                st.close();

                        } catch (Exception e) {
                        }

                        try {

                            if (con != null)
                                con.close();

                        } catch (Exception e) {
                        }

                    }

                %>

                </tbody>

            </table>

        </div>

    </div>


    <!-- ================= FOOTER ================= -->

    <div class="footer">

        © 2026 Student Performance System | All Rights Reserved

    </div>

</div>

</body>
</html>