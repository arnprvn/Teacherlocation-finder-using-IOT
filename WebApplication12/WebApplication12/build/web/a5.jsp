<%-- 
    Document   : a5
    Created on : Mar 12, 2021, 10:04:13 PM
    Author     : WINDOWS 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <title>Department Management - Time Table Generation System</title>

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
            padding: 45px 25px;
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
            padding: 30px;
        }

        /* FORM ROW */

        .form-row {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
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

        /* INPUT */

        .form-field input[type="text"] {
            width: 100%;
            max-width: 300px;
            padding: 10px 12px;
            border: 1px solid #bfc9d4;
            border-radius: 4px;
            font-size: 14px;
            color: #333333;
            background: #ffffff;
        }

        .form-field input[type="text"]:focus {
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
            padding: 11px 28px;
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
            padding: 10px;
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

            .form-field input[type="text"] {
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

            .form-title {
                font-size: 16px;
            }

            .footer {
                font-size: 11px;
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

<form action="cost" method="post">

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>TIME TABLE GENERATION SYSTEM</h1>

        <p>Department Management Portal</p>

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

        <a href="a4.jsp">SEMESTER</a>

        <a href="a5.jsp" class="active">DEPARTMENT</a>

        <a href="a3.jsp">TIME TABLE GENERATION</a>

        <a href="a6.jsp">STAFF AVAILABLE</a>

        <a href="i1.jsp">LOGOUT</a>

    </div>


    <!-- CONTENT -->

    <div class="content">

        <div class="form-card">

            <div class="form-title">
                DEPARTMENT
            </div>

            <div class="form-body">


                <!-- ID -->

                <div class="form-row">

                    <div class="form-label">
                        ID
                    </div>

                    <div class="form-field">

                        <input type="text"
                               name="a1"
                               placeholder="Enter Department ID">

                    </div>

                </div>


                <!-- COURSE TYPE -->

                <div class="form-row">

                    <div class="form-label">
                        Course Type
                    </div>

                    <div class="form-field">

                        <input type="text"
                               name="a2"
                               placeholder="Enter Course Type">

                    </div>

                </div>


                <!-- COURSE NAME -->

                <div class="form-row">

                    <div class="form-label">
                        Course Name
                    </div>

                    <div class="form-field">

                        <input type="text"
                               name="a3"
                               placeholder="Enter Course Name">

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
                    if(msg != null &&
                       msg.trim().length() > 0)
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