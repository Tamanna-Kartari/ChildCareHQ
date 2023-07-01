package ConnectionFiles;

import java.sql.Connection;
import java.sql.DriverManager;

public interface ParentInterface 
{
	public Connection con = getConnection();
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/childcarehq", "root", "");
			return connection;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
