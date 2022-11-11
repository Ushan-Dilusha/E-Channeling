package dB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Logincredentials;


public class CheckLogin {
	
	private void LoadDriver() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}

	
	public ResultSet Admin(Logincredentials lc) throws SQLException{
		String uname = lc.getUName();
		String pass = lc.getPass();
		
		LoadDriver();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("select * from admin WHERE username=? and password=?");  
		ps.setString(1, uname);
		ps.setString(2, pass);
		
		ResultSet rs = ps.executeQuery();
		return rs;
	}
	
	public ResultSet Editor(Logincredentials lc) throws SQLException{
		String uname = lc.getUName();
		String pass = lc.getPass();
		
		LoadDriver();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("select * from editor WHERE uName=? and pass=?");  
		ps.setString(1, uname);
		ps.setString(2, pass);
		
		ResultSet rs = ps.executeQuery();
		return rs;
	}
	
	public ResultSet User(Logincredentials lc) throws SQLException{
		String uname = lc.getUName();
		String pass = lc.getPass();
		
		LoadDriver();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("select * from user WHERE uname=? and pass=?");  
		ps.setString(1, uname);
		ps.setString(2, pass);
		
		ResultSet rs = ps.executeQuery();
		return rs;
	}

	public ResultSet Doctor(Logincredentials lc) throws SQLException{
		String uname = lc.getUName();
		String pass = lc.getPass();
		
		LoadDriver();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("select * from doctor WHERE uname=? and pass=?");  
		ps.setString(1, uname);
		ps.setString(2, pass);
		
		ResultSet rs = ps.executeQuery();
		return rs;
	}
}
