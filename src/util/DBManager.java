package util;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

/**
 * @author jihye
 *
 */
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
			conn = DriverManager.getConnection("jdbc:oracle:thin:@edudb_high?TNS_ADMIN=/Users/mac/Documents/wallet/Wallet_edudb", "user01", "xxxxxxAt21cc");
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
