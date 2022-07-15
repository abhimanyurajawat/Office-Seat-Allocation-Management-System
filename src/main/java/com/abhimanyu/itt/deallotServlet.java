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
 * Servlet implementation class deallotServlet
 */
@WebServlet("/deallotServlet")
public class deallotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empid = request.getParameter("empid");		
		
				
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		
		if(empid ==null || empid.equals("")) {
			request.setAttribute("status","invalidEmployeeId");
			dispatcher = request.getRequestDispatcher("deallot.jsp");
			dispatcher.forward(request,response);			
		}				
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ittsas?useSSL=false","root", "root");
			PreparedStatement preparedstatement = connection.prepareStatement("delete from allocation where empid=?");
			
			preparedstatement.setString(1, empid);			
			
									
			int rowCount = preparedstatement.executeUpdate();
			dispatcher = request.getRequestDispatcher("deallot.jsp");
			if(rowCount > 0) {
				request.setAttribute("status", "success");
			} else {
				request.setAttribute("status", "failed");
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


