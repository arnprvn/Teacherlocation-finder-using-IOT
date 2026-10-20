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
import javax.servlet.http.HttpSession;

/**
 *
 * @author WINDOWS 10
 */
public class sv2 extends HttpServlet {

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
        String Radio = request.getParameter("radiobutton");
		System.out.println(Radio);
		String Save = request.getParameter("s1");
		String View = request.getParameter("btnView");
		String Delete = request.getParameter("btnDelete");
                System.out.println(Save);
                   System.out.println(View);
                      System.out.println(Delete);
		String EmpID1 = null;
		String Designation1 = null;
		String PhoneNo1 = null;
		String EmpName1 = null;
		String JoinDate1 = null;
		String Address1 = null;
		try {
			int flag = 0;
     HttpSession so = request.getSession(true);
			String url = "jdbc:mysql://localhost:3306/student_db";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, "root", "root");
			Statement st = con.createStatement();
		Statement st1 = con.createStatement();
                Statement st2 = con.createStatement();
String v1=null,v2=null;
			if ("Insert".equals(Save)) {
				String a1 = request.getParameter("a1");
				String a2 = request.getParameter("a2");
				String a3 = request.getParameter("a3");
				String a4 = request.getParameter("a4");
				
      java.util.Date st11 = new java.util.Date();
                // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String f = formatter.format(st11);
                System.out.println("Formatted date is ==>" + f);
				
			 System.out.println("update studentpermission set grant='"
							+ a4 + "'where rid='" + a3+ "'" );
					int k = st.executeUpdate("UPDATE lack SET paid='"+a4+"' where lid='" + a1+ "'");
                                   
				
				if ((k > 0)) {

						request.setAttribute("ss", "1");
						request.setAttribute("msg",
								"Given Details are Added Successfully");
						RequestDispatcher requestDispatcher = request
								.getRequestDispatcher("st5.jsp");
						requestDispatcher.forward(request, response);
					} else {
						request.setAttribute("ss", "1");
						request.setAttribute("msg",
								"Given Datas Not Inserted ..!");
						RequestDispatcher requestDispatcher = request
								.getRequestDispatcher("st5.jsp");
						requestDispatcher.forward(request, response);
					}
				
			}  else if ("View".equals(View)) {
				// String Empid=request.getParameter("txtEmpID");
				ResultSet rs1 = st
						.executeQuery("select * from lack where lid='"
								+ Radio + "'");
				while (rs1.next()) {
					EmpID1 = rs1.getString(1);
					Designation1 = rs1.getString(10);
					PhoneNo1 = rs1.getString(11);
					System.out.println(EmpID1);
                                        System.out.println(Designation1);
                                        System.out.println(PhoneNo1);

				}
				request.setAttribute("ss1", "1");
				request.setAttribute("EmpID1", EmpID1);
				request.setAttribute("Designation1", Designation1);
				request.setAttribute("PhoneNo1", PhoneNo1);
		

				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("st5.jsp");
				requestDispatcher.forward(request, response);
			}
		}

		catch (Exception e) {
			out.println(e);
		}finally {            
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
