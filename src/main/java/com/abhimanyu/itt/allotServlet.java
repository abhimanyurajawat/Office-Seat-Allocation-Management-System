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
 * Servlet implementation class allotServlet
 */
@WebServlet("/allotServlet")
public class allotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empid = request.getParameter("empid");
		String floor = request.getParameter("floor");
		String floorcapacity = request.getParameter("floorcapacity");
		String side = request.getParameter("side");
		String sidecapacity = request.getParameter("sidecapacity");
		String rownumber = request.getParameter("rownumber");
		String rowcapacity = request.getParameter("rowcapacity");
		String seatnumber = request.getParameter("seatnumber");	
						
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		
		if(empid ==null || empid.equals("")) {
			request.setAttribute("status","invalidEmployeeId");
			dispatcher = request.getRequestDispatcher("allot.jsp");
			dispatcher.forward(request,response);			
		}
		if(floor ==null || floor.equals("")) {
			request.setAttribute("status","invalidFloor");
			dispatcher = request.getRequestDispatcher("allot.jsp");
			dispatcher.forward(request,response);			
		}
		if(side ==null || side.equals("")) {
			request.setAttribute("status","invalidSide");
			dispatcher = request.getRequestDispatcher("allot.jsp");
			dispatcher.forward(request,response);			
		}
		if(rownumber ==null || rownumber.equals("")) {
			request.setAttribute("status","invalidRowNumber");
			dispatcher = request.getRequestDispatcher("allot.jsp");
			dispatcher.forward(request,response);			
		}
		if(seatnumber ==null || seatnumber.equals("")) {
			request.setAttribute("status","invalidSeatNumber");
			dispatcher = request.getRequestDispatcher("allot.jsp");
			dispatcher.forward(request,response);			
		}
		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ittsas?useSSL=false","root", "root");
			PreparedStatement preparedstatement = connection.prepareStatement("insert into allocation (empid, floor, floorcapacity, side, sidecapacity, rownumber, rowcapacity, seatnumber ) values (?,?,?,?,?,?,?,?)");
			
			preparedstatement.setString(1, empid);
			preparedstatement.setString(2, floor);
			preparedstatement.setString(3, floorcapacity);
			preparedstatement.setString(4, side);
			preparedstatement.setString(5, sidecapacity);
			preparedstatement.setString(6, rownumber);
			preparedstatement.setString(7, rowcapacity);
			preparedstatement.setString(8, seatnumber);			
									
			int rowCount = preparedstatement.executeUpdate();
			dispatcher = request.getRequestDispatcher("allot.jsp");
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


