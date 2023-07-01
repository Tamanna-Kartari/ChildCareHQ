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

public class DocSignUp extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PrintWriter out = resp.getWriter();

		String n = req.getParameter("name");
		String e = req.getParameter("email");
		String p = req.getParameter("phone");
		String d = req.getParameter("dob");
		String g = req.getParameter("gender");
		String s = req.getParameter("speciality");
		String ps = req.getParameter("practicesince");
		String pass = req.getParameter("password");
		String cp = req.getParameter("cpassword");

		if (!pass.equals(cp)) {
			RequestDispatcher rd = req.getRequestDispatcher("docsignup2.html");
			out.println("<h1>Password and confirm Password are not same. </h1>");
			rd.include(req, resp);
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/childcarehq", "root", "");
				Statement smt = con.createStatement();
				smt.execute(
						"insert into docsignup(name,email,phone,dob,gender,speciality,practicesince,password,cpassword,status) values('"
								+ n + "','" + e + "','" + p + "','" + d + "','" + g + "','" + s + "','" + ps + "','"
								+ pass + "','" + cp + "',1)");

				RequestDispatcher rd = req.getRequestDispatcher("doclogin2.html");
				out.println("<h1>Account Created Successfully</h1>");
				rd.include(req, resp);

				smt.close();
				con.close();
			} catch (Exception ex) {
				RequestDispatcher rd = req.getRequestDispatcher("doclogin2.html");
				out.println("<h1>" + ex + "</h1>");
				rd.include(req, resp);
			}
		}
	}
}
