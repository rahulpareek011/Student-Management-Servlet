package in.rahultech.Service;

import java.util.List;

import in.rahultech.daofactory.StudentDaoFactory;
import in.rahultech.dto.Student;
import in.rahultech.persistence.RStudentDao;

public class StudentServiceImplementation implements RStudentService {

    private RStudentDao daoServices;
    @Override
    public boolean addStudent(Student s) {
    	daoServices = StudentDaoFactory.getStudentDao();
        return daoServices.addStudent(s);
    }

    @Override
    public Student getStudentById(int id) {
    	daoServices = StudentDaoFactory.getStudentDao();
        return daoServices.getStudentById(id);
    }

    @Override
    public boolean updateStudent(Student s) {
    	daoServices = StudentDaoFactory.getStudentDao();
        return daoServices.updateStudent(s);
    }

    @Override
    public boolean deleteStudent(int id) {
    	daoServices = StudentDaoFactory.getStudentDao();
        return daoServices.deleteStudent(id);
    }

    @Override
    public List<Student> getAllStudents() {
    	daoServices = StudentDaoFactory.getStudentDao();
        return daoServices.getAllStudents();
    }
}
