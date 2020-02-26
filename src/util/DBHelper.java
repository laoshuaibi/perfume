package util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBHelper {
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String url="jdbc:mysql://47.114.87.54/perfume";
	private static final String username="perfume_reader";
	private static final String password="perfume@123";
	
	private static Connection con = null;
	static {
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception {
		if(con==null) {
			con = DriverManager.getConnection(url, username, password);
		}
		return con;
	}
	public static void main(String[] args) {
		try {
			Connection conn = DBHelper.getConnection();
			if(conn != null) {
				System.out.println("数据库连接正常！");
			}
			else {
				System.out.println("数据库连接异常！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
