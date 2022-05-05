package administrateurpkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBInteraction {

	private static Statement stm;
	private static Connection conn;

	public static Statement connect() throws ClassNotFoundException, SQLException {
		 String  url="jdbc:mysql://localhost/ma_base";
		 String login="root";
		 String pw="";
		Class.forName("com.mysql.jdbc.Driver")		;
		
		 conn=DriverManager.getConnection(url,login,pw);
		 if(!conn.isClosed()) {
			 System.out.println("conn reussite");}
		 else {
			 System.out.println("conn non reussi");}
		 stm=conn.createStatement();
		return stm;
		
	}
	
	
	public static void disconnect() throws SQLException {
		conn.close();
	}
	
	
	public static int mAJ(String sql) throws SQLException {
		int nb=0;
		 nb=stm.executeUpdate(sql);
		return nb;
		
	}
	
	
	public static ResultSet select(String sql) throws SQLException {
		
		ResultSet rs=null;
		rs=stm.executeQuery(sql);
		return rs;
		
	}
}
