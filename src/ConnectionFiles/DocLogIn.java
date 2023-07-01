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
import javax.servlet.http.HttpSession;

public class DocLogIn extends HttpServlet
{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		HttpSession httpSession = request.getSession();
		response.setContentType("text/html");
		
		
		try {
			
				String email = request.getParameter("email");
				String password = request.getParameter("password");
			Connection con = ParentInterface.con;
			Statement smt = con.createStatement();

			ResultSet rs = smt.executeQuery(
					"select * from doctorsignup where email='" + email + "' and password='" + password + "'and status = 1");

			if (rs.next()) {
				httpSession.setAttribute("LoginEmail", rs.getString("email"));
				httpSession.setAttribute("LoginId", rs.getInt("id"));
				httpSession.setAttribute("LoginUsername", rs.getString("username"));
				httpSession.setAttribute("LoginPass", rs.getString("password"));
				httpSession.setAttribute("LoginPhone", rs.getInt("phone"));

				RequestDispatcher rd = request.getRequestDispatcher("docWebPage.jsp");
				rd.include(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("doclogin2.html");
				out.println("<h1>Invalid Username or Password</h1>");
				rd.include(request, response);
			}
				
			
		} catch (Exception e) {
			RequestDispatcher rd = request.getRequestDispatcher("doclogin2.html");
			rd.include(request, response);
			out.print(e);
		}
	}
}


