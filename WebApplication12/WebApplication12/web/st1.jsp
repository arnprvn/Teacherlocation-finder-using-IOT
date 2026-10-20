<%-- 
    Document   : st1
    Created on : Mar 12, 2021, 10:28:06 PM
    Author     : WINDOWS 10
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Student Profile -Faculty Location Tracking</title>

    <link rel="stylesheet" type="text/css" href="style.css" />

    <script type="text/javascript"
            src="js/datetimepicker_css.js"></script>

    <script type="text/javascript"
            src="js/general.js"></script>

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
            font-size: 14px;
            font-weight: bold;
            padding: 15px 30px;
            display: block;
            transition: background 0.3s;
        }

        .navigation a:hover,
        .navigation a.active {
            background: #006699;
        }

        /* CONTENT */

        .content {
            padding: 35px 25px 45px 25px;
            min-height: 550px;
        }

        .welcome {
            text-align: center;
            color: #003366;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        /* PROFILE CARD */

        .profile-card {
            width: 100%;
            max-width: 650px;
            margin: 0 auto;
            background: #ffffff;
            border: 1px solid #d7e0e8;
            border-radius: 6px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.10);
            overflow: hidden;
        }

        .profile-title {
            background: #003366;
            color: #ffffff;
            text-align: center;
            padding: 16px;
            font-size: 18px;
            font-weight: bold;
        }

        .profile-body {
            padding: 25px 35px;
        }

        /* FORM */

        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .form-label {
            width: 42%;
            color: #333333;
            font-weight: bold;
            font-size: 14px;
        }

        .form-control {
            width: 58%;
        }

        .form-control input[type="text"],
        .form-control select {
            width: 100%;
            height: 38px;
            padding: 8px 10px;
            border: 1px solid #c8d2dc;
            border-radius: 4px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            background: #ffffff;
            outline: none;
        }

        .form-control input[type="text"]:focus,
        .form-control select:focus {
            border-color: #006699;
            box-shadow: 0 0 4px rgba(0,102,153,0.25);
        }

        .form-control input[readonly] {
            background: #f1f4f7;
            color: #555555;
            cursor: not-allowed;
        }

        /* DATE FIELD */

        .date-group {
            display: flex;
            align-items: center;
            width: 100%;
        }

        .date-group input {
            flex: 1;
        }

        .calendar-icon {
            margin-left: 8px;
            display: inline-block;
        }

        .calendar-icon img {
            width: 20px;
            height: 20px;
            border: 0;
            vertical-align: middle;
        }

        .error-message {
            color: #cc0000;
            font-size: 11px;
            margin-left: 5px;
        }

        /* BUTTONS */

        .button-area {
            text-align: center;
            padding-top: 15px;
            border-top: 1px solid #e1e6eb;
            margin-top: 20px;
        }

        .btn {
            border: none;
            padding: 11px 28px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            margin: 0 5px;
        }

        .btn-submit {
            background: #003366;
            color: #ffffff;
        }

        .btn-submit:hover {
            background: #006699;
        }

        .btn-reset {
            background: #777777;
            color: #ffffff;
        }

        .btn-reset:hover {
            background: #555555;
        }

        /* MESSAGE */

        .message {
            text-align: center;
            margin-top: 20px;
            color: #008000;
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
                padding: 25px 15px 35px 15px;
            }

            .profile-body {
                padding: 20px;
            }

            .form-row {
                display: block;
                margin-bottom: 18px;
            }

            .form-label {
                width: 100%;
                display: block;
                margin-bottom: 7px;
            }

            .form-control {
                width: 100%;
            }
        }

        /* MOBILE */

        @media screen and (max-width: 480px) {

            .header h1 {
                font-size: 17px;
            }

            .banner img {
                height: 150px;
            }

            .profile-title {
                font-size: 16px;
            }

            .profile-body {
                padding: 18px 15px;
            }

            .form-control input[type="text"],
            .form-control select {
                height: 36px;
                font-size: 13px;
            }

            .btn {
                width: 100%;
                margin: 5px 0;
            }

            .footer {
                font-size: 11px;
            }
        }

    </style>

</head>

<body>

<%
    String ok = (String) request.getAttribute("ok");
    String msg = "";

    if (ok != null) {
        msg = (String) request.getAttribute("msg");
    }

    String v = "";
    String v1 = "";
    String v2 = "";

    try {

        HttpSession so = request.getSession(true);

        String url = "jdbc:mysql://localhost:3306/student_db";

        Class.forName("com.mysql.jdbc.Driver");

        Connection con = DriverManager.getConnection(
                url,
                "root",
                "root"
        );

        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery(
                "select * from student where username='"
                + so.getAttribute("un")
                + "'"
        );

        if (rs.next()) {

            v = rs.getString(1);
            v1 = rs.getString(2);
            v2 = rs.getString(3);

        }

        rs.close();
        st.close();
        con.close();

    } catch (Exception e) {

        out.println(e);

    }
