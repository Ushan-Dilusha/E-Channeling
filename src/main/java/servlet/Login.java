package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dB.CheckLogin;
import model.Logincredentials;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logincredentials lg = new Logincredentials();
	private CheckLogin cl = new CheckLogin();

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		if (request.getParameter("AdminLogin") != null) {
			
			String UName= request.getParameter("uname");
		    String pass= request.getParameter("pass");
		    
		    lg.setUName(UName);
			lg.setPass(pass);
			
			try {
				ResultSet rs = cl.Admin(lg);
				if(rs.next()) {
					request.getRequestDispatcher("adminHome.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}else if (request.getParameter("DoctorLogin") != null) {
			
			String UName= request.getParameter("uname");
		    String pass= request.getParameter("pass");
		    
		    lg.setUName(UName);
			lg.setPass(pass);
			
			try {
				ResultSet rs = cl.Doctor(lg);
				if(rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("DoctorId", rs.getString("id"));
					request.getRequestDispatcher("DoctorHome.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("DoctorLogin.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}else if(request.getParameter("EditorLogin") != null) {
			
			String UName= request.getParameter("uname");
		    String pass= request.getParameter("pass");
		    
		    lg.setUName(UName);
			lg.setPass(pass);
			
			try {
				ResultSet rs = cl.Editor(lg);
				if(rs.next()) {
					request.getRequestDispatcher("editorHome.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("EditLogin.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}else if(request.getParameter("UserLogin") != null) {
			
			String UName= request.getParameter("uname");
		    String pass= request.getParameter("pass");
		    
		    lg.setUName(UName);
			lg.setPass(pass);
			
			try {
				ResultSet rs = cl.User(lg);
				if(rs.next()) {
					HttpSession session = request.getSession();
					session.setAttribute("userId", rs.getString("id"));
					request.getRequestDispatcher("UserHome.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("userLogin.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		
	}



}
