package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dB.DoctorAppointmentDB;
import model.DocApp;


@WebServlet("/DocAppointment")
public class DocAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DocApp doc = new DocApp();
	DoctorAppointmentDB dDB = new DoctorAppointmentDB();
  

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		if (request.getParameter("Add") != null) {

			int appId = Integer.parseInt(request.getParameter("appId"));
			int docId = Integer.parseInt(request.getParameter("docId"));
			
			String time = request.getParameter("time");

			doc.setDocId(docId);
			doc.setAppointmentID(appId);
			doc.setTime(time);
			doc.setStatus("Confirmed");

			try {
				dDB.adddoc(doc);
				dDB.updatedoc(doc);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			response.sendRedirect("DoctorHome.jsp");

		}else if (request.getParameter("delete") != null) {

			try {
				int appid = Integer.parseInt(request.getParameter("appid"));
				int id = Integer.parseInt(request.getParameter("id"));
				dDB.delete(id);
				dDB.update(appid);
				response.sendRedirect("DoctorHome.jsp");
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}

}
