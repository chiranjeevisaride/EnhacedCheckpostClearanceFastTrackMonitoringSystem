package com.checkpost;
import java.sql.*;
public class OracleDriver {
	private static final String driverClass = "oracle.jdbc.driver.OracleDriver";
	private static final String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String userName = "checkpost";
	private static final String password = "checkpost";
	static {
		try {
			Class.forName(driverClass);
		} catch(Exception e) { 
			System.out.println("Driver Class Not Found:"+e);
		}
	}
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, userName, password);
		} catch(Exception e) {
			System.out.println("Getting connection problem:"+e);
		}
		return conn;
	}
	public static void closeConnection(Connection conn) {
		try {
			if(conn!=null) {
				conn.close();
			}
		} catch(Exception e) {
			
		}
	}
}
