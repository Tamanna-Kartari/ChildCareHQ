package ConnectionFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminSignUp extends HttpServlet
{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String u = request.getParameter("name");
		String p = request.getParameter("password");
		String g = request.getParameter("gender");
		String e = request.getParameter("email");
		String ph = request.getParameter("phone");
//		String a = request.getParameter("address");
		String cp = request.getParameter("cpassword");

		if (!p.equals(cp)) {
			RequestDispatcher rd = request.getRequestDispatcher("admsignup2.html");
			out.println("<h1>Password and confirm Password are not same. </h1>");
			rd.include(request, response);
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/childcarehq", "root", "");
				Statement smt = con.createStatement();
				smt.execute("insert into adminsignup(username,password,gender,email,phone,status) values('"+u+"','"+p+"','"+g+"','"+e+"','"+ph+"',1)");

				RequestDispatcher rd = request.getRequestDispatcher("admlogin2.html");
				out.println("<h1>Account Created Successfully</h1>");
				rd.include(request, response);

				smt.close();
				con.close();
			} catch (Exception ex) {
				RequestDispatcher rd = request.getRequestDispatcher("admlogin2.html");
				out.println("<h1>" + ex + "</h1>");
				rd.include(request, response);

			}
		}

	}
	
}
