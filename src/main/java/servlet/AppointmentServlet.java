package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dB.AppointmentDB;
import model.Appointment;


@WebServlet("/Appointment")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Appointment Ap = new Appointment();
	AppointmentDB Adb = new AppointmentDB();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("Add") != null) {

			String doctorId = "" + request.getParameter("doctorid");
			String userId = "" + request.getParameter("userid");

			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String contact = request.getParameter("contact");
			String date = request.getParameter("date");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");

			Ap.setDocid(doctorId);
			Ap.setUserid(userId);
			Ap.setUsername(name);
			Ap.setAge(age);
			Ap.setContact(contact);
			Ap.setDate(date);
			Ap.setGender(gender);
			Ap.setAddress(address);

			try {
				Adb.addAppointment(Ap);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect("UserHome.jsp");

		} else if (request.getParameter("edit") != null) {
			String ids = "" + request.getParameter("id");

			request.setAttribute("id", ids);
			request.getRequestDispatcher("editAppointment.jsp").forward(request, response);
		} else if (request.getParameter("delete") != null) {

			try {
				int ids = Integer.parseInt(request.getParameter("id"));
				Adb.deleteAppointment(ids);
				response.sendRedirect("UserHome.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}		else if (request.getParameter("update") != null) {

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String contact = request.getParameter("contact");
			String date = request.getParameter("date");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");

			Ap.setUsername(name);
			Ap.setAge(age);
			Ap.setContact(contact);
			Ap.setDate(date);
			Ap.setGender(gender);
			Ap.setAddress(address);

			try {
				Adb.updateDetails(Ap, id);
				response.sendRedirect("UserHome.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

		}
	}

}
