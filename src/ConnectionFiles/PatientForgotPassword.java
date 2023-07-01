package ConnectionFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PatientForgotPassword extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();

			String inputEmail = request.getParameter("email");

			Connection con = ParentInterface.con;

			Statement smt = con.createStatement();
			ResultSet rs = smt.executeQuery("select * from patientsignup where email='" + inputEmail + "' ");

			if (rs.next()) {
				String password = rs.getString("password");
				String name = rs.getString("username");

				String sub = "Account Created for Childcare-HQ";
				String emailText = name + " Your Forgot Password For Login Account is: " + password;

				EmailSender.send("roshandalal2002@gmail.com", "arelevjcctryvaul", inputEmail, sub, emailText);

				RequestDispatcher rd = request.getRequestDispatcher("patientlogin.html");
				out.println("<h1>Password is sent on your Registered Email</h1>");
				rd.include(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("patforgotpass.html");
				out.println("<h1>There is no account registered on this email</h1>");
				rd.include(request, response);
			}

		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("patforgotpass.html");
			System.out.println(e);
			rd.include(request, response);

		}
	}

}
