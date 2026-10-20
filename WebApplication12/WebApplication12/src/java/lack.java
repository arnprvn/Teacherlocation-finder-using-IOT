/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author WINDOWS 10
 */
public class lack extends HttpServlet {

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
        try {
          SimpleDateFormat DateFor = new SimpleDateFormat("dd/MM/yyyy");


          String a1= request.getParameter("a1");
          String a2=request.getParameter("a2");
            String s1=request.getParameter("s1");
          String s2=request.getParameter("s2");
          System.out.println(a1);
          System.out.println(a2);
   int at=0,at1=0,v=0;
   float at2=0,at3=0,at4=0,at5=0;
             String url = "jdbc:mysql://localhost:3306/student_db";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");
            Statement st = con.createStatement();    
            Statement st1 = con.createStatement(); 
            Statement st2 = con.createStatement(); 
            Statement st3 = con.createStatement();
             Statement st4 = con.createStatement();
          if(s1!=null){
              ResultSet rs1 = st4.executeQuery("select * from students");
           while (rs1.next()) {
                  ResultSet rs2 = st2.executeQuery("SELECT COUNT(DISTINCT(DATE)) from attendance where date BETWEEN '" + a1 + "' AND '" + a2 + "'");
           if (rs2.next()) {
               at1 = Integer.parseInt(rs2.getString(1));
           }
           System.out.println(at1);
                  ResultSet rs12 = st3.executeQuery("SELECT max(lid) from lack");
           if (rs12.next()) {
               System.out.println(rs12.getString(1));
               at3 = Integer.parseInt(rs12.getString(1)) + 1;
           }
               System.out.println("SELECT COUNT(DISTINCT(DATE))  from attendance where date BETWEEN '" + a1 + "' AND '" + a2 + "'  and first_name='" + rs1.getString(2) + "' AND last_name='" + rs1.getString(3) + "' AND is_attendant='YES'");
               ResultSet rs = st1.executeQuery("SELECT COUNT(DISTINCT(DATE))  from attendance where date BETWEEN '" + a1 + "' AND '" + a2 + "'  and first_name='" + rs1.getString(2) + "' AND last_name='" + rs1.getString(3) + "' AND is_attendant='YES'");
               if (rs.next()) {
                   at = Integer.parseInt(rs.getString(1));
               }
               System.out.println(at + "/" + at1);
               at2 = (at * 100) / at1;
               System.out.println(at2);
               at4 = at2;
               System.out.println(at4);
             if((at4<60)){
                 at5=3500;
             }else if((at4<60)&&(at4>=70)){
                  at5=2500;
             }else if((at4<70)&&(at4>75)){
                  at5=1500;
             }
               v = st.executeUpdate("insert into lack values('" + at3 + "','" + rs1.getString(2) + "','" + rs1.getString(3) + "','" + rs1.getString(4) + "','" + rs1.getString(5) + "','" + a1 + "','" + a2 + "','" + at + "','" + at1 + "','" + at4 + "','" + at5 + "','')");

           }
                  if((v>=1))  {

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Lack Attendance Generated Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a4.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Lack Attendance Generation Failed ");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a4.jsp");
                    requestdispatcher.forward(request, response);
                }
                }
          else{
               request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Please enter all value ");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("a4.jsp");
                    requestdispatcher.forward(request, response);
          }
            
        }catch(Exception e){
            e.printStackTrace();
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
