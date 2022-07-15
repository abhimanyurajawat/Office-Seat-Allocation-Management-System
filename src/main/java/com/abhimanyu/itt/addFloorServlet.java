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
 * Servlet implementation class addFloorServlet
 */
@WebServlet("/addFloorServlet")
public class addFloorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String floor = request.getParameter("floor");
		String floorcapacity = request.getParameter("floorcapacity");	
		String sidel = request.getParameter("sidel");
		String sidecapacityl = request.getParameter("sidecapacityl");
		String totalrowsl = request.getParameter("totalrowsl");
		String rowcapacityl = request.getParameter("rowcapacityl");	
		String sider = request.getParameter("sider");
		String sidecapacityr = request.getParameter("sidecapacityr");
		String totalrowsr = request.getParameter("totalrowsr");
		String rowcapacityr = request.getParameter("rowcapacityr");
		
		
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		
		if(floor ==null || floor.equals("")) {
			request.setAttribute("status","invalidFloorNumber");
			dispatcher = request.getRequestDispatcher("addfloor.jsp");
			dispatcher.forward(request,response);			
		}
		if(floorcapacity ==null || floorcapacity.equals("")) {
			request.setAttribute("status","invalidFloorCapacity");
			dispatcher = request.getRequestDispatcher("addfloor.jsp");
			dispatcher.forward(request,response);			
		}		
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ittsas?useSSL=false","root", "root");
			PreparedStatement preparedstatement = connection.prepareStatement("insert into floor (floor,floorcapacity, sidel, sidecapacityl, totalrowsl, rowcapacityl, sider, sidecapacityr, totalrowsr, rowcapacityr ) values (?,?,?,?,?,?,?,?,?,?)");
			
			preparedstatement.setString(1, floor);
			preparedstatement.setString(2, floorcapacity);	
			preparedstatement.setString(3, sidel);
			preparedstatement.setString(4, sidecapacityl);
			preparedstatement.setString(5, totalrowsl);
			preparedstatement.setString(6, rowcapacityl);
			preparedstatement.setString(7, sider);
			preparedstatement.setString(8, sidecapacityr);
			preparedstatement.setString(9, totalrowsr);
			preparedstatement.setString(10, rowcapacityr);
						
			int rowCount = preparedstatement.executeUpdate();
			dispatcher = request.getRequestDispatcher("addfloor.jsp");
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


