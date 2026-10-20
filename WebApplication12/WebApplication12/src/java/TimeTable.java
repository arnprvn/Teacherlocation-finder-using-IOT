/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Win11
 */
public class TimeTable extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {    String a111 = (String) request.getParameter("a1");
                    String a12 = (String) request.getParameter("a2");
                if (request.getParameter("s1") != null) {
                
                        int flag = 0;
                        String max = null;
                        int vt = 0, vt1 = 0;
                        String url = "jdbc:mysql://localhost:3306/student_db";
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, "root", "root");
                        Statement st = (Statement) con.createStatement();
                           Statement st1 = (Statement) con.createStatement();
                             Statement st2 = (Statement) con.createStatement();
                              Statement st3 = (Statement) con.createStatement();
 String a11 = "";     int v=0,v1=0,v2=0;
 java.util.Date st11 = new java.util.Date();
               

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
                        String a1 = "", a2 = "", a3 = "", a4 = "", a5 = "", a6 = "";
  ResultSet rs1 = st.executeQuery("SELECT p1,p2,p3,p4,p5,p6 from timetables WHERE semester='" + a12 + "'");

                     while (rs1.next()) {
                       
                           ResultSet rs11 = st1.executeQuery("SELECT sid,suname from asemester WHERE sname='" + a12 + "' AND cname='" + a111 + "'");
 while (rs11.next()) {
                                 a11=rs11.getString(1);
                     
                          
                                if (rs1.getString(1).equalsIgnoreCase(a11)) {
                                    a1 = rs11.getString(2);
                                    System.out.println(a1);
                                }
                                if (rs1.getString(2).equalsIgnoreCase(a11)) {
                                    a2 = rs11.getString(2);
                                      System.out.println(a2);
                                }
                                if (rs1.getString(3).equalsIgnoreCase(a11)) {
                                    a3 = rs11.getString(2);
                                      System.out.println(a3);
                                }
                                if (rs1.getString(4).equalsIgnoreCase(a11)) {
                                    a4 = rs11.getString(2);
                                      System.out.println(a4);
                                }
                                if (rs1.getString(5).equalsIgnoreCase(a11)) {
                                    a5 = rs11.getString(2);
                                      System.out.println(a5);
                                }
                                if (rs1.getString(6).equalsIgnoreCase(a11)) {
                                    a6 = rs11.getString(2);
                                      System.out.println(a6);
                                }
                                
                                                                 }
 ResultSet rs111 = st2.executeQuery("SELECT max(tid) from timetable");
 if (rs111.next()) {
     v1=Integer.parseInt(rs111.getString(1))+1;
 }
 v2++;
                 v=st3.executeUpdate("insert into timetable values('"+v1+"','"+v2+"','"+a111+"','"+a12+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+f+"')"); 


                    }   
                          
               
                     if((v>=1))  {

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Time Table Generated Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Time Table Generated Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }
                
                }else if (request.getParameter("s2") != null) {
                request.setAttribute("ok", "1");
                    request.setAttribute("a1", a111);
                    request.setAttribute("a2", a12);
                RequestDispatcher requestdispatcher = request.getRequestDispatcher("TimeTable.jsp");
                    requestdispatcher.forward(request, response);
                
                }
                else{

                   // request.setAttribute("ok1", "1");
                    //request.setAttribute("msg", "Time Table Generated Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a3.jsp");
                    requestdispatcher.forward(request, response);
                }
                } catch (Exception e) {
                   System.out.println(e);
                }
            finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
