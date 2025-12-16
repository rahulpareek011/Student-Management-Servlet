package in.rahultech.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.rahultech.Service.RStudentService;
import in.rahultech.dto.Student;
import in.rahultech.serviceFactory.StudentServiceFactory;

@WebServlet("/students")
public class MyServlet extends HttpServlet {

    private RStudentService studentService;

    @Override
    public void init() throws ServletException {
        studentService = StudentServiceFactory.getStudentService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
    	List<Student> list = studentService.getAllStudents();
        //System.out.println(list);
        req.setAttribute("students", list);
        RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
        rd.forward(req, resp);
    }
}
