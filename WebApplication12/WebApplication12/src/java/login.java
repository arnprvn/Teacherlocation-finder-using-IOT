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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asvperumal
 */
public class login extends HttpServlet {

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
                    String url = "jdbc:mysql://localhost:3306/student_db";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps;
            Statement st = con.createStatement();
                Statement st1 = con.createStatement();    Statement st2 = con.createStatement();    Statement st3 = con.createStatement();
                
                
                
            String s1=request.getParameter("s1");
            String s2 = request.getParameter("s2");
            String a1= request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String a3,a4,a5=null,a6=null,a7=null;
            String r1=null,r2=null,r3=null;
                 HttpSession so = request.getSession(true);
              
            int flag=0;
           if((s1!=null) )
            {
            if((a1!=null)|| (a2!=null) )
            {
              ResultSet rs = (ResultSet) st.executeQuery("select * from staff where username='"+a1+"' ");
        
                 
	        while(rs.next())
	   	      {
	   		a3=rs.getString(4);
                        a4=rs.getString(5);
                         	 System.out.println(a1+" Staff   "+a2);    System.out.println(a3+" Db Staff   "+a4);
	        if((a1.equalsIgnoreCase(a3))&&(a2.equalsIgnoreCase(a4))) {
                      a5=rs.getString(6);
                    System.out.println(" Staff   "+a5); 
	   	 flag=1;
                }
                      }
                 
                  ResultSet rs2 = (ResultSet) st2.executeQuery("select * from student where username='"+a1+"'");
        
                 
	       while(rs2.next())
	   	      {
	   		a3=rs2.getString(4);
                        a4=rs2.getString(5);
                      
                    
                         	 System.out.println(a1+" Student    "+a2);    System.out.println(a3+"   Student    "+a4);
	        if((a1.equalsIgnoreCase(a3))&&(a2.equalsIgnoreCase(a4))) {
                      a5="student";
                     a6=rs2.getString(2);
                        a7=rs2.getString(3);
                    System.out.println(" Student "+a5); 
	   	 flag=1;
                }
                      }
                 if((a1.equalsIgnoreCase("admin"))&&(a2.equalsIgnoreCase("admin"))) {
                    
	   	 flag=2;
                }
                   so.setAttribute("un", a1);
                so.setAttribute("un1", a2);
            so.setAttribute("un2", a6);
                so.setAttribute("un3", a7);
                if((flag==1)&&(a5.equalsIgnoreCase("staff"))){
                  
                  
                          request.setAttribute("ok", "1");
                   
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("staff.jsp");
                    requestdispatcher.forward(request, response);
                    
                    
                
                }else if((flag==1)&&(a5.equalsIgnoreCase("student"))){
                  

                    request.setAttribute("ok", "1");
                   
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("student.jsp");
                    requestdispatcher.forward(request, response);
                
                }else if(flag==2){
                  

                    request.setAttribute("ok", "1");
                   
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("admin.jsp");
                    requestdispatcher.forward(request, response);
                
                }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Invalid Username && Password");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("i1.jsp");
	       requestdispatcher.forward(request, response); 
            }
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("i1.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("login.jsp");
			requestdispatcher.forward(request, response);
            }
            
            
            
            
            
            
        }catch(Exception e) {
        e.printStackTrace();
        } finally {            
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
