package in.rahultech.serviceFactory;

import in.rahultech.Service.RStudentService;
import in.rahultech.Service.StudentServiceImplementation;

//Connection connection = DriverManager.getConnection(URL,userName,password);
public class StudentServiceFactory {
	//make constructor private to avoid object creation from outside
	private StudentServiceFactory() {}
	
	private static RStudentService studentservice = null;
	
	//logic to create only one object
	public static RStudentService getStudentService() {
		//Singleton Design pattern code
		if(studentservice == null) {
			studentservice = new StudentServiceImplementation();
		}
		return studentservice;
	}
}
