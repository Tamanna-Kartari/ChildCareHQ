package ConnectionFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MJPJAY extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession httpSession = req.getSession();
		PrintWriter out = resp.getWriter();

		String n = req.getParameter("name");
		String a = req.getParameter("age");
		String ph = req.getParameter("phone");
		String e = req.getParameter("email");
		String g = req.getParameter("gender");
		String address = req.getParameter("address");
		String rt = req.getParameter("rationtype");
		String ration = req.getParameter("ration");
		String attach = req.getParameter("attachment");
		
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
        Date date= new Date();
        String dor=simpleDateFormat.format(date);
         dor=req.getParameter("dob");		

		try {
			Connection con = ParentInterface.con;
			Statement smt = con.createStatement();
//			ResultSet rs = smt.executeQuery("select * from patientsignup where status=1");

//			httpSession.setAttribute("nameValue", rs.getString("username"));
//			httpSession.setAttribute("emailValue", rs.getString("email"));
//			httpSession.setAttribute("phoneValue", rs.getString("contactnumber"));
//			httpSession.setAttribute("addressValue", rs.getString("address"));
//			httpSession.setAttribute("genderValue", rs.getString("contactnumber"));
//			httpSession.setAttribute("dobValue", rs.getString("contactnumber"));
			

			smt.execute("insert into mjpjay(name,email,phone,dob,gender,address,rationtype,status) values("+n+","+e+","+ph+","+dor+","+g+","+a+",'"+rt+"',1)");

			RequestDispatcher rd = req.getRequestDispatcher("yojform2.html");
			out.println("<h1>Record Submitted</h1>");
			rd.include(req, resp);

			smt.close();
			con.close();
		} catch (Exception ex) {
			out.println("<h1>" + ex + "</h1>");
		}
	}
}
