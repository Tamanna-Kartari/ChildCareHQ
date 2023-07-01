package ConnectionFiles;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

public class BookAppointment extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession httpSession = req.getSession();
		PrintWriter out = resp.getWriter();

		String n = req.getParameter("name");
		String e = req.getParameter("email");
		String a = req.getParameter("age");
		String ph = req.getParameter("phone");
		String m = req.getParameter("message");
		String doc = req.getParameter("doc");
		// String time= req.getParameter("time");
		
		SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
        Date date= new Date();
        String appointmentdate=simpleDateFormat.format(date);
        appointmentdate=req.getParameter("date");

		try {
			String id = httpSession.getAttribute("LoginId").toString();

			Connection con = ParentInterface.con;
			Statement smt = con.createStatement();

			// ResultSet rs = smt.executeQuery("select * from patientsignup where status=1
			// and id="+id);

			smt.execute("insert into newappointments(name,email,age,phone,appointmentdate,doctor,message,status) values('"+n+"','"+e+"','"+a+"','"+ph+"','"+appointmentdate+"','"+doc+"','"+m+"',1)");
			RequestDispatcher rd = req.getRequestDispatcher("patbookapp.jsp");
			out.println("<h1>Record Submitted</h1>");
			rd.include(req, resp);

			smt.close();
			con.close();

		} catch (Exception ex) {
			
			RequestDispatcher rd = req.getRequestDispatcher("patbookapp.html");
			out.println("<h1>Record Submitted</h1>");
			rd.include(req, resp);
			out.println("<h1>" + ex + "</h1>");
		}
	}

}