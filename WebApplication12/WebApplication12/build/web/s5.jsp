<%--  
    Document   : a5 
    Created on : Mar 12, 2021, 10:04:13 PM 
    Author     : WINDOWS 10 
--%> 

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <title>Staff Details - Time Table Generation System</title>

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

        /* HEADER */

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

        /* BANNER */

        .banner img {
            display: block;
            width: 100%;
            height: 280px;
            object-fit: cover;
        }

        /* NAVIGATION */

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
            font-size: 12px;
            font-weight: bold;
            padding: 15px 12px;
            display: block;
            transition: background 0.3s;
        }

        .navigation a:hover,
        .navigation a.active {
            background: #006699;
        }

        /* CONTENT */

        .content {
            padding: 40px 25px;
            min-height: 450px;
        }

        /* CARD */

        .table-card {
            width: 100%;
            max-width: 850px;
            margin: 0 auto;
            background: #ffffff;
            border: 1px solid #d8e0e8;
            border-radius: 6px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .table-title {
            background: #006699;
            color: #ffffff;
            text-align: center;
            padding: 16px 10px;
            font-size: 21px;
            font-weight: bold;
            letter-spacing: 0.5px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .staff-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 650px;
        }

        .staff-table th {
            background: #003366;
            color: #ffffff;
            padding: 13px 10px;
            text-align: center;
            font-size: 13px;
            font-weight: bold;
            border: 1px solid #d0d7de;
        }

        .staff-table td {
            padding: 13px 10px;
            text-align: center;
            font-size: 13px;
            border: 1px solid #d0d7de;
            background: #ffffff;
        }

        .staff-table tr:nth-child(even) td {
            background: #f5f8fb;
        }

        .staff-table tr:hover td {
            background: #e8f2f8;
        }

        .employee-id {
            font-weight: bold;
            color: #003366;
        }

        .staff-name {
            font-weight: bold;
            color: #333333;
        }

        .department {
            color: #555555;
        }

        /* STATUS */

        .status {
            display: inline-block;
            min-width: 95px;
            padding: 7px 12px;
            border-radius: 20px;
            color: #ffffff;
            font-size: 12px;
            font-weight: bold;
        }

        .available {
            background: #009933;
        }

        .not-available {
            background: #cc0000;
        }

        .message {
            text-align: center;
            padding: 15px;
            color: #cc0000;
            font-weight: bold;
        }

        /* FOOTER */

        .footer {
            background: #003366;
            color: #ffffff;
            text-align: center;
            padding: 18px 10px;
            font-size: 13px;
        }

        /* RESPONSIVE */

        @media screen and (max-width: 900px) {

            .navigation a {
                padding: 13px 10px;
                font-size: 11px;
            }

            .banner img {
                height: 220px;
            }

            .table-title {
                font-size: 19px;
            }
        }

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
                padding: 30px 12px;
            }

            .table-card {
                width: 100%;
            }

            .table-title {
                font-size: 18px;
            }
        }

        @media screen and (max-width: 480px) {

            .header h1 {
                font-size: 17px;
            }

            .banner img {
                height: 150px;
            }

            .content {
                padding: 20px 8px;
            }

            .table-title {
                font-size: 16px;
            }

            .footer {
                font-size: 11px;
            }
        }

    </style>

</head>

<body>

<form action="cost" method="post">

<%
    String ss = (String) request.getAttribute("ok");
    String msg = "";

    if (ss != null) {
        msg = (String) request.getAttribute("msg");
    }
%>

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>TIME TABLE GENERATION SYSTEM</h1>

        <p>Staff Availability &amp; Management Portal</p>

    </div>


    <!-- BANNER -->

    <div class="banner">

        <img src="images/cloud-computing-banner1.jpg"
             alt="Time Table Generation System">

    </div>


    <!-- NAVIGATION -->

    <div class="navigation">

     
                <a href="staff.jsp">HOME</a>
                <a href="s1.jsp">PROFILE</a>
                <a href="s5.jsp">Staff Status</a>
                <a href="s8.jsp">TIME TABLE DETAILS</a>
                <a href="i1.jsp">LOGOUT</a>
        

    </div>


    <!-- CONTENT -->

    <div class="content">

        <div class="table-card">

            <div class="table-title">
                STAFF DETAIL
            </div>


            <div class="table-wrapper">

                <table class="staff-table">

                    <thead>

                        <tr>

                            <th>EMPLOYEE ID</th>

                            <th>NAME</th>

                            <th>DEPARTMENT</th>

                            <th>STATUS</th>

                        </tr>

                    </thead>

                    <tbody>

<%
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
  HttpSession so = request.getSession(true);
        rs1 = st.executeQuery(
                "SELECT * FROM staff  where username='"
        + so.getAttribute("un")
        + "'"
        );

        while (rs1.next()) {

            String status = "Not available";

            if ("1".equals(rs1.getString(7))) {

                status = "Available";
%>

                        <tr>

                            <td class="employee-id">
                                <%=rs1.getString(1)%>
                            </td>

                            <td class="staff-name">
                                <%=rs1.getString(2)%>
                            </td>

                            <td class="department">
                                <%=rs1.getString(3)%>
                            </td>

                            <td>
                                <span class="status available">
                                    <%=status%>
                                </span>
                            </td>

                        </tr>

<%
            } else {
%>

                        <tr>

                            <td class="employee-id">
                                <%=rs1.getString(1)%>
                            </td>

                            <td class="staff-name">
                                <%=rs1.getString(2)%>
                            </td>

                            <td class="department">
                                <%=rs1.getString(3)%>
                            </td>

                            <td>
                                <span class="status not-available">
                                    <%=status%>
                                </span>
                            </td>

                        </tr>

<%
            }
        }

    } catch (Exception e) {

%>

                        <tr>

                            <td colspan="4"
                                class="message">

                                Database Error:
                                <%=e.getMessage()%>

                            </td>

                        </tr>

<%
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
%>

                    </tbody>

                </table>

            </div>

        </div>

    </div>


    <!-- FOOTER -->

    <div class="footer">

        &copy; 2026 Time Table Generation System
        | All Rights Reserved

    </div>

</div>

</form>

</body>
</html>