<%-- 
    Document   : s1
    Created on : Mar 12, 2021, 10:22:40 PM
    Author     : WINDOWS 10
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Staff Profile - Faculty Location Tracking</title>

<link rel="stylesheet" type="text/css" href="style.css" />

<script type="text/javascript" src="js/datetimepicker_css.js"></script>
<script type="text/javascript" src="js/general.js"></script>

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

/* MAIN CONTAINER */

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
    min-height: 600px;
    padding: 40px 30px;
}

/* WELCOME */

.welcome {
    text-align: center;
    margin-bottom: 30px;
}

.welcome h2 {
    color: #003366;
    font-size: 27px;
    margin-bottom: 8px;
}

.welcome p {
    color: #666;
    font-size: 15px;
}

/* PROFILE BOX */

.profile-box {
    width: 100%;
    max-width: 700px;
    margin: 0 auto;
    background: #ffffff;
    border: 1px solid #d9e2ec;
    box-shadow: 0 3px 12px rgba(0,0,0,0.08);
    border-radius: 6px;
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

.form-area {
    padding: 30px;
}

.form-row {
    display: grid;
    grid-template-columns: 190px 1fr;
    gap: 15px;
    align-items: center;
    margin-bottom: 17px;
}

.form-row label {
    color: #333;
    font-weight: bold;
    font-size: 14px;
}

.form-control {
    width: 100%;
    padding: 10px 11px;
    border: 1px solid #c8d3df;
    border-radius: 4px;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 14px;
    background: #ffffff;
}

.form-control:focus {
    outline: none;
    border-color: #00509e;
    box-shadow: 0 0 4px rgba(0,80,158,0.25);
}

.form-control[readonly] {
    background: #f1f4f7;
    color: #555;
}

textarea.form-control {
    resize: vertical;
    min-height: 90px;
}

select.form-control {
    height: 40px;
}

/* DATE */

.date-wrapper {
    display: flex;
    align-items: center;
    gap: 8px;
}

.date-wrapper .form-control {
    width: 180px;
}

.calendar-icon {
    width: 20px;
    height: 20px;
    cursor: pointer;
}

.error-message {
    color: #d9534f;
    font-size: 12px;
    display: block;
    margin-top: 4px;
}

/* BUTTONS */

.button-area {
    text-align: center;
    margin-top: 28px;
}

.btn {
    padding: 11px 30px;
    border: none;
    border-radius: 4px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.btn-submit {
    background: #003366;
    color: #ffffff;
}

.btn-submit:hover {
    background: #00509e;
}

.btn-reset {
    background: #777777;
    color: #ffffff;
    margin-left: 10px;
}

.btn-reset:hover {
    background: #555555;
}

/* MESSAGE */

.message {
    text-align: center;
    color: #008000;
    font-weight: bold;
    margin-top: 20px;
}

/* FOOTER */

.footer {
    background: #003366;
    color: #ffffff;
    text-align: center;
    padding: 18px;
    font-size: 14px;
}

/* MOBILE */

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
        padding: 30px 15px;
    }

    .welcome h2 {
        font-size: 22px;
    }

    .profile-box {
        max-width: 100%;
    }

    .form-area {
        padding: 20px;
    }

    .form-row {
        grid-template-columns: 1fr;
        gap: 7px;
        margin-bottom: 15px;
    }

    .date-wrapper .form-control {
        width: 100%;
    }

    .button-area {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 10px;
    }

    .btn-reset {
        margin-left: 0;
    }
}

</style>

</head>

<body>

<form action="personal2" method="post">

<%

String ok = (String)request.getAttribute("ok");
String msg = "";

if(ok != null)
{
    msg = (String)request.getAttribute("msg");
}

%>

<div class="container">

    <!-- HEADER -->

    <div class="header">

        <h1>Faculty Location Tracking</h1>

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

        <div class="welcome">

            <h2>Staff Profile</h2>

            <p>
                Manage your personal information and staff details
            </p>

        </div>


<%

int index = 0;

