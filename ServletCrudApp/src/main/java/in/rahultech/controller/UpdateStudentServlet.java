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

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {

    private RStudentService studentService;

    @Override
    public void init() throws ServletException {
        studentService = StudentServiceFactory.getStudentService();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        // Get student from DB
        Student s = studentService.getStudentById(id);

        // Store in request
        req.setAttribute("student", s);

        // Open update form
        req.getRequestDispatcher("updateStudent.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String address = req.getParameter("address");

        Student s = new Student();
        s.setId(id);
        s.setName(name);
        s.setAge(age);
        s.setAddress(address);
        
        boolean result = studentService.updateStudent(s);

        if (result) {
            resp.sendRedirect("students");  
        } else {
            resp.getWriter().println("Failed to update student!");
        }
    }
}
