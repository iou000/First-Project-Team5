package util;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

/**
*
*클래스 : DBManager
*작성자 : 김지혜
*작성일 : 3/7/22
*
**/
public class DBManager {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection() {

		Connection conn = null;
		try {
//			Context initContext = new InitialContext();
//			Context envContext = (Context) initContext.lookup("java:/comp/env");
//			DataSource ds = (DataSource) envContext.lookup("jdbc/oracle");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@edudb_high?TNS_ADMIN=/Users/mac/Wallet_edudb", "user01", "xxxxxxAt21cc");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection conn, Statement stmt) {
		try {
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
