<%-- 
    Document   : student
    Created on : Mar 12, 2021, 10:27:59 PM
    Author     : WINDOWS 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type"
          content="text/html; charset=UTF-8">

    <title>Student Home - Faculty Location Tracking</title>

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

        /* ================= MAIN CONTAINER ================= */

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
            padding: 45px 25px;
            min-height: 450px;
            text-align: center;
        }

        .welcome-box {
            max-width: 850px;
            margin: 0 auto;
            padding: 35px 25px;
            border: 1px solid #e0e6eb;
            border-radius: 6px;
            background: #f9fbfd;
        }

        .welcome-box h2 {
            margin: 0 0 15px 0;
            color: #003366;
            font-size: 24px;
        }

        .welcome-box h3 {
            margin: 0 0 15px 0;
            color: #006699;
            font-size: 18px;
        }

        .welcome-box p {
            color: #555555;
            font-size: 15px;
            line-height: 1.7;
            margin: 10px 0;
        }

        .student-icon {
            width: 70px;
            height: 70px;
            margin: 0 auto 20px auto;
            background: #003366;
            border-radius: 50%;
            color: #ffffff;
            font-size: 32px;
            line-height: 70px;
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 28px;
            background: #003366;
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            border-radius: 4px;
        }

        .btn:hover {
            background: #006699;
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
                padding: 25px 10px;
            }

            .welcome-box {
                padding: 25px 15px;
            }

            .welcome-box h2 {
                font-size: 20px;
            }

            .welcome-box h3 {
                font-size: 16px;
            }

            .welcome-box p {
                font-size: 14px;
            }
        }

        @media screen and (max-width: 480px) {

            .header h1 {
                font-size: 17px;
            }

            .banner img {
                height: 150px;
            }

            .student-icon {
                width: 60px;
                height: 60px;
                line-height: 60px;
                font-size: 27px;
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

        <h1>Faculty Location Tracking</h1>

        <p>Student Management Portal</p>

    </div>


    <!-- ================= BANNER ================= -->

    <div class="banner">

        <img src="images/cloud-computing-banner1.jpg"
             alt="Student Performance System Banner">

    </div>


    <!-- ================= NAVIGATION ================= -->

    <div class="navigation">

        <a href="student.jsp" class="active">
            HOME
        </a>

        <a href="st1.jsp">
            PROFILE
        </a>  <a href="st2.jsp">
            STAFF STATUS
        </a>

        <a href="st6.jsp">
            TIME TABLE DETAILS
        </a>

        <a href="i1.jsp">
            LOGOUT
        </a>

    </div>


    <!-- ================= CONTENT ================= -->

    <div class="content">

        <div class="welcome-box">

            <div class="student-icon">
                S
            </div>

            <h2>
                WELCOME TO STUDENT PORTAL
            </h2>

            <h3>
                Faculty Location Tracking
            </h3>

            <p>
                Welcome to the Student Performance System.
            </p>

            <p>
                You can view your profile, check your timetable
                details and manage your student information
                through this portal.
            </p>

            <a href="st1.jsp" class="btn">
                VIEW MY PROFILE
            </a>

        </div>

    </div>


    <!-- ================= FOOTER ================= -->

    <div class="footer">

        © 2026 Student Performance System |
        All Rights Reserved

    </div>

</div>

</body>

</html>