package dB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Editor;



public class EditorDB {
	public void addEditor(Editor ed) throws SQLException{
	     String name= ed.getName();
	     String age= ed.getAge();
	     String contact= ed.getContact();
	     String nic= ed.getNic();
	     String gender= ed.getGender();
	     String uName= ed.getUname();
	     String pass= ed.getPass();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("INSERT INTO editor ( name ,age ,contact ,Nic ,gender ,uName ,pass ) VALUES ( ? ,? ,? ,? ,? ,? ,? );");  
		ps.setString(1, name);
		ps.setString(2, age);
		ps.setString(3, contact);
		ps.setString(4, nic);
		ps.setString(5, gender);
		ps.setString(6, uName);
		ps.setString(7, pass);
		
		 ps.execute();
	}
	
	public ResultSet getDetails() throws SQLException {
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="select * from editor;";
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	public ResultSet getDetails(String ids) throws SQLException {
		int id =Integer.parseInt(ids);
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="select * from editor where id="+id;
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	public void deleteEditor(int id) throws SQLException{
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="delete from editor where id ="+id;
		st.executeUpdate(query);
	}
	
	public void updateDetails(Editor ed,String ids) throws SQLException {
		int id = Integer.parseInt(ids);
	     String name= ed.getName();
	     String age= ed.getAge();
	     String contact= ed.getContact();
	     String nic= ed.getNic();
	     String gender= ed.getGender();
	     String uName= ed.getUname();
	     String pass= ed.getPass();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("UPDATE editor SET name = ? ,age = ? ,contact = ? ,Nic = ? ,gender = ? ,uName = ? ,pass = ? WHERE ID = ? ;");
		
		ps.setString(1, name);
		ps.setString(2, age);
		ps.setString(3, contact);
		ps.setString(4, nic);
		ps.setString(5, gender);
		ps.setString(6, uName);
		ps.setString(7, pass);
		ps.setInt(8, id);
		
		 ps.execute();
		
	}
	
}
