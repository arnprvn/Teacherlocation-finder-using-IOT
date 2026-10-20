<%-- 
    Document   : a4
    Created on : Mar 12, 2021, 10:04:05 PM
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

    <title>Semester Management - Time Table Generation System</title>

    <link rel="stylesheet"
          type="text/css"
          href="style.css" />

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
            font-size: 12px;
            font-weight: bold;
            padding: 15px 13px;
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
            min-height: 500px;
        }

        /* FORM CARD */

        .form-card {
            width: 100%;
            max-width: 650px;
            margin: 0 auto;
            background: #ffffff;
            border: 1px solid #d5dce5;
            border-radius: 6px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.10);
            overflow: hidden;
        }

        .form-title {
            background: #003366;
            color: #ffffff;
            text-align: center;
            padding: 15px 10px;
            font-size: 18px;
            font-weight: bold;
        }

        .form-body {
            padding: 25px 30px;
        }

        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 18px;
        }

        .form-label {
            width: 40%;
            font-weight: bold;
            color: #333333;
            font-size: 14px;
        }

        .form-field {
            width: 60%;
        }

        .form-field input[type="text"],
        .form-field select {
            width: 100%;
            max-width: 280px;
            padding: 10px 12px;
            border: 1px solid #bfc9d4;
            border-radius: 4px;
            font-size: 14px;
            background: #ffffff;
            color: #333333;
        }

        .form-field input[type="text"]:focus,
        .form-field select:focus {
            border-color: #006699;
            outline: none;
            box-shadow: 0 0 4px rgba(0,102,153,0.25);
        }

        /* BUTTONS */

        .button-row {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 25px;
            flex-wrap: wrap;
        }

        .btn {
            border: none;
            border-radius: 4px;
            padding: 11px 25px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-primary {
            background: #003366;
            color: #ffffff;
        }

        .btn-primary:hover {
            background: #006699;
        }

        .btn-secondary {
            background: #5c6f82;
            color: #ffffff;
        }

        .btn-secondary:hover {
            background: #3f5265;
        }

        /* MESSAGE */

        .message {
            margin-top: 20px;
            text-align: center;
            color: #006699;
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
                padding: 13px 10px;
                font-size: 11px;
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
                padding: 25px 12px;
            }

            .form-card {
                max-width: 100%;
            }

            .form-body {
                padding: 20px 15px;
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

            .form-field {
                width: 100%;
            }

            .form-field input[type="text"],
            .form-field select {
                width: 100%;
                max-width: 100%;
            }

            .button-row {
                display: block;
            }

            .btn {
                width: 100%;
                margin-bottom: 10px;
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

            .footer {
                font-size: 11px;
            }

            .form-title {
                font-size: 16px;
            }
        }

    </style>

</head>

<body>

<%
    String ss = (String)request.getAttribute("ok");
    String msg = "";

    if(ss != null)
    {
        msg = (String)request.getAttribute("msg");
    }
%>

<form action="course" method="post">

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>TIME TABLE GENERATION SYSTEM</h1>

        <p>Semester Management Portal</p>

    </div>


    <!-- BANNER -->

    <div class="banner">

        <img src="images/cloud-computing-banner1.jpg"
             alt="Time Table Generation System">

    </div>


    <!-- NAVIGATION -->

    <div class="navigation">

        <a href="admin.jsp">HOME</a>

        <a href="a1.jsp">STAFF REG</a>

        <a href="a2.jsp">STUDENT REG</a>

        <a href="a4.jsp" class="active">SEMESTER</a>

        <a href="a5.jsp">DEPARTMENT</a>

        <a href="a3.jsp">TIME TABLE GENERATION</a>

        <a href="a6.jsp">STAFF AVAILABLE</a>

        <a href="i1.jsp">LOGOUT</a>

    </div>


    <!-- CONTENT -->

    <div class="content">

        <div class="form-card">

            <div class="form-title">
                ADD SEMESTER DETAIL
            </div>

            <div class="form-body">


                <!-- SEMESTER ID -->

                <div class="form-row">

                    <div class="form-label">
                        Semester ID
                    </div>

                    <div class="form-field">

                        <input type="text"
                               name="a1"
                               placeholder="Enter Semester ID">

                    </div>

                </div>


                <!-- COURSE TYPE -->

                <%

                    String pro1 = null;

                    Connection con1 = null;
                    Statement st1 = null;
                    ResultSet rs1 = null;

                    try
                    {
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
                            "select distinct ctype from acourse"
                        );

                %>

                <div class="form-row">

                    <div class="form-label">
                        Course Type
                    </div>

                    <div class="form-field">

                        <select name="a2">

                            <%
                                while(rs1.next())
                                {
                                    pro1 = rs1.getString(1);
                            %>

                            <option value="<%=pro1%>">
                                <%=pro1%>
                            </option>

                            <%
                                }
                            %>

                        </select>

                    </div>

                </div>

                <%

                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                    finally
                    {
                        try
                        {
                            if(rs1 != null) rs1.close();
                        }
                        catch(Exception e)
                        {
                        }

                        try
                        {
                            if(st1 != null) st1.close();
                        }
                        catch(Exception e)
                        {
                        }

                        try
                        {
                            if(con1 != null) con1.close();
                        }
                        catch(Exception e)
                        {
                        }
                    }

                %>


                <!-- COURSE NAME -->

                <%

                    String pro = null;

                    Connection con2 = null;
                    Statement st2 = null;
                    ResultSet rs2 = null;

                    try
                    {
                        String url2 =
                            "jdbc:mysql://localhost:3306/student_db";

                        Class.forName("com.mysql.jdbc.Driver");

                        con2 = DriverManager.getConnection(
                            url2,
                            "root",
                            "root"
                        );

                        st2 = con2.createStatement();

                        rs2 = st2.executeQuery(
                            "select distinct cname from acourse"
                        );

                %>

                <div class="form-row">

                    <div class="form-label">
                        Course Name
                    </div>

                    <div class="form-field">

                        <select name="a3">

                            <%
                                while(rs2.next())
                                {
                                    pro = rs2.getString(1);
                            %>

                            <option value="<%=pro%>">
                                <%=pro%>
                            </option>

                            <%
                                }
                            %>

                        </select>

                    </div>

                </div>

                <%

                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                    finally
                    {
                        try
                        {
                            if(rs2 != null) rs2.close();
                        }
                        catch(Exception e)
                        {
                        }

                        try
                        {
                            if(st2 != null) st2.close();
                        }
                        catch(Exception e)
                        {
                        }

                        try
                        {
                            if(con2 != null) con2.close();
                        }
                        catch(Exception e)
                        {
                        }
                    }

                %>


                <!-- SEMESTER NAME -->

                <div class="form-row">

                    <div class="form-label">
                        Semester Name
                    </div>

                    <div class="form-field">

                        <select name="a4">

                            <option value="Select the Semester">
                                Select the Semester
                            </option>

                            <option value="Semester1">
                                Semester 1
                            </option>

                            <option value="Semester2">
                                Semester 2
                            </option>

                            <option value="Semester3">
                                Semester 3
                            </option>

                            <option value="Semester4">
                                Semester 4
                            </option>

                            <option value="Semester5">
                                Semester 5
                            </option>

                            <option value="Semester6">
                                Semester 6
                            </option>

                            <option value="Semester7">
                                Semester 7
                            </option>

                            <option value="Semester8">
                                Semester 8
                            </option>

                        </select>

                    </div>

                </div>


                <!-- SUBJECT NAME -->

                <div class="form-row">

                    <div class="form-label">
                        Subject Name
                    </div>

                    <div class="form-field">

                        <input type="text"
                               name="a5"
                               placeholder="Enter Subject Name">

                    </div>

                </div>


                <!-- BUTTONS -->

                <div class="button-row">

                    <input type="submit"
                           name="s1"
                           value="Insert"
                           class="btn btn-primary">

                    <input type="submit"
                           name="s2"
                           value="View"
                           class="btn btn-secondary">

                </div>


                <!-- MESSAGE -->

                <%
                    if(msg != null && msg.trim().length() > 0)
                    {
                %>

                <div class="message">
                    <%=msg%>
                </div>

                <%
                    }
                %>


            </div>

        </div>

    </div>


    <!-- FOOTER -->

    <div class="footer">

        © 2026 Time Table Generation System
        | All Rights Reserved

    </div>

</div>

</form>

</body>
</html>