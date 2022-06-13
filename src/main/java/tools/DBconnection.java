package tools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBconnection {

	public DBconnection() {
		// TODO Auto-generated constructor stub
		}
	
	
		private static Connection con;
		private static String driver	= "com.mysql.cj.jdbc.Driver";
		private	static String url 		= "jdbc:mysql://localhost:3306/binome";
		private	static String username = "root";
		private	static String pass 	= "mysql_root";	
			
		
		
		public static  Connection connect()  {
		
		try {
				Class.forName(driver);


				try {	
						con = DriverManager.getConnection(url,username,pass);
					
						
					
				}catch(SQLException e) {
					
						System.out.println("connection Failed");
					
				}
		} catch (ClassNotFoundException e) {
			
				// TODO Auto-generated catch block
				e.printStackTrace();		
			
				System.out.println("Driver Not Found");
		}
	
		return con;
			
		}
		

		
		public static void disconnect() {
			
			try {
				con.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Disconnection Failed");
			}
		
	}
		
	

}
