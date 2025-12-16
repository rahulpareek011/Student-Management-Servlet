package in.rahultech.Service;

import java.util.List;

import in.rahultech.dto.Student;

public interface RStudentService {
	//Operation to be implemented
	boolean addStudent(Student s);

    Student getStudentById(int id);

    boolean updateStudent(Student s);

    boolean deleteStudent(int id);

    List<Student> getAllStudents();
}