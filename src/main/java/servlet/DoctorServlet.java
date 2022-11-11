package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dB.DoctorDB;
import model.Doctor;

@WebServlet("/Doctor")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Doctor doc = new Doctor();
	DoctorDB dDB = new DoctorDB();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");

		if (request.getParameter("Add") != null) {

			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String contact = request.getParameter("contact");
			String nic = request.getParameter("Nic");
			String gender = request.getParameter("gender");
			String uName = request.getParameter("Uname");
			String pass = request.getParameter("pass");
			String specialization = request.getParameter("specialization");

			doc.setName(name);
			doc.setAge(age);
			doc.setContact(contact);
			doc.setNic(nic);
			doc.setGender(gender);
			doc.setUname(uName);
			doc.setPass(pass);
			doc.setSpecialization(specialization);

			try {
				dDB.addDoctor(doc);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect("editorHome.jsp");

		}

		else if (request.getParameter("delete") != null) {

			try {
				int ids = Integer.parseInt(request.getParameter("id"));
				dDB.deleteDoctor(ids);
				response.sendRedirect("editorHome.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}

		else if (request.getParameter("edit") != null) {
			String ids = "" + request.getParameter("id");

			request.setAttribute("id", ids);
			request.getRequestDispatcher("editDoctor.jsp").forward(request, response);
		}

		else if (request.getParameter("update") != null) {

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String contact = request.getParameter("contact");
			String nic = request.getParameter("Nic");
			String gender = request.getParameter("gender");
			String uName = request.getParameter("Uname");
			String pass = request.getParameter("pass");
			String specialization = request.getParameter("specialization");

			doc.setName(name);
			doc.setAge(age);
			doc.setContact(contact);
			doc.setNic(nic);
			doc.setGender(gender);
			doc.setUname(uName);
			doc.setPass(pass);
			doc.setSpecialization(specialization);

			try {
				dDB.updateDetails(doc, id);
				response.sendRedirect("editorHome.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

		}
	}

}
