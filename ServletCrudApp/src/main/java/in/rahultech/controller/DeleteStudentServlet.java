package in.rahultech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.rahultech.Service.RStudentService;
import in.rahultech.dto.Student;
import in.rahultech.serviceFactory.StudentServiceFactory;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet{
	private RStudentService studentService;
	
	@Override
	public void init() throws ServletException {
		 studentService = StudentServiceFactory.getStudentService();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String idStr = req.getParameter("id");

	    if (idStr == null || idStr.trim().isEmpty()) {
	        resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID missing");
	        return;
	    }

	    int id = Integer.parseInt(idStr);

	    boolean result = studentService.deleteStudent(id);

	    if (result) {
	        resp.sendRedirect("students");
	    } else {
	        resp.getWriter().println("Failed to delete student!");
	    }
	}

}
