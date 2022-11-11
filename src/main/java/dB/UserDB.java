package dB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.User;

public class UserDB {
	
	private void LoadDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		}
	}

	public void addUser(User us) throws SQLException{
	     String name= us.getName();
	     String age= us.getAge();
	     String contact= us.getContact();
	     String nic= us.getNic();
	     String gender= us.getGender();
	     String uName= us.getUname();
	     String pass= us.getPass();
	     String address = us.getAddress();
	     
	     LoadDriver();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("INSERT INTO user (name ,age ,contact ,nic ,gender ,uname ,pass ,address ) VALUES (? ,? ,? ,? ,? ,? ,? ,? );");  
		ps.setString(1, name);
		ps.setString(2, age);
		ps.setString(3, contact);
		ps.setString(4, nic);
		ps.setString(5, gender);
		ps.setString(6, uName);
		ps.setString(7, pass);
		ps.setString(8, address);
		
		 ps.execute();
	}
	
}
