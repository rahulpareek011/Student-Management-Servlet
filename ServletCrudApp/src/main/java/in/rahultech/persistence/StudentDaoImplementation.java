package in.rahultech.persistence;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import in.rahultech.dto.Student;

public class StudentDaoImplementation implements RStudentDao {

    private static final String URL = "jdbc:mysql://localhost:3306/servletcrud";
    private static final String USER = "demo_user";
    private static final String PASS = "demo_pass";

    public StudentDaoImplementation() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean addStudent(Student s) {
        String sql = "INSERT INTO student(name, age, address) VALUES (?, ?, ?)";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getName());
            ps.setInt(2, s.getAge());
            ps.setString(3, s.getAddress());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Student getStudentById(int id) {
        String sql = "SELECT * FROM student WHERE id = ?";
        Student s = null;

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setAge(rs.getInt("age"));
                s.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    @Override
    public boolean updateStudent(Student s) {
        String sql = "UPDATE student SET name=?, age=?, address=? WHERE id=?";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, s.getName());
            ps.setInt(2, s.getAge());
            ps.setString(3, s.getAddress());
            ps.setInt(4, s.getId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM student WHERE id = ?";

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            int ra = ps.executeUpdate();
            if(ra>0) return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
		return false;
    }

    @Override
    public List<Student> getAllStudents() {
        String sql = "SELECT * FROM student";
        List<Student> list = new ArrayList<>();

        try (Connection con = DriverManager.getConnection(URL, USER, PASS);
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setAge(rs.getInt("age"));
                s.setAddress(rs.getString("address"));
                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
