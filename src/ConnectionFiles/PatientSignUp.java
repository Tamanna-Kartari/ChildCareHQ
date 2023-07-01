package ConnectionFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PatientSignUp extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String u = request.getParameter("username");
		String p = request.getParameter("password");
		String g = request.getParameter("gender");
		String e = request.getParameter("email");
		String ph = request.getParameter("phone");
		String a = request.getParameter("address");
		String cp = request.getParameter("confirmpassword");
		
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
        Date date= new Date();
        String dor=simpleDateFormat.format(date);
         dor=request.getParameter("dob");

		if (!p.equals(cp)) {
			RequestDispatcher rd = request.getRequestDispatcher("patientsignup2.html");
			out.println("<h1>Password and confirm Password are not same. </h1>");
			rd.include(request, response);
		} else {
			try {
				Class.forName("com.mysql.jdbc.Driver");

				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/childcarehq", "root", "");
				Statement smt = con.createStatement();
				smt.execute("insert into patientsignup(username,password,gender,email,date,phone,address,status) values('"+u+"','"+p+"','"+g+"','"+e+"','"+dor+"','"+ph+"','"+a+"',1)");

				RequestDispatcher rd = request.getRequestDispatcher("patientlogin2.html");
				out.println("<h1>Account Created Successfully</h1>");
				rd.include(request, response);

				smt.close();
				con.close();
			} catch (Exception ex) {
				out.println("<h1>" + ex + "</h1>");
			}
		}

	}

}
