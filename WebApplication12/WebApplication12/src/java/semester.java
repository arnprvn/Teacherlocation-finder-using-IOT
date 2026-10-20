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
public class semester extends HttpServlet {

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
            String s2 = request.getParameter("s2");       String s3 = request.getParameter("s3");
            String a1= request.getParameter("a1");
            String a2 = request.getParameter("a2");
            String a3 = request.getParameter("a3");
                    String a4= request.getParameter("a4");
            String a5 = request.getParameter("a5");
            String a6 = request.getParameter("a6");
                    String a7= request.getParameter("a7");
            String a8 = request.getParameter("a8");
            String a9 = request.getParameter("a9");        String a10= request.getParameter("a10");
            String a12 = request.getParameter("a12");
            String a13 = request.getParameter("a13");        String a11= request.getParameter("a11");
            String a14 = request.getParameter("a14");
            String a15 = request.getParameter("a15");        String a16= request.getParameter("a16");
            String a17 = request.getParameter("a17");
            String a18 = request.getParameter("a18");        String a19= request.getParameter("a19");
            String a20 = request.getParameter("a20");
            String a23 = request.getParameter("a23");
                    String a21= request.getParameter("a21");
            String a22 = request.getParameter("a22");
            String a24 = request.getParameter("a24");
                    String a25= request.getParameter("a25");
            String a26 = request.getParameter("a26");
            String a27 = request.getParameter("a27");
                    String a28= request.getParameter("a28");
            String a29 = request.getParameter("a20");
            String a30 = request.getParameter("a30");
             String a31 = request.getParameter("a31");
               String a32 = request.getParameter("a32");
                 String a33 = request.getParameter("a33");
             String a34 = request.getParameter("a34");
               String a35 = request.getParameter("a35");
              String ss1 = request.getParameter("b1");
                         String ss2 = request.getParameter("b2");
           int b1=0,b2=0,b3=0,b4=0,b5=0,b6=0,b7=0,b8=0,b9=0,b10=0,b11=0,b12=0,b13=0,b14=0,b15=0,b16=0,b17=0,b18=0,b19=0,b20=0,b21=0,b22=0,b23=0,b24=0,b25=0,b26=0,b27=0,b28=0,b29=0,b30=0;
            int vv=0,vv1=0,vv2=0,vv3=0,vv4=0,vv5=0,vv6=0,vv7=0,vv8=0;
                   java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f11 = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f11);
         HttpSession so = request.getSession(true);
              String v3="",v1="",v2="",v4="",v5="",v6="";
            if((s1!=null) )
            {
                   request.setAttribute("ok", "1");
                      request.setAttribute("a1", ss1);
             RequestDispatcher requestdispatcher = request.getRequestDispatcher("s4.jsp");
                    requestdispatcher.forward(request, response);
                                    
            
            }else 
              if((s3!=null)){
                
                String f="", f1="",f2="",f3="",f4="",f5="",f6="",f7="",f8="";
                 if((a1!=null)|| (a2!=null)|| (a3!=null)|| (a5!=null)|| (a6!=null)|| (a7!=null)|| (a9!=null)|| (a10!=null)|| (a11!=null)|| (a13!=null)|| (a14!=null)|| (a15!=null)|| (a17!=null)|| (a18!=null)|| (a19!=null)|| (a21!=null)|| (a22!=null)|| (a23!=null)|| (a25!=null)|| (a26!=null)|| (a27!=null)|| (a29!=null)|| (a30!=null)|| (a31!=null))
            {
                   ResultSet rs = st1.executeQuery("select * from staff where username='"+so.getAttribute("un")+"'");

    if(rs.next())
		{
  
	   v1=rs.getString(2); 
	    v2=rs.getString(1); 
        
       		   } 
         ResultSet rs1 = st1.executeQuery("select * from student where username='"+ss2+"'");

    if(rs1.next())
		{

	   v3=rs1.getString(1); 
	    v4=rs1.getString(2); 
               v5=rs1.getString(3); 
          System.out.println(v3);
            System.out.println(v4);
              System.out.println(v5);
       		   } 
    b1=Integer.parseInt(a2);         b2=Integer.parseInt(a3);          b3=b1+b2;
        if(b3>=60){
            f="First";
        }else  if((b3<60)&&(b3>=45)){
            f="Second";
        }else  if((b3<45)&&(b3>=36)){
            f="Third";
        }else  if((b3<36)){
            f="Fail";
        }
            b4=Integer.parseInt(a6); 
            b5=Integer.parseInt(a7); 
             b6=b4+b5;
               if(b6>60){
            f1="First";
        }else  if((b6<60)&&(b6>=45)){
            f1="Second";
        }else  if((b6<45)&&(b6>=36)){
            f1="Third";
        }else  if((b6<36)){
            f1="Fail";
        }
            b7=Integer.parseInt(a10); 
            b8=Integer.parseInt(a11);
             b9=b7+b8;
               if(b9>=60){
            f2="First";
        }else  if((b9<60)&&(b9>=45)){
            f2="Second";
        }else  if((b9<45)&&(b9>=36)){
            f2="Third";
        }else  if((b9<36)){
            f3="Fail";
        }
                b10=Integer.parseInt(a14);
                   b11=Integer.parseInt(a15);
                    b12=b10+b11;
                      if(b12>=60){
            f3="First";
        }else  if((b12<60)&&(b12>=45)){
            f3="Second";
        }else  if((b12<45)&&(b12>=36)){
            f3="Third";
        }else  if((b12<36)){
            f3="Fail";
        }
                          b13=Integer.parseInt(a18);
                                 b14=Integer.parseInt(a19); 
                                  b15=b13+b14;
                                    if(b15>=60){
            f4="First";
        }else  if((b15<60)&&(b15>=45)){
            f4="Second";
        }else  if((b15<45)&&(b15>=36)){
            f4="Third";
        }else  if((b15<36)){
            f4="Fail";
        }
                                 b16=Integer.parseInt(a22);
                                        b17=Integer.parseInt(a23);
                                              b18=b13+b14;
                                                if(b18>=60){
            f5="First";
        }else  if((b18<60)&&(b18>=45)){
            f5="Second";
        }else  if((b18<45)&&(b18>=36)){
            f5="Third";
        }else  if((b18<36)){
            f5="Fail";
        }
                                               b19=Integer.parseInt(a26);
                                  b20=Integer.parseInt(a27);
                                        b21=b19+b20;
                                          if(b21>=60){
            f6="First";
        }else  if((b21<60)&&(b21>=45)){
            f6="Second";
        }else  if((b21<45)&&(b21>=36)){
            f6="Third";
        }else  if((b21<36)){
            f6="Fail";
        }
                                     b22=Integer.parseInt(a30);
               b23=Integer.parseInt(a31);
               b24=b22+b23;
                 if(b24>=60){
            f7="First";
        }else  if((b24<60)&&(b24>=45)){
            f7="Second";
        }else  if((b24<45)&&(b24>=36)){
            f7="Third";
        }else  if((b24<36)){
            f7="Fail";
        }
                                         
                 int h=0,h1=0,h2=0,h3=0,h4=0,h5=0,h6=0,h7=0,h8=0;
                     ResultSet r=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a1+"' ");
                     if(r.next()){
                                  h=1;
                     }
                       ResultSet r1=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a5+"' ");
                     if(r1.next()){
                               h1=1;
                     }
                           ResultSet r2=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a9+"' ");
                     if(r2.next()){
                            h2=1;
                     }
                           ResultSet r3=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a9+"' ");
                     if(r3.next()){
                            h3=1;
                     }
                           ResultSet r4=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a13+"' ");
                     if(r4.next()){
                            h4=1;
                     }
                           ResultSet r5=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a17+"' ");
                     if(r5.next()){
                            h5=1;
                     }
                           ResultSet r6=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a21+"' ");
                     if(r6.next()){
                            h6=1;
                     }
                           ResultSet r7=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a25+"' ");
                     if(r7.next()){
                            h7=1;
                     }
                          ResultSet r8=st.executeQuery("select * from semmark where studentid='"+v3+"' and stname='"+v4+"' and department='"+v5+"' and semester='"+ss1+"' and subject='"+a29+"' ");
                     if(r8.next()){
                            h8=1;
                     }
                     if((h==1)||(h1==1)||(h2==1)||(h3==1)||(h4==1)||(h5==1)||(h6==1)||(h7==1)||(h8==1)){
                         request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Already exist");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("s4.jsp");
                    requestdispatcher.forward(request, response);
                     }else{
                       
          ResultSet r18=st.executeQuery("select max(id) from semmark ");
                     if(r18.next()){
                            vv7=Integer.parseInt(r18.getString(1))+1;
                     }  System.out.println("insert into semmark values('"+vv7+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a1+"','"+a2+"','"+a3+"','"+b3+"','"+f+"','"+f11+"')");
                     int k=st.executeUpdate("insert into semmark values('"+vv7+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a1+"','"+a2+"','"+a3+"','"+b3+"','"+f+"','"+f11+"')");

                         //row1
                             ResultSet r118=st.executeQuery("select max(id) from semmark ");
                     if(r118.next()){
                            vv=Integer.parseInt(r118.getString(1))+1;
                     }
                     int k11=st.executeUpdate("insert into semmark values('"+vv+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a5+"','"+a6+"','"+a7+"','"+b6+"','"+f+"','"+f11+"')");
           //row2
                    ResultSet r28=st.executeQuery("select max(id) from semmark ");
                     if(r28.next()){
                            vv1=Integer.parseInt(r28.getString(1))+1;
                     }
                     int k1=st.executeUpdate("insert into semmark values('"+vv1+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a9+"','"+a10+"','"+a11+"','"+b9+"','"+f+"','"+f11+"')");
             //row3
                     ResultSet r38=st.executeQuery("select max(id) from semmark ");
                     if(r38.next()){
                            vv2=Integer.parseInt(r38.getString(1))+1;
                     }
                     int k2=st.executeUpdate("insert into semmark values('"+vv2+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a13+"','"+a14+"','"+a15+"','"+b12+"','"+f+"','"+f11+"')");
            //row4
                     ResultSet r48=st.executeQuery("select max(id) from semmark ");
                     if(r48.next()){
                            vv3=Integer.parseInt(r48.getString(1))+1;
                     }
                     int k3=st.executeUpdate("insert into semmark values('"+vv3+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a17+"','"+a18+"','"+a19+"','"+b15+"','"+f+"','"+f11+"')"); 
              //row5 
                     ResultSet r58=st.executeQuery("select max(id) from semmark ");
                     if(r58.next()){
                            vv4=Integer.parseInt(r58.getString(1))+1;
                     }
                     int k4=st.executeUpdate("insert into semmark values('"+vv4+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a21+"','"+a22+"','"+a23+"','"+b18+"','"+f+"','"+f11+"')");
                 //row6 
                     ResultSet r68=st.executeQuery("select max(id) from semmark ");
                     if(r68.next()){
                            vv5=Integer.parseInt(r68.getString(1))+1;
                     }
                     
                     int k5=st.executeUpdate("insert into semmark values('"+vv5+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a25+"','"+a26+"','"+a27+"','"+b21+"','"+f+"','"+f11+"')");
                 //row7  
                     ResultSet r78=st.executeQuery("select max(id) from semmark ");
                     if(r78.next()){
                            vv6=Integer.parseInt(r78.getString(1))+1;
                     }
                     int k6=st.executeUpdate("insert into semmark values('"+vv6+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a29+"','"+a30+"','"+a31+"','"+b24+"','"+f+"','"+f11+"')");

//                 ResultSet r88=st.executeQuery("select max(id) from semmark ");
//                     if(r88.next()){
//                            vv7=Integer.parseInt(r88.getString(1))+1;
//                     }
//                     int k7=st.executeUpdate("insert into semmark values('"+vv6+"','"+v2+"','"+v1+"','"+v3+"','"+v4+"','"+v5+"','"+ss1+"','"+a32+"','"+a33+"','"+a34+"','"+b27+"','"+f+"','"+f11+"')");

                
              
            
                if((k==1)&&(k1==1)&&(k2==1)&&(k3==1)&&(k4==1)&&(k5==1)&&(k6==1))  {

                    request.setAttribute("ok1", "1");
                       request.setAttribute("a1", ss1);
                          request.setAttribute("a2", ss2);
                             request.setAttribute("a3", a1);
                                request.setAttribute("a4", a2);
                                   request.setAttribute("a5",a3);
                                      request.setAttribute("a6", f);
                                         request.setAttribute("a7", a5);
                                            request.setAttribute("a8", a6);
                                                request.setAttribute("a9", a7);
                          request.setAttribute("a10", f1);
                             request.setAttribute("a11", a9);
                                request.setAttribute("a12", a10);
                                   request.setAttribute("a13", a11);
                                      request.setAttribute("a14", f2);
                                         request.setAttribute("a15", a13);
                                            request.setAttribute("a16", a14);
                                                request.setAttribute("a17", a15);
                          request.setAttribute("a18", f3);
                             request.setAttribute("a19", a17);
                                request.setAttribute("a20", a18);
                                   request.setAttribute("a21", a19);
                                      request.setAttribute("a22", f4);
                                         request.setAttribute("a23", a21);
                                            request.setAttribute("a24", a22);
                                                request.setAttribute("a25",a23);
                          request.setAttribute("a26", f5);
                             request.setAttribute("a27", a25);
                                request.setAttribute("a28", a26);
                                   request.setAttribute("a29", a27);
                                      request.setAttribute("a30", f6);
                                         request.setAttribute("a31", a29);
                                            request.setAttribute("a32", a30);
                                                request.setAttribute("a33", a31);
                                                    request.setAttribute("a34", f7);
                                   
                                
                          
                          
                    request.setAttribute("msg", "Account Registered Successfully");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("s4.jsp");
                    requestdispatcher.forward(request, response);
                }else{

                    request.setAttribute("ok", "1");
                    request.setAttribute("msg", "Already Updated");
                    RequestDispatcher requestdispatcher = request.getRequestDispatcher("s4.jsp");
                    requestdispatcher.forward(request, response);
                }
                     }
                 
                
               
               
              
            }else {
           request.setAttribute("ok", "1");
               request.setAttribute("msg", "Please Enter all the Values");
	       RequestDispatcher requestdispatcher = request.getRequestDispatcher("s4.jsp");
	       requestdispatcher.forward(request, response); 
            }
            }else
                    {
                 request.setAttribute("ok", "1");
			request.setAttribute("msg", "Please Enter all the Values");
			RequestDispatcher requestdispatcher = request.getRequestDispatcher("s4.jsp");
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
