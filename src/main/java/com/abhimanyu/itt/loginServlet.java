package com.abhimanyu.itt;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;


@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empid = request.getParameter("empid");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ittsas?useSSL=false","root", "root");
			PreparedStatement preparedstatement = connection.prepareStatement("select * from admin where empid = ? and password = ?");
			preparedstatement.setString(1, empid);
			preparedstatement.setString(2, password);
			
			ResultSet resultset = preparedstatement.executeQuery();
			if (resultset.next()) {
				session.setAttribute("name", resultset.getString("name"));
				dispatcher = request.getRequestDispatcher("main.jsp");
			}			
			else {
				request.setAttribute("status","failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			if(empid ==null || empid.equals("")) {
				request.setAttribute("status","invalidId");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request,response);			
			}
			if(password ==null || password.equals("")) {
				request.setAttribute("status","invalidPassword");
				dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request,response);			
			}
			dispatcher.forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
