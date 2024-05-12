package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	
	private static Connection con;
	public static Connection getConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","root","@Lakshya82#");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
