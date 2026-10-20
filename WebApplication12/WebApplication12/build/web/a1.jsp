<%-- 
    Document   : a1
    Created on : Mar 12, 2021, 10:03:36 PM
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

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Staff Registration - Time Table Generation System</title>

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

        /* MAIN CONTAINER */

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
            font-size: 13px;
            font-weight: bold;
            padding: 15px 17px;
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

        /* FORM CARD */

        .form-card {
            width: 100%;
            max-width: 600px;
            margin: 0 auto;
            background: #ffffff;
            border: 1px solid #d9e3ec;
            border-radius: 6px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        /* FORM TITLE */

        .form-title {
            background: #003366;
            color: #ffffff;
            text-align: center;
            padding: 17px 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .form-body {
            padding: 30px;
        }

        /* FORM ROW */

        .form-row {
            display: grid;
            grid-template-columns: 160px 1fr;
            gap: 15px;
            align-items: center;
            margin-bottom: 18px;
        }

        .form-row label {
            color: #003366;
            font-size: 14px;
            font-weight: bold;
        }

        /* INPUTS */

        .form-row input[type="text"],
        .form-row select {
            width: 100%;
            height: 38px;
            padding: 7px 10px;
            border: 1px solid #c8d4df;
            border-radius: 4px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            outline: none;
            background: #ffffff;
        }

        .form-row input[type="text"]:focus,
        .form-row select:focus {
            border-color: #006699;
            box-shadow: 0 0 4px rgba(0,102,153,0.25);
        }

        /* BUTTONS */

        .button-row {
            text-align: center;
            padding-top: 10px;
            border-top: 1px solid #e1e7ec;
            margin-top: 10px;
        }

        .btn {
            border: none;
            padding: 10px 25px;
            margin: 5px;
            border-radius: 4px;
            color: #ffffff;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-submit {
            background: #003366;
        }

        .btn-submit:hover {
            background: #006699;
        }

        .btn-reset {
            background: #777777;
        }

        .btn-reset:hover {
            background: #555555;
        }

        /* MESSAGE */

        .message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            color: #006600;
            font-size: 14px;
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

        /* TABLET */

        @media screen and (max-width: 900px) {

            .navigation a {
                padding: 13px 12px;
                font-size: 12px;
            }

            .banner img {
                height: 220px;
            }

        }

        /* MOBILE */

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
                padding: 30px 15px;
            }

            .form-card {
                max-width: 100%;
            }

            .form-body {
                padding: 20px 15px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 7px;
                margin-bottom: 15px;
            }

            .form-row label {
                font-size: 13px;
            }

        }

        /* SMALL MOBILE */

        @media screen and (max-width: 480px) {

            .header h1 {
                font-size: 17px;
            }

            .banner img {
                height: 150px;
            }

            .form-title {
                font-size: 16px;
            }

            .btn {
                width: 110px;
                padding: 10px 15px;
            }

            .footer {
                font-size: 11px;
            }

        }

    </style>

</head>

<body>

<form action="staffreg" method="post">

<%
    String ss = (String)request.getAttribute("ok");
    String msg = "";

    if (ss != null) {
        msg = (String)request.getAttribute("msg");
    }
%>

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>TIME TABLE GENERATION SYSTEM</h1>

        <p>Administrator Management Portal</p>

    </div>


    <!-- BANNER -->

    <div class="banner">

        <img src="images/cloud-computing-banner1.jpg"
             alt="Time Table Generation System">

    </div>


    <!-- NAVIGATION -->

    <div class="navigation">

        <a href="admin.jsp">HOME</a>

        <a href="a1.jsp" class="active">STAFF REG</a>

        <a href="a2.jsp">STUDENT REG</a>

        <a href="a4.jsp">SEMESTER</a>

        <a href="a5.jsp">DEPARTMENT</a>

        <a href="a3.jsp">TIME TABLE GENERATION</a>

        <a href="a6.jsp">STAFF AVAILABLE</a>

        <a href="i1.jsp">LOGOUT</a>

    </div>


    <!-- CONTENT -->

    <div class="content">

        <div class="form-card">

            <div class="form-title">
                STAFF REGISTRATION
            </div>

            <div class="form-body">

                <!-- EMPLOYEE NUMBER -->

                <div class="form-row">

                    <label for="a2">
                        Employee No
                    </label>

                    <input type="text"
                           id="a2"
                           name="a2"
                           maxlength="50"
                           required>

                </div>


                <!-- NAME -->

                <div class="form-row">

                    <label for="a1">
                        Name
                    </label>

                    <input type="text"
                           id="a1"
                           name="a1"
                           maxlength="100"
                           required>

                </div>


                <!-- DEPARTMENT -->

                <div class="form-row">

                    <label for="a3">
                        Department
                    </label>

                    <select name="a3"
                            id="a3"
                            required>

<%
    String pro = null;

    Connection con1 = null;
    Statement st1 = null;
    ResultSet rs1 = null;

    try {

        String url1 =
            "jdbc:mysql://localhost:3306/student_db";

        Class.forName("com.mysql.jdbc.Driver");

        con1 = DriverManager.getConnection(
            url1,
            "root",
            "root"
        );

        st1 = con1.createStatement();

        rs1 = st1.executeQuery(
            "select distinct cname from acourse"
        );

        while (rs1.next()) {

            pro = rs1.getString(1);
%>

                        <option value="<%=pro%>">
                            <%=pro%>
                        </option>

<%
        }

    } catch(Exception e) {

        out.println(
            "<option>Error loading department</option>"
        );

    } finally {

        try {
            if (rs1 != null) rs1.close();
        } catch(Exception e) {}

        try {
            if (st1 != null) st1.close();
        } catch(Exception e) {}

        try {
            if (con1 != null) con1.close();
        } catch(Exception e) {}

    }
%>

                    </select>

                </div>


                <!-- BUTTONS -->

                <div class="button-row">

                    <input type="submit"
                           name="s1"
                           value="Submit"
                           class="btn btn-submit">

                    <input type="submit"
                           name="s2"
                           value="Reset"
                           class="btn btn-reset">

                </div>


                <!-- MESSAGE -->

                <% if (msg != null && msg.trim().length() > 0) { %>

                    <div class="message">
                        <%=msg%>
                    </div>

                <% } %>

            </div>

        </div>

    </div>


    <!-- FOOTER -->

    <div class="footer">

        © 2026 Time Table Generation System | All Rights Reserved

    </div>

</div>

</form>

</body>

</html>