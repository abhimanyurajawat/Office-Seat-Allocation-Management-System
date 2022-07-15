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
@WebServlet("/viewseatbyrow")
public class viewseatbyrow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String floor = request.getParameter("floor");	
		String side = request.getParameter("side");
		String rownumber = request.getParameter("rownumber");
		
		
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
			
			PreparedStatement preparedstatement = connection.prepareStatement("select count(empid), rowcapacity, rownumber from allocation where floor = ? and side = ? and rownumber = ?");
			preparedstatement.setString(1, floor);	
			preparedstatement.setString(2, side);
			preparedstatement.setString(3, rownumber);
			ResultSet resultset = preparedstatement.executeQuery();
			

			   
			   if (resultset.next()) {
				   request.setAttribute(floor, connection);
					session.setAttribute("count(empid)", resultset.getString("count(empid)"));					
					session.setAttribute("rowcapacity", resultset.getString("rowcapacity")); 
					session.setAttribute("rownumber", resultset.getString("rownumber")); 
					
					
					
					
					
					dispatcher = request.getRequestDispatcher("showseatbyrow.jsp");
				} else {
					request.setAttribute("status","failed");
					dispatcher = request.getRequestDispatcher("viewseatbyrow.jsp");
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

