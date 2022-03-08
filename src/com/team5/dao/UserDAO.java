package com.team5.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBManager;
import com.team5.vo.UserVO;

/**
 * @author jihye
 *
 */
public class UserDAO {
	private UserDAO() {
	}

	private static UserDAO instance = new UserDAO();

	public static UserDAO getInstance() {
		return instance;
	}

	public ArrayList<UserVO> selectUser() throws SQLException {
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		String runSP = "{ call user_pack.user_select_all() }";
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		

		try {
			conn = DBManager.getConnection();
			cstmt = conn.prepareCall(runSP);

			try {
				cstmt.execute();
				rs = (ResultSet) cstmt.getObject(2);

				while (rs.next()) {
					UserVO userVO = new UserVO();
					userVO.setUsername(rs.getString("username"));
					userVO.setPassword(rs.getString("password"));
					list.add(userVO);
				}

				System.out.println("성공");

			} catch (SQLException e) {
				System.out.println("프로시저에서 에러 발생!");
				System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
			}
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		System.out.print(list);
		return list;
	}
}
