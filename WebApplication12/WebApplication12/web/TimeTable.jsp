<%-- 
    Document   : newjsp
    Created on : 28 Jan, 2024, 8:45:33 PM
    Author     : Win11
--%>

<%@ page contentType="application/vnd.ms-excel" %>

<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="ISO-8859-1"%>


<html>
    <head>
        <title>Inserting data in Excel Sheet Using JSP</title>
        <style type="text/css">
        <!--
        .style1 {
                color: #66FF00;
                font-weight: bold;
        }
        -->
        </style>
    </head>
    <body> 	 <table width="985" border="0">
  <tr bgcolor="#006699">
    <td width="975" height="46" align="center"><span class="style4"><strong>TIME TABLE GENERATED </strong></span></td>
  </tr>
  <tr>
    <td><table  border="1">
            <tr class="lab-des" bgcolor="#038D8A">
       <td width="146" align="center" bgcolor="#FFFFFF">
                    <span class="style9">DAY</span></td>
              <td width="146" align="center" bgcolor="#FFFFFF">
                    <span class="style9">COURSE</span></td>
                <td width="120" align="center" bgcolor="#FFFFFF">
                    <span class="style9">SEMESTER</span></td>	
                
                <td width="146" align="center" bgcolor="#FFFFFF">
                    <span class="style9">PERIOD1</span></td>
                <td width="120" align="center" bgcolor="#FFFFFF">
                    <span class="style9">PERIOD2</span></td>		

                <td width="133" align="center" bgcolor="#FFFFFF">
                    <span class="style9">PERIOD3</span></td>
                <td width="133" align="center" bgcolor="#FFFFFF">
                    <span class="style9">PERIOD4</span></td>				
                <td width="133" align="center" bgcolor="#FFFFFF">
                    <span class="style9">PERIOD5</span></td>
                <td width="135" align="center" bgcolor="#FFFFFF">
                    <span class="style9">PERIOD6</span></td>
            </tr>
   
                      
                                <%
                if (request.getParameter("s2") != null) {
                    String a11 = (String) request.getAttribute("a1");
                    String a12 = (String) request.getAttribute("a2");
                    try {
                        int flag = 0;
                        String max = null;
                        int vt = 0, vt1 = 0;
                        String url = "jdbc:mysql://localhost:3306/student_db";
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, "root", "root");
                        Statement st = con.createStatement();
 Statement st1 = con.createStatement();

                        String a1 = "", a2 = "", a3 = "", a4 = "", a5 = "", a6 = "";%> <%
     ResultSet rs1 = st.executeQuery("SELECT * from timetable  WHERE semester='" + a12 + "' AND course='" + a11 + "'");

                     while (rs1.next()) {
                       %>     
     <tr>    
                     <%
					 if(rs1.getString(2).equals("1")){
					 a1="Monday";}else
					 if(rs1.getString(2).equals("2")){
					 a1="Tuesday";}else
					 if(rs1.getString(2).equals("3")){
					 a1="Wednesday";}else
					 if(rs1.getString(2).equals("4")){
					 a1="Thursday";}else
					 if(rs1.getString(2).equals("5")){
					 a1="Friday";}else{
					 }
					 
					 %>
                       
                     <td  width="146"  align="center"> <font class="content2"><%=a1%></font></td>
    


                                   <td  width="146"  align="center"> <font class="content2"><%=rs1.getString(3)%></font></td>
    
<td  width="123"  align="center">
                    <font class="content2"><%=rs1.getString(4)%></font></td>
     
                     
<td   width="136" align="center">
                    <font class="content2"><%=rs1.getString(5)%></font></td>
      
<td  width="130" align="center">
                    <font class="content2"><%=rs1.getString(6)%></font></td>
    
<td  width="133"  align="center">
                    <font class="content2"><%=rs1.getString(7)%></font></td>
      
            

                  

                <td  width="134"  align="center">
                    <font class="content2"><%=rs1.getString(8)%></font></td> 
					 <td  width="134"  align="center">
                    <font class="content2"><%=rs1.getString(9)%></font></td> 
					 <td  width="134"  align="center">
                    <font class="content2"><%=rs1.getString(10)%></font></td> 
          </tr>
<% 

                    }
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>
        </table></td>
  </tr>
</table>
       					

    </body>
</html> 
