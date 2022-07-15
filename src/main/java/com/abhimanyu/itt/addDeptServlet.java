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

@WebServlet("/addDeptServlet")
public class addDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String department = request.getParameter("department");		
		String project = request.getParameter("project");
		String project_manager = request.getParameter("project_manager");
		String technology = request.getParameter("technology");
		
		RequestDispatcher dispatcher = null;
		Connection connection = null;
		
		if(department ==null || department.equals("")) {
			request.setAttribute("status","invalidDeptName");
			dispatcher = request.getRequestDispatcher("adddept.jsp");
			dispatcher.forward(request,response);			
		}		
		if(project ==null || project.equals("")) {
			request.setAttribute("status","invalidProject");
			dispatcher = request.getRequestDispatcher("adddept.jsp");
			dispatcher.forward(request,response);			
		}
		if(project_manager ==null || project_manager.equals("")) {
			request.setAttribute("status","invalidProjectManager");
			dispatcher = request.getRequestDispatcher("adddept.jsp");
			dispatcher.forward(request,response);			
		}
		if(technology ==null || technology.equals("")) {
			request.setAttribute("status","invalidTech");
			dispatcher = request.getRequestDispatcher("adddept.jsp");
			dispatcher.forward(request,response);			
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ittsas?useSSL=false","root", "root");
			PreparedStatement preparedstatement = connection.prepareStatement("insert into department (department ,project, project_manager, technology) values (?,?,?,?)");
			
			preparedstatement.setString(1, department);
			preparedstatement.setString(2, project);
			preparedstatement.setString(3, project_manager);
			preparedstatement.setString(4, technology);
						
			int rowCount = preparedstatement.executeUpdate();
			dispatcher = request.getRequestDispatcher("adddept.jsp");
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


