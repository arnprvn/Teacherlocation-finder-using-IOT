<%-- 
    Document   : admin
    Created on : Mar 12, 2021, 10:03:28 PM
    Author     : WINDOWS 10
--%>

<%-- 
    Document   : admin
    Created on : Mar 12, 2021, 10:03:28 PM
    Author     : WINDOWS 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Time Table Generation System - Admin</title>

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
            padding: 45px 25px;
            min-height: 450px;
        }

        /* WELCOME BOX */
        .welcome-box {
            max-width: 850px;
            margin: 0 auto;
            text-align: center;
            background: #f7fafd;
            border: 1px solid #d9e3ec;
            border-left: 5px solid #003366;
            padding: 35px 25px;
            border-radius: 6px;
        }

        .admin-icon {
            width: 75px;
            height: 75px;
            line-height: 75px;
            margin: 0 auto 20px auto;
            border-radius: 50%;
            background: #003366;
            color: #ffffff;
            font-size: 32px;
            font-weight: bold;
        }

        .welcome-box h2 {
            margin: 0 0 12px 0;
            color: #003366;
            font-size: 25px;
        }

        .welcome-box p {
            margin: 0 auto 25px auto;
            max-width: 700px;
            color: #666666;
            font-size: 15px;
            line-height: 1.7;
        }

        /* MODULE CARDS */
        .modules {
            max-width: 900px;
            margin: 30px auto 0 auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
        }

        .module-card {
            background: #ffffff;
            border: 1px solid #dce5ed;
            border-top: 4px solid #003366;
            padding: 22px 15px;
            text-align: center;
            border-radius: 5px;
            transition: 0.3s;
        }

        .module-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.12);
        }

        .module-card h3 {
            margin: 0 0 8px 0;
            color: #003366;
            font-size: 16px;
        }

        .module-card p {
            margin: 0 0 15px 0;
            color: #777777;
            font-size: 13px;
            line-height: 1.5;
        }

        .module-card a {
            display: inline-block;
            padding: 8px 15px;
            background: #003366;
            color: #ffffff;
            text-decoration: none;
            font-size: 12px;
            font-weight: bold;
            border-radius: 3px;
        }

        .module-card a:hover {
            background: #006699;
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

            .modules {
                grid-template-columns: repeat(2, 1fr);
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

            .welcome-box {
                padding: 30px 18px;
            }

            .modules {
                grid-template-columns: 1fr;
                gap: 15px;
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

            .admin-icon {
                width: 65px;
                height: 65px;
                line-height: 65px;
                font-size: 28px;
            }

            .welcome-box h2 {
                font-size: 21px;
            }

            .welcome-box p {
                font-size: 13px;
            }

            .footer {
                font-size: 11px;
            }
        }

    </style>

</head>

<body>

<form action="" method="post">

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

        <a href="admin.jsp" class="active">HOME</a>

        <a href="a1.jsp">STAFF REG</a>

        <a href="a2.jsp">STUDENT REG</a>

        <a href="a4.jsp">SEMESTER</a>

        <a href="a5.jsp">DEPARTMENT</a>

        <a href="a3.jsp">TIME TABLE GENERATION</a>

        <a href="a6.jsp">STAFF AVAILABLE</a>

        <a href="i1.jsp">LOGOUT</a>

    </div>


    <!-- CONTENT -->
    <div class="content">

        <div class="welcome-box">

            <div class="admin-icon">
                A
            </div>

            <h2>Welcome Administrator</h2>

            <p>
                Welcome to the Time Table Generation System.
                Use the administration panel below to manage staff,
                students, semesters, departments, timetable generation
                and staff availability.
            </p>

        </div>


        <!-- MODULES -->
        <div class="modules">

            <div class="module-card">

                <h3>Staff Registration</h3>

                <p>
                    Register and manage staff information.
                </p>

                <a href="a1.jsp">OPEN</a>

            </div>


            <div class="module-card">

                <h3>Student Registration</h3>

                <p>
                    Register and manage student information.
                </p>

                <a href="a2.jsp">OPEN</a>

            </div>


            <div class="module-card">

                <h3>Semester</h3>

                <p>
                    Manage semester details and information.
                </p>

                <a href="a4.jsp">OPEN</a>

            </div>


            <div class="module-card">

                <h3>Department</h3>

                <p>
                    Manage department information.
                </p>

                <a href="a5.jsp">OPEN</a>

            </div>


            <div class="module-card">

                <h3>Time Table Generation</h3>

                <p>
                    Generate and manage the college timetable.
                </p>

                <a href="a3.jsp">OPEN</a>

            </div>


            <div class="module-card">

                <h3>Staff Available</h3>

                <p>
                    View and manage staff availability.
                </p>

                <a href="a6.jsp">OPEN</a>

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