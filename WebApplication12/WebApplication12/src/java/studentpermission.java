/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Random;
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
public class studentpermission extends HttpServlet {

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
            Statement st1 = con.createStatement();
            String s1=request.getParameter("s1");
            String s2 = request.getParameter("s2");
            String a1= request.getParameter("t1");
            String a2 = request.getParameter("t2");
            String a3 = request.getParameter("t3");
            String a4 = request.getParameter("t4");
            String a5 = request.getParameter("t5");
            String a6 = request.getParameter("t6");
            String a7 = request.getParameter("t7");
             String a8 = request.getParameter("t8");
         HttpSession so = request.getSession(true);
              String v3=null,v1=null,v2=null;
            if((s1!=null) )
            {
            if((a1!=null)|| (a2!=null)|| (a3!=null) || (a4!=null) || (a5!=null)|| (a6!=null)|| (a7!=null))
            {
//                 Random r=new Random();
        int s=0;
//            System.out.print(s);
                 java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
                ResultSet rs1 = st.executeQuery("select max(rid) from studentpermission ");

    if(rs1.next())
		{
    
	  s=Integer.parseInt(rs1.getString(1)); 
	   s=s+1;
        
       		   } 
                   ResultSet rs = st1.executeQuery("select * from students where username='"+so.getAttribute("un")+"'");

    if(rs.next())
		{
    
	   v1=rs.getString(1); 
	    v2=rs.getString(5);
            v3=rs.getString(4); 
        
       		   } 
    String newDir = "new_dir";
             boolean success = (new File(newDir)).mkdir();
             
          
             
        if (success) 
        {
            System.out.println("Successfully created directory: " + newDir);
        } else 
        {
            System.out.println("Failed to create directory: " + newDir);
        }

        // Create a directory; all non-existent ancestor directories are
        // automatically created.
        newDir = "C:\\Users\\WINDOWS 10\\Documents\\NetBeansProjects\\Student_Performance\\web\\candidate";
        success = (new File(newDir)).mkdirs();

         if (success)
        {
            System.out.println("Successfully created directory: " + newDir);
        } 
        else 
        {
            System.out.println("Failed to create directory: " + newDir);
        }

                  InputStream inStream = null;
	          OutputStream outStream = null;

 
    	         File afile =new File(a8);
                 System.out.println(afile);
       
    	         File bfile =new File("C:\\Users\\WINDOWS 10\\Documents\\NetBeansProjects\\Student_Performance\\web\\candidate\\"+s+".jpg");

        	    inStream = new FileInputStream(afile);
         	    outStream = new FileOutputStream(bfile);
 
    	            byte[] buffer = new byte[1024];
 
         	    int length;
    	       
//copy the file content in bytes 
        	    while ((length = inStream.read(buffer)) > 0){
 
    	       	     outStream.write(buffer, 0, length);
 
    	       }
 
    	        inStream.close();
    	        outStream.close();
                      System.out.println("insert into studentpermission values('"+s+"','"+v1+"','"+v2+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+v3+"','"+f+"','','')");
           int v=st.executeUpdate("insert into studentpermission values('"+s+"','"+v1+"','"+v2+"','"+a1+"','"+a2+"','"+a3+"','"+a4+"','"+a5+"','"+a6+"','"+a7+"','"+v3+"','"+f+"','','')");
            
                if((v==1))  {

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Account Registered Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("st2.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Password didnot match");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("st2.jsp");
                    requestdispatcher.forward(request, response);
                }
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("st2.jsp");
	       requestdispatcher.forward(request, response); 
            }
                                    
            
            }else {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("st2.jsp");
			requestdispatcher.forward(request, response);
            }
            
            
            
            
            
            
        }catch(Exception e) {
        e.printStackTrace();
        }  finally {            
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
