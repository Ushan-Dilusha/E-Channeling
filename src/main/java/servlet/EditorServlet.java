package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dB.EditorDB;
import model.Editor;

@WebServlet("/Editor")
public class EditorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Editor Ed = new Editor();
	EditorDB Edb = new EditorDB();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		if (request.getParameter("Add") != null) {

			String name = request.getParameter("name");
			String age = request.getParameter("age");
			String contact = request.getParameter("contact");
			String nic = request.getParameter("Nic");
			String gender = request.getParameter("gender");
			String uName = request.getParameter("Uname");
			String pass = request.getParameter("pass");

			Ed.setName(name);
			Ed.setAge(age);
			Ed.setContact(contact);
			Ed.setNic(nic);
			Ed.setGender(gender);
			Ed.setUname(uName);
			Ed.setPass(pass);

			try {
				Edb.addEditor(Ed);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect("adminHome.jsp");

		}

		else if (request.getParameter("delete") != null) {

			try {
				int ids = Integer.parseInt(request.getParameter("id"));
				Edb.deleteEditor(ids);
				response.sendRedirect("adminHome.jsp");
			} catch (SQLException e) {
			
				e.printStackTrace();
			}
		}

		else if (request.getParameter("edit") != null) {
			String ids = "" + request.getParameter("id");

			request.setAttribute("id", ids);
			request.getRequestDispatcher("editEditor.jsp").forward(request, response);
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

			Ed.setName(name);
			Ed.setAge(age);
			Ed.setContact(contact);
			Ed.setNic(nic);
			Ed.setGender(gender);
			Ed.setUname(uName);
			Ed.setPass(pass);

			try {
				Edb.updateDetails(Ed, id);
				response.sendRedirect("adminHome.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

		}

	}

}