%>

<form action="personal" method="post">

    <div class="container">

        <!-- HEADER -->

        <div class="header">

            <h1>Faculty Location Tracking</h1>

            <p>Student Management Portal</p>

        </div>


        <!-- BANNER -->

        <div class="banner">

            <img src="images/cloud-computing-banner1.jpg"
                 alt="Student Performance System Banner">

        </div>


        <!-- NAVIGATION -->

        <div class="navigation">

            <a href="student.jsp">
                HOME
            </a>

            <a href="st1.jsp" class="active">
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


        <!-- CONTENT -->

        <div class="content">

            <div class="welcome">

                Welcome, <%=v1%>

            </div>


            <!-- PROFILE CARD -->

            <div class="profile-card">

                <div class="profile-title">

                    Personal Information

                </div>


                <div class="profile-body">


                    <!-- STUDENT ID -->

                    <div class="form-row">

                        <div class="form-label">
                            Student ID
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a1"
                                   value="<%=v%>"
                                   readonly="readonly">

                        </div>

                    </div>


                    <!-- NAME -->

                    <div class="form-row">

                        <div class="form-label">
                            Name
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a2"
                                   value="<%=v1%>"
                                   readonly="readonly">

                        </div>

                    </div>


                    <!-- DEPARTMENT -->

                    <div class="form-row">

                        <div class="form-label">
                            Department
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a3"
                                   value="<%=v2%>"
                                   readonly="readonly">

                        </div>

                    </div>


                    <!-- CLASS -->

                    <div class="form-row">

                        <div class="form-label">
                            Class
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a4">

                        </div>

                    </div>


                    <!-- DATE OF JOIN -->

                    <div class="form-row">

                        <div class="form-label">
                            Date of Join
                        </div>

                        <div class="form-control">

                            <div class="date-group">

                                <input type="text"
                                       id="a5"
                                       name="a5"
                                       class="displayValue"
                                       onChange="return val_zero('a5','err_a5');"
                                       onBlur="return txt_empty('a5','err_a5','Should Not Be Blank');">

                                <a class="calendar-icon"
                                   href="javascript:NewCssCal('a5','yyyymmdd')">

                                    <img src="images/cal.jpg"
                                         alt="Calendar">

                                </a>

                            </div>

                            <span id="err_a5"
                                  class="error-message"></span>

                        </div>

                    </div>


                    <!-- COMMUNICATION ADDRESS -->

                    <div class="form-row">

                        <div class="form-label">
                            Communication Address
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a6">

                        </div>

                    </div>


                    <!-- GENDER -->

                    <div class="form-row">

                        <div class="form-label">
                            Gender
                        </div>

                        <div class="form-control">

                            <select name="a7">

                                <option value="Select Gender">
                                    Select Gender
                                </option>

                                <option value="Male">
                                    Male
                                </option>

                                <option value="Female">
                                    Female
                                </option>

                            </select>

                        </div>

                    </div>


                    <!-- RELIGION -->

                    <div class="form-row">

                        <div class="form-label">
                            Religion
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a8">

                        </div>

                    </div>


                    <!-- NATIONALITY -->

                    <div class="form-row">

                        <div class="form-label">
                            Nationality
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a9">

                        </div>

                    </div>


                    <!-- DATE OF BIRTH -->

                    <div class="form-row">

                        <div class="form-label">
                            Date of Birth
                        </div>

                        <div class="form-control">

                            <div class="date-group">

                                <input type="text"
                                       id="a10"
                                       name="a10"
                                       class="displayValue"
                                       onChange="return val_zero('a10','err_a10');"
                                       onBlur="return txt_empty('a10','err_a10','Should Not Be Blank');">

                                <a class="calendar-icon"
                                   href="javascript:NewCssCal('a10','yyyymmdd')">

                                    <img src="images/cal.jpg"
                                         alt="Calendar">

                                </a>

                            </div>

                            <span id="err_a10"
                                  class="error-message"></span>

                        </div>

                    </div>


                    <!-- PHONE -->

                    <div class="form-row">

                        <div class="form-label">
                            Phone No.
                        </div>

                        <div class="form-control">

                            <input type="text"
                                   name="a11">

                        </div>

                    </div>


                    <!-- BUTTONS -->

                    <div class="button-area">

                        <input type="submit"
                               name="s1"
                               value="Submit"
                               class="btn btn-submit">

                        <input type="reset"
                               name="s2"
                               value="Cancel"
                               class="btn btn-reset">

                    </div>


                    <!-- MESSAGE -->

                    <div class="message">

                        <%=msg%>

                    </div>


                </div>

            </div>

        </div>


        <!-- FOOTER -->

        <div class="footer">

            © 2026 Student Performance System | All Rights Reserved

        </div>

    </div>

</form>

</body>
</html>