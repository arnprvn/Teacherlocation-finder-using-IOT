<%-- 
    Document   : i1
    Created on : Mar 12, 2021, 9:30:27 PM
    Author     : WINDOWS 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String ss = (String) request.getAttribute("ok");
    String msg = "";

    if (ss != null) {
        msg = (String) request.getAttribute("msg");

        if (msg == null) {
            msg = "";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login | Student Performance System</title>

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

        /* ================= HEADER ================= */

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

        /* ================= BANNER ================= */

        .banner {
            width: 100%;
            height: 260px;
            overflow: hidden;
        }

        .banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        /* ================= NAVIGATION ================= */

        .navbar {
            background: #003366;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
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

        .navbar ul li a:hover,
        .navbar ul li a.active {
            background: #00509e;
        }

        /* ================= LOGIN SECTION ================= */

        .content {
            min-height: 430px;
            padding: 50px 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-box {
            width: 100%;
            max-width: 450px;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.15);
            overflow: hidden;
        }

        .login-title {
            background: #003366;
            color: #ffffff;
            padding: 18px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        .login-form {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            color: #003366;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-size: 15px;
            outline: none;
        }

        .form-group input:focus {
            border-color: #003366;
            box-shadow: 0 0 5px rgba(0,51,102,0.3);
        }

        /* ================= BUTTONS ================= */

        .button-group {
            text-align: center;
            margin-top: 25px;
        }

        .btn {
            border: none;
            padding: 12px 28px;
            margin: 5px;
            border-radius: 4px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-login {
            background: #003366;
            color: #ffffff;
        }

        .btn-login:hover {
            background: #00509e;
        }

        .btn-reset {
            background: #777777;
            color: #ffffff;
        }

        .btn-reset:hover {
            background: #555555;
        }

        /* ================= MESSAGE ================= */

        .message {
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
            color: #cc0000;
        }

        /* ================= FOOTER ================= */

        .footer {
            background: #003366;
            color: #ffffff;
            text-align: center;
            padding: 18px;
            font-size: 14px;
        }

        /* ================= MOBILE ================= */

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

            .navbar ul li {
                width: 100%;
                text-align: center;
            }

            .navbar ul li a {
                border-bottom: 1px solid rgba(255,255,255,0.2);
            }

            .content {
                padding: 40px 15px;
            }

            .login-form {
                padding: 25px 20px;
            }
        }

    </style>

</head>

<body>

    <div class="container">

        <!-- HEADER -->

        <div class="header">

            <h1>STUDENT PERFORMANCE SYSTEM</h1>

            <p>
                Monitor, Analyze and Improve Student Academic Performance
            </p>

        </div>


        <!-- BANNER -->

        <div class="banner">

            <img src="images/cloud-computing-banner1.jpg" width="600px;"
                 alt="Student Performance System">

        </div>


        <!-- NAVIGATION -->

        <div class="navbar">

            <ul>

                <li>
                    <a href="index.jsp">HOME</a>
                </li>

                <li>
                    <a href="i1.jsp" class="active">LOGIN</a>
                </li>

                <li>
                    <a href="i2.jsp">ABOUT US</a>
                </li>

                <li>
                    <a href="i3.jsp">CONTACT US</a>
                </li>

                <li>
                    <a href="i4.jsp">COURSE</a>
                </li>

            </ul>

        </div>


        <!-- LOGIN FORM -->

        <div class="content">

            <div class="login-box">

                <div class="login-title">

                    LOGIN FORM

                </div>


                <form action="login" method="post" class="login-form">

                    <div class="form-group">

                        <label>User Name</label>

                        <input type="text"
                               name="a1"
                               placeholder="Enter User Name"
                               required>

                    </div>


                    <div class="form-group">

                        <label>Password</label>

                        <input type="password"
                               name="a2"
                               placeholder="Enter Password"
                               required>

                    </div>


                    <div class="button-group">

                        <input type="submit"
                               name="s1"
                               value="Sign In"
                               class="btn btn-login">

                        <input type="reset"
                               name="s2"
                               value="Reset"
                               class="btn btn-reset">

                    </div>


                    <% if (!msg.equals("")) { %>

                    <div class="message">

                        <%= msg %>

                    </div>

                    <% } %>

                </form>

            </div>

        </div>


        <!-- FOOTER -->

        <div class="footer">

            © 2026 Student Performance System | All Rights Reserved

        </div>

    </div>

</body>
</html>