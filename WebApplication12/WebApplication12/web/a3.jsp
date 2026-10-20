<%-- 
    Document   : a3
    Created on : Mar 12, 2021, 10:03:51 PM
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

    <title>Time Table Generation</title>

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
            padding: 35px 20px;
            min-height: 450px;
        }

        /* FORM CARD */

        .form-card {
            width: 100%;
            max-width: 750px;
            margin: 0 auto;
            background: #ffffff;
            border: 1px solid #d9e3ec;
            border-radius: 6px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .form-title {
            background: #003366;
            color: #ffffff;
            text-align: center;
            padding: 18px 10px;
        }

        .form-title h2 {
            margin: 0;
            font-size: 20px;
        }

        .form-title p {
            margin: 6px 0 0 0;
            font-size: 12px;
            color: #dce8f2;
        }

        .form-body {
            padding: 30px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 190px 1fr;
            align-items: center;
            gap: 15px;
            margin-bottom: 20px;
        }

        .form-row label {
            color: #003366;
            font-size: 14px;
            font-weight: bold;
        }

        .form-row select {
            width: 100%;
            max-width: 350px;
            height: 40px;
            padding: 8px 12px;
            border: 1px solid #cbd6df;
            border-radius: 4px;
            background: #ffffff;
            color: #333333;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 14px;
            outline: none;
        }

        .form-row select:focus {
            border-color: #006699;
            box-shadow: 0 0 4px rgba(0,102,153,0.25);
        }

        /* BUTTON AREA */

        .button-area {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #e1e7ec;
        }

        .btn {
            border: none;
            padding: 11px 22px;
            margin: 5px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
            font-family: Arial, Helvetica, sans-serif;
        }

        .btn-generate {
            background: #003366;
            color: #ffffff;
        }

        .btn-generate:hover {
            background: #006699;
        }

        .btn-report {
            background: #006699;
            color: #ffffff;
        }

        .btn-report:hover {
            background: #004d73;
        }

        .btn-view {
            background: #777777;
            color: #ffffff;
        }

        .btn-view:hover {
            background: #555555;
        }

        /* TIMETABLE SECTION */

        .table-card {
            width: 100%;
            margin: 35px auto 0 auto;
            background: #ffffff;
            border: 1px solid #d9e3ec;
            border-radius: 6px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .table-title {
            background: #006699;
            color: #ffffff;
            text-align: center;
            padding: 15px 10px;
        }

        .table-title h2 {
            margin: 0;
            font-size: 18px;
        }

        .table-wrapper {
            width: 100%;
            overflow-x: auto;
        }

        .timetable {
            width: 100%;
            min-width: 850px;
            border-collapse: collapse;
        }

        .timetable th {
            background: #003366;
            color: #ffffff;
            padding: 12px 8px;
            border: 1px solid #ffffff;
            font-size: 12px;
            text-align: center;
            white-space: nowrap;
        }

        .timetable td {
            padding: 11px 8px;
            border: 1px solid #d2dce5;
            text-align: center;
            font-size: 13px;
            color: #333333;
            background: #ffffff;
        }

        .timetable tr:nth-child(even) td {
            background: #f4f8fb;
        }

        .timetable tr:hover td {
            background: #e8f2f8;
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
                padding: 13px 12px;
                font-size: 12px;
            }

            .banner img {
                height: 220px;
            }

            .form-card {
                max-width: 700px;
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
                padding: 25px 15px;
            }

            .form-body {
                padding: 20px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 7px;
                margin-bottom: 18px;
            }

            .form-row select {
                max-width: 100%;
            }

            .button-area {
                text-align: center;
            }

            .btn {
                display: block;
                width: 100%;
                max-width: 300px;
                margin: 8px auto;
            }

            .table-card {
                margin-top: 25px;
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

            .form-title h2 {
                font-size: 18px;
            }

            .form-body {
                padding: 15px;
            }

            .form-row select {
                height: 38px;
                font-size: 13px;
            }

            .footer {
                font-size: 11px;
            }
        }

    </style>

</head>

<body>

<form action="TimeTable" method="post">

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

            <a href="a1.jsp">STAFF REG</a>

            <a href="a2.jsp">STUDENT REG</a>

            <a href="a4.jsp">SEMESTER</a>

            <a href="a5.jsp">DEPARTMENT</a>

            <a href="a3.jsp" class="active">TIME TABLE GENERATION</a>

            <a href="a6.jsp">STAFF AVAILABLE</a>

            <a href="i1.jsp">LOGOUT</a>

        </div>


        <!-- CONTENT -->

        <div class="content">


            <!-- TIME TABLE FORM -->

            <div class="form-card">

                <div class="form-title">

                    <h2>TIME TABLE GENERATION</h2>

                    <p>Select department and semester to manage timetable</p>

                </div>


                <div class="form-body">


                    <!-- DEPARTMENT -->

                    <div class="form-row">

                        <label>Department</label>

                        <select name="a1" required>

                            <option value="">
                                -- Select Department --
                            </option>

                            <%

                                String pro = null;

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
                                        "select distinct cname from acourse"
                                    );

                                    while(rs1.next())
                                    {
                                        pro = rs1.getString(1);

                            %>

                                <option value="<%=pro%>">
                                    <%=pro%>
                                </option>

                            <%

                                    }

                                }
                                catch(Exception e)
                                {
                                    out.println(e);
                                }
                                finally
                                {
                                    try
                                    {
                                        if(rs1 != null)
                                            rs1.close();
                                    }
                                    catch(Exception e) {}

                                    try
                                    {
                                        if(st1 != null)
                                            st1.close();
                                    }
                                    catch(Exception e) {}

                                    try
                                    {
                                        if(con1 != null)
                                            con1.close();
                                    }
                                    catch(Exception e) {}
                                }

                            %>

                        </select>

                    </div>


                    <!-- SEMESTER -->

                    <div class="form-row">

                        <label>Semester Name</label>

                        <select name="a2" required>

                            <option value="">
                                -- Select Semester --
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


                    <!-- BUTTONS -->

                    <div class="button-area">

                        <input type="submit"
                               name="s1"
                               value="GENERATE TIME TABLE"
                               class="btn btn-generate">

                        <input type="submit"
                               name="s2"
                               value="TIME TABLE REPORT"
                               class="btn btn-report">

                        <input type="submit"
                               name="s3"
                               value="VIEW"
                               class="btn btn-view">

                    </div>

                </div>

            </div>


            <!-- GENERATED TIME TABLE -->

            <%

                if(request.getParameter("s3") != null)
                {

            %>

            <div class="table-card">

                <div class="table-title">

                    <h2>TIME TABLE GENERATED</h2>

                </div>


                <div class="table-wrapper">

                    <table class="timetable">

                        <thead>

                            <tr>

                                <th>COURSE</th>

                                <th>DEPARTMENT</th>

                                <th>PERIOD 1</th>

                                <th>PERIOD 2</th>

                                <th>PERIOD 3</th>

                                <th>PERIOD 4</th>

                                <th>PERIOD 5</th>

                                <th>PERIOD 6</th>

                            </tr>

                        </thead>

                        <tbody>

                            <%

                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;

                                try
                                {

                                    String url =
                                        "jdbc:mysql://localhost:3306/student_db";

                                    Class.forName("com.mysql.jdbc.Driver");

                                    con = DriverManager.getConnection(
                                        url,
                                        "root",
                                        "root"
                                    );

                                    st = con.createStatement();

                                    rs = st.executeQuery(
                                        "SELECT * FROM timetable"
                                    );


                                    while(rs.next())
                                    {

                            %>

                            <tr>

                                <td>
                                    <%=rs.getString(2)%>
                                </td>

                                <td>
                                    <%=rs.getString(3)%>
                                </td>

                                <td>
                                    <%=rs.getString(4)%>
                                </td>

                                <td>
                                    <%=rs.getString(5)%>
                                </td>

                                <td>
                                    <%=rs.getString(6)%>
                                </td>

                                <td>
                                    <%=rs.getString(7)%>
                                </td>

                                <td>
                                    <%=rs.getString(8)%>
                                </td>

                                <td>
                                    <%=rs.getString(9)%>
                                </td>

                            </tr>

                            <%

                                    }

                                }
                                catch(Exception e)
                                {
                                    out.println(e);
                                }
                                finally
                                {
                                    try
                                    {
                                        if(rs != null)
                                            rs.close();
                                    }
                                    catch(Exception e) {}

                                    try
                                    {
                                        if(st != null)
                                            st.close();
                                    }
                                    catch(Exception e) {}

                                    try
                                    {
                                        if(con != null)
                                            con.close();
                                    }
                                    catch(Exception e) {}
                                }

                            %>

                        </tbody>

                    </table>

                </div>

            </div>

            <%

                }

            %>


        </div>


        <!-- FOOTER -->

        <div class="footer">

            © 2026 Time Table Generation System | All Rights Reserved

        </div>

    </div>

</form>

</body>
</html>