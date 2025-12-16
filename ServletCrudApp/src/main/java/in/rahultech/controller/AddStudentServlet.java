package in.rahultech.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import in.rahultech.Service.RStudentService;
import in.rahultech.dto.Student;
import in.rahultech.serviceFactory.StudentServiceFactory;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    private RStudentService studentService;

    @Override
    public void init() throws ServletException {
        studentService = StudentServiceFactory.getStudentService();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String address = req.getParameter("address");

        Student s = new Student();
        s.setName(name);
        s.setAge(age);
        s.setAddress(address); // ensure dto has field

        boolean result = studentService.addStudent(s);

        if (result)
            resp.sendRedirect("students");     // go back to list
        else
            resp.getWriter().println("Failed to insert student!");
    }
}
