package dB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.DocApp;

public class DoctorAppointmentDB {
	public ResultSet getAllDetails(String ids) throws SQLException {
		int id =Integer.parseInt(ids);
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="SELECT a.id, a.date, a.username, a.age, a.contact, a.address, a.userid,a.status,a.time, a.gender FROM appointment a WHERE a.doctorid=" + id;
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
	
	public void adddoc(DocApp docapp) throws SQLException{
		
	     int appId= docapp.getAppointmentID();
	     int docId= docapp.getDocId();
	     String time = docapp.getTime();
	     String status= docapp.getStatus();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		PreparedStatement ps =con.prepareStatement("INSERT INTO docapplist ( appintmentid ,time ,status, docid ) VALUES ( ? ,? ,?, ?);");  
		
		ps.setInt(1, appId);
		ps.setString(2, time);
		ps.setString(3, status);
		ps.setInt(4, docId);
		
		 ps.execute();
	}
	
	public void updatedoc(DocApp docapp) throws SQLException{
		
	     int appId= docapp.getAppointmentID();
	     String time = docapp.getTime();
	     String status= docapp.getStatus();
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root",""); 
		PreparedStatement ps =con.prepareStatement("UPDATE appointment set status = ? ,time = ? WHERE id = ? ;");  
		
		
		ps.setString(1, status);
		ps.setString(2, time);
		ps.setInt(3, appId);
		
		 ps.execute();
	}
	
	public void delete(int id) throws SQLException{
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="delete from docapplist where id ="+id;
		st.executeUpdate(query);
	}
	
	public void update(int id) throws SQLException{
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root",""); 
		PreparedStatement ps =con.prepareStatement("UPDATE appointment set status = ? ,time = ? WHERE id = ? ;");  
		
		
		ps.setString(1, "Canceled");
		ps.setString(2, "No time");
		ps.setInt(3, id);
		
		 ps.execute();
	}
	
	public ResultSet getAllAppointments(String ids) throws SQLException {
		int id =Integer.parseInt(ids);
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling","root","");
		Statement st =con.createStatement();
		String query="SELECT * FROM docapplist WHERE docid =" +id;
		ResultSet rs = st.executeQuery(query);
		
		return rs;
	}
}
