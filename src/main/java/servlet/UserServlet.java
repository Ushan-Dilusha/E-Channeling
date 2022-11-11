package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dB.UserDB;
import model.User;


@WebServlet("/User")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	User us = new User();
	UserDB uDB = new UserDB();


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
			String address = request.getParameter("Address");

			us.setName(name);
			us.setAge(age);
			us.setContact(contact);
			us.setNic(nic);
			us.setGender(gender);
			us.setUname(uName);
			us.setPass(pass);
			us.setAddress(address);

			try {
				uDB.addUser(us);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect("userLogin.jsp");

		}		
		else if (request.getParameter("makeAppointment") != null) {
			String doctorId = "" + request.getParameter("doctorid");

			request.setAttribute("doctorId", doctorId);
			request.getRequestDispatcher("addAppointment.jsp").forward(request, response);
		}

	}

}
