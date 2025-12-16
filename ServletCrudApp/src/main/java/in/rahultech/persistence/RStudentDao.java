package in.rahultech.persistence;

import java.util.List;
import in.rahultech.dto.Student;

public interface RStudentDao {

    boolean addStudent(Student s);

    Student getStudentById(int id);

    boolean updateStudent(Student s);

    boolean deleteStudent(int id);

    List<Student> getAllStudents();
}
