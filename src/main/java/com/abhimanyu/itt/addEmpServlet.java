package com.abhimanyu.itt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addEmpServlet
 */
@WebServlet("/addEmpServlet")
public class addEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String empid = request.getParameter("empid");	
		String email = request.getParameter("email");
		String project = request.getParameter("project");		
		
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ittsas?useSSL=false","root", "root");
			PreparedStatement preparedstatement = connection.prepareStatement("insert into employees (name,empid, email, project) values (?,?,?,?)");
			
			preparedstatement.setString(1, name);
			preparedstatement.setString(2, empid);	
			preparedstatement.setString(3, email);
			preparedstatement.setString(4, project);
			
						
			int rowCount = preparedstatement.executeUpdate();
			dispatcher = request.getRequestDispatcher("addemp.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
			}
			if(name ==null || name.equals("")) {
				request.setAttribute("status","invalidName");
				dispatcher = request.getRequestDispatcher("addemp.jsp");
				dispatcher.forward(request,response);			
			}
			if(empid ==null || empid.equals("")) {
				request.setAttribute("status","invalidId");
				dispatcher = request.getRequestDispatcher("addemp.jsp");
				dispatcher.forward(request,response);			
			}
			if(email ==null || email.equals("")) {
				request.setAttribute("status","invalidEmail");
				dispatcher = request.getRequestDispatcher("addemp.jsp");
				dispatcher.forward(request,response);			
			}
			if(project ==null || project.equals("")) {
				request.setAttribute("status","invalidProject");
				dispatcher = request.getRequestDispatcher("addemp.jsp");
				dispatcher.forward(request,response);			
			}
			 dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
