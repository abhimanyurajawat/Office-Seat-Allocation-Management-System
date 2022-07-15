package com.abhimanyu.itt;

import java.io.IOException;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class viewSeatServlet
 */
@WebServlet("/viewSeatServlet")
public class viewSeatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String floor = request.getParameter("floor");		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		
		if(floor ==null || floor.equals("")) {
			request.setAttribute("status","invalidFloorNumber");
			dispatcher = request.getRequestDispatcher("viewseat.jsp");
			dispatcher.forward(request,response);			
		}
		 
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ittsas?useSSL=false","root", "root");
			
			PreparedStatement preparedstatement = connection.prepareStatement("select count(empid), floorcapacity, floor from allocation where floor = ?");			
			preparedstatement.setString(1, floor);				
			ResultSet resultset = preparedstatement.executeQuery();
			

			   
			   if (resultset.next()) {
				   request.setAttribute(floor, connection);
					session.setAttribute("count(empid)", resultset.getString("count(empid)"));
					session.setAttribute("floorcapacity", resultset.getString("floorcapacity"));
					session.setAttribute("floor", resultset.getString("floor"));				
					dispatcher = request.getRequestDispatcher("showseats.jsp");
				} else {
					request.setAttribute("status","failed");
					dispatcher = request.getRequestDispatcher("viewseat.jsp");
				}		
					 
			dispatcher.forward(request,response);
		} 
		catch (Exception e) {
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

			  

		
