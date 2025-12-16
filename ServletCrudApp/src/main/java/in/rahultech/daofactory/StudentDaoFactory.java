package in.rahultech.daofactory;

import in.rahultech.persistence.RStudentDao;
import in.rahultech.persistence.StudentDaoImplementation;

public class StudentDaoFactory {
	private StudentDaoFactory() {}
	
	private static RStudentDao studentDao = null;
	
	public static RStudentDao getStudentDao() {
		if(studentDao==null) {
			studentDao = new StudentDaoImplementation();
		}
		return studentDao;
	}

}