try
{

    String a11 = null;

    HttpSession so = request.getSession(true);

    String v = "";
    String v1 = "";
    String v2 = "";

    String url =
        "jdbc:mysql://localhost:3306/student_db";

    Class.forName("com.mysql.jdbc.Driver");

    Connection con =
        DriverManager.getConnection(
            url,
            "root",
            "root"
        );

    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery(
        "select * from staff where username='"
        + so.getAttribute("un")
        + "'"
    );

    if(rs.next())
    {
        v = rs.getString(2);
        v1 = rs.getString(1);
        v2 = rs.getString(3);
    }

%>


        <!-- PROFILE BOX -->

        <div class="profile-box">

            <div class="profile-title">

                Personal Information

            </div>


            <div class="form-area">


                <!-- STAFF ID -->

                <div class="form-row">

                    <label>Staff ID</label>

                    <input type="text"
                           name="a1"
                           class="form-control"
                           value="<%=v1%>"
                           readonly>

                </div>


                <!-- NAME -->

                <div class="form-row">

                    <label>Name</label>

                    <input type="text"
                           name="a2"
                           class="form-control"
                           value="<%=v%>"
                           readonly>

                </div>


                <!-- DEPARTMENT -->

                <div class="form-row">

                    <label>Department</label>

                    <input type="text"
                           name="a3"
                           class="form-control"
                           value="<%=v2%>"
                           readonly>

                </div>


                <!-- DESIGNATION -->

                <div class="form-row">

                    <label>Designation</label>

                    <input type="text"
                           name="a4"
                           class="form-control">

                </div>


                <!-- DATE OF JOIN -->

                <div class="form-row">

                    <label>Date of Join</label>

                    <div>

                        <div class="date-wrapper">

                            <input type="text"
                                   id="a5"
                                   name="a5"
                                   class="form-control displayValue"
                                   onChange="return val_zero('a5','err_a5');"
                                   onBlur="return txt_empty('a5','err_a5','Should Not Be Blank');">

                            <a href="javascript:NewCssCal('a5','yyyymmdd')">

                                <img src="images/cal.jpg"
                                     alt="Calendar"
                                     class="calendar-icon">

                            </a>

                        </div>

                        <span id="err_a5"
                              class="error-message">
                        </span>

                    </div>

                </div>


                <!-- ADDRESS -->

                <div class="form-row">

                    <label>Communication Address</label>

                    <textarea name="a6"
                              class="form-control"
                              rows="4"></textarea>

                </div>


                <!-- MARITAL STATUS -->

                <div class="form-row">

                    <label>Marital Status</label>

                    <select name="a7"
                            class="form-control">

                        <option value="Select Status">
                            Select Status
                        </option>

                        <option value="Single">
                            Single
                        </option>

                        <option value="Married">
                            Married
                        </option>

                    </select>

                </div>


                <!-- GENDER -->

                <div class="form-row">

                    <label>Gender</label>

                    <select name="a8"
                            class="form-control">

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


                <!-- RELIGION -->

                <div class="form-row">

                    <label>Religion</label>

                    <input type="text"
                           name="a9"
                           class="form-control">

                </div>


                <!-- NATIONALITY -->

                <div class="form-row">

                    <label>Nationality</label>

                    <input type="text"
                           name="a10"
                           class="form-control">

                </div>


                <!-- DATE OF BIRTH -->

                <div class="form-row">

                    <label>Date of Birth</label>

                    <div>

                        <div class="date-wrapper">

                            <input type="text"
                                   id="a11"
                                   name="a11"
                                   class="form-control displayValue"
                                   onChange="return val_zero('a11','err_a11');"
                                   onBlur="return txt_empty('a11','err_a11','Should Not Be Blank');">

                            <a href="javascript:NewCssCal('a11','yyyymmdd')">

                                <img src="images/cal.jpg"
                                     alt="Calendar"
                                     class="calendar-icon">

                            </a>

                        </div>

                        <span id="err_a11"
                              class="error-message">
                        </span>

                    </div>

                </div>


                <!-- PHONE -->

                <div class="form-row">

                    <label>Phone No.</label>

                    <input type="text"
                           name="a12"
                           class="form-control">

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


<%

    con.close();

}
catch(Exception e)
{
    out.println(e);
}

%>


    </div>


    <!-- FOOTER -->

    <div class="footer">

        © 2026 Student Performance System |
        All Rights Reserved

    </div>

</div>

</form>

</body>
</html>
```
