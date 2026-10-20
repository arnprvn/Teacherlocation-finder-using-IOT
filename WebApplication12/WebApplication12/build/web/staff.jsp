<%-- 
    Document   : staff
    Created on : Mar 12, 2021, 10:22:31 PM
    Author     : WINDOWS 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html> <html> <head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Performance System - Staff</title>

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
        padding: 16px 28px;
        color: #ffffff;
        text-decoration: none;
        font-weight: bold;
        font-size: 14px;
        transition: 0.3s;
    }

    .navbar ul li a:hover {
        background: #00509e;
    }

    /* MAIN CONTENT */
    .content {
        min-height: 400px;
        padding: 50px 40px;
        text-align: center;
    }

    .content h2 {
        color: #003366;
        font-size: 28px;
        margin-bottom: 20px;
    }

    .content p {
        color: #666;
        font-size: 16px;
        line-height: 1.8;
        max-width: 800px;
        margin: auto;
    }

    .button {
        display: inline-block;
        margin-top: 25px;
        padding: 12px 28px;
        background: #003366;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        font-weight: bold;
        transition: 0.3s;
    }

    .button:hover {
        background: #00509e;
    }

    /* FOOTER */
    .footer {
        background: #003366;
        color: white;
        text-align: center;
        padding: 18px;
        font-size: 14px;
    }

    /* MOBILE RESPONSIVE */
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
            padding: 35px 20px;
        }

        .content h2 {
            font-size: 22px;
        }
    }
</style>

</head> <body>
<div class="container">

    <!-- HEADER -->
    <div class="header">
        <h1>STUDENT PERFORMANCE SYSTEM</h1>
        <p>Staff Management Portal</p>
    </div>

    <!-- BANNER -->
    <div class="banner">
        <img src="images/cloud-computing-banner1.jpg"
             alt="Student Performance System">
    </div>

    <!-- NAVIGATION -->
    <div class="navbar">
        <ul>
            <li>
                <a href="staff.jsp">HOME</a>
            </li>

            <li>
                <a href="s1.jsp">PROFILE</a>
            </li>
			 <li>
                <a href="s5.jsp">Staff Status</a>
            </li>

            <li>
                <a href="s8.jsp">TIME TABLE DETAILS</a>
            </li>

            <li>
                <a href="i1.jsp">LOGOUT</a>
            </li>
        </ul>
    </div>

    <!-- MAIN CONTENT -->
    <div class="content">

        <h2>Welcome to Staff Portal</h2>

        <p>
            Welcome to the Student Performance System staff portal.
            From this section, staff members can manage their profile,
            view timetable details and access other academic information
            related to student performance.
        </p>

        <a href="s1.jsp" class="button">
            VIEW PROFILE
        </a>

    </div>

    <!-- FOOTER -->
    <div class="footer">
        © 2026 Student Performance System | All Rights Reserved
    </div>

</div>

</body> </html>