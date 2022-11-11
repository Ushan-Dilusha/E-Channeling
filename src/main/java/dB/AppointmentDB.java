package dB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Appointment;

public class AppointmentDB {
	public void addAppointment(Appointment ap) throws SQLException{
		 
		 String docid= ap.getDocid();
		 String date = ap.getDate();
		 String username = ap.getUsername();
		 String age = ap.getAge();
		 String contact = ap.getContact();
		 String userid = ap.getUserid();
		 String gender = ap.getGender();
		 String address = ap.getAddress();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("INSERT INTO appointment (doctorid ,date ,username ,age ,contact ,address ,userid ,gender, status, time ) VALUES (? ,? ,? ,? ,? ,? ,? ,?,?,? );");  
		ps.setString(1, docid);
		ps.setString(2, date);
		ps.setString(3, username);
		ps.setString(4, age);
		ps.setString(5, contact);
		ps.setString(6, address);
		ps.setString(7, userid);
		ps.setString(8, gender);
		ps.setString(9, "Pending...");
		ps.setString(10, "please wait...");
		
		 ps.execute();
	}
	
	public ResultSet getAllDetails(String ids) throws SQLException {
		int id =Integer.parseInt(ids);
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="SELECT a.id, a.doctorid, a.date, a.username, a.age, a.contact, a.address, a.gender, d.name,d.specialization,a.status,a.time FROM appointment a, doctor d WHERE a.doctorid = d.id AND  a.userid="+ id;
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	public ResultSet getDetails(String ids) throws SQLException {
		int id =Integer.parseInt(ids);
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="SELECT a.id, a.doctorid, a.date, a.username, a.age, a.contact, a.address, a.userid, a.gender, d.name,d.specialization FROM appointment a, doctor d WHERE a.doctorid = d.id AND a.id="+id;
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	public void deleteAppointment(int id) throws SQLException{
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="delete from appointment where id ="+id;
		st.executeUpdate(query);
	}
	
	public void updateDetails(Appointment ap,String ids) throws SQLException {
		int id = Integer.parseInt(ids);
		 String date = ap.getDate();
		 String username = ap.getUsername();
		 String age = ap.getAge();
		 String contact = ap.getContact();
		 String gender = ap.getGender();
		 String address = ap.getAddress();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("UPDATE appointment SET date = ? ,username = ? ,age = ? ,contact = ? ,address = ? ,gender = ? WHERE id = ? ;");
		
		ps.setString(1, date);
		ps.setString(2, username);
		ps.setString(3, age);
		ps.setString(4, contact);
		ps.setString(5, address);
		ps.setString(6, gender);
		ps.setInt(7, id);
		
		 ps.execute();
		
	}
	
}
