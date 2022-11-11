package dB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Doctor;

public class DoctorDB {

	public void addDoctor(Doctor doc) throws SQLException {
		String name = doc.getName();
		String age = doc.getAge();
		String contact = doc.getContact();
		String nic = doc.getNic();
		String gender = doc.getGender();
		String uName = doc.getUname();
		String pass = doc.getPass();
		String specialization = doc.getSpecialization();

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling", "root", "");
		PreparedStatement ps = con.prepareStatement( "INSERT INTO doctor (name ,age ,contact ,nic ,gender, uname ,pass ,specialization ) VALUES (? ,? ,? ,? ,? ,? ,? ,? );");
		ps.setString(1, name);
		ps.setString(2, age);
		ps.setString(3, contact);
		ps.setString(4, nic);
		ps.setString(5, gender);
		ps.setString(6, uName);
		ps.setString(7, pass);
		ps.setString(8, specialization);

		ps.execute();
	}

	public ResultSet getDetails() throws SQLException {
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling", "root", "");
		Statement st = con.createStatement();
		String query = "select * from doctor;";
		ResultSet rs = st.executeQuery(query);

		return rs;
	}

	public ResultSet getDetails(String ids) throws SQLException {
		int id = Integer.parseInt(ids);
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling", "root", "");
		Statement st = con.createStatement();
		String query = "select * from doctor where id=" + id;
		ResultSet rs = st.executeQuery(query);

		return rs;
	}

	public void deleteDoctor(int id) throws SQLException {

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling", "root", "");
		Statement st = con.createStatement();
		String query = "delete from doctor where id =" + id;
		st.executeUpdate(query);
	}

	public void updateDetails(Doctor doc, String ids) throws SQLException {
		int id = Integer.parseInt(ids);
		String name = doc.getName();
		String age = doc.getAge();
		String contact = doc.getContact();
		String nic = doc.getNic();
		String gender = doc.getGender();
		String uName = doc.getUname();
		String pass = doc.getPass();
		String specialization = doc.getSpecialization();

		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3308/echannelling", "root", "");
		PreparedStatement ps = con.prepareStatement( "UPDATE doctor SET name = ? ,age = ? ,contact = ?,nic = ?,gender = ?   ,uname = ? ,pass = ? ,specialization = ? WHERE id = ? ;");

		ps.setString(1, name);
		ps.setString(2, age);
		ps.setString(3, contact);
		ps.setString(4, nic);
		ps.setString(5, gender);
		ps.setString(6, uName);
		ps.setString(7, pass);
		ps.setString(8, specialization);
		ps.setInt(9, id);

		ps.execute();

	}

}
