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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author WINDOWS 10
 */
public class attendance extends HttpServlet {

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
            Statement st = con.createStatement();    Statement st1 = con.createStatement();
            String s1=request.getParameter("s1");
            String s2 = request.getParameter("s2");
            String[] items = request.getParameterValues("a1");
       
          
            String a2 = request.getParameter("a2");
        String a3 = request.getParameter("a3");
            String a4 = request.getParameter("a4");
            
                   java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10
int v=0;
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
         HttpSession so = request.getSession(true);
              String v3=null,v1=null,v2=null,v4="",v5="";
            if((s1!=null) )
            {
//            if((a1!=null)|| (a2!=null))
//            {
                   ResultSet rs = st1.executeQuery("select * from staff where username='"+so.getAttribute("un")+"'");

    if(rs.next())
		{
  
	   v1=rs.getString(1); 
	    v2=rs.getString(2); 
            v3=rs.getString(3); 
       		   } 
     for(int loopIndex = 0; loopIndex < items.length; loopIndex++){
            out.println(items[loopIndex] + "<BR>");
      
     ResultSet rs1 = st1.executeQuery("select * from student where name='"+items[loopIndex]+"'");

    if(rs1.next())
		{
  
	   v4=rs1.getString(1); 
	    v5=rs1.getString(2); 
      
       		   } 
    int h=0;
        ResultSet rs2 = st1.executeQuery("select * from attendance where uname='"+v4+"' and semester='"+a2+"' and period='"+a3+"'");

    if(rs2.next())
		{
  
	h=1;
      
       		   } 
    if(h==1){
                  request.setAttribute("ok", "1");
                    request.setAttribute("msg", "already exist");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("s6.jsp");
                    requestdispatcher.forward(request, response);
    }else{
        int vv=0;
             ResultSet rs12 = st1.executeQuery("select max(id) from attendance ");

    if(rs12.next())
		{
                   vv=Integer.parseInt(rs12.getString(1))+1;
                }
              System.out.println("insert into attendance values('"+vv+"','"+v4+"','"+v5+"','"+v3+"','"+f+"','"+a4+"','"+a2+"','"+a3+"','"+v1+"')");
            v=st.executeUpdate("insert into attendance values('"+vv+"','"+v4+"','"+v5+"','"+v3+"','"+f+"','"+a4+"','"+a2+"','"+a3+"','"+v1+"')");
    }
                if((v==1))  {

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Account Registered Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("s6.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Password didnot match");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("s6.jsp");
                    requestdispatcher.forward(request, response);
                }
                
    }
                
               
               
              
//            }else {
//           request.setAttribute("ok", "1");
//               request.setAttribute("msg", "Please Enter all the Values");
//	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("s6.jsp");
//	       requestdispatcher.forward(request, response); 
//            }
                                    
            
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("s6.jsp");
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
