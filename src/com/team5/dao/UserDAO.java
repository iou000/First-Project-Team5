package com.team5.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBManager;
import com.team5.vo.UserVO;

import oracle.jdbc.OracleTypes;

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
	public ArrayList<UserVO> listMember() {
		  
		ArrayList<UserVO> memberList = new ArrayList<UserVO>();
		String sql = "select * from user01.t_user";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
            	System.out.println(rs.getString("id"));
            	System.out.println(rs.getString("username"));
            	System.out.println(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return memberList;
	}

	public ArrayList<UserVO> selectUser() throws SQLException {
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		

		try {
            conn = DBManager.getConnection();
            cstmt = conn
                    .prepareCall("{call SP_MEMBER_LIST(:rtn)}");
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);  //커서를 리턴받기위해 아웃파라미터지정
            cstmt.executeUpdate();  //프로시저 실행. -> 조회
            rs = (ResultSet) cstmt.getObject(1);  //반환된 커서 ResultSet 으로 받기
            while (rs.next()) {
            	System.out.println(rs.getString("id"));
            	System.out.println(rs.getString("username"));
            	System.out.println(rs.getString("password"));
            }
            rs.close();
            cstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        } finally {
            try {
            	DBManager.close(conn, cstmt);
            } catch (Exception e) { }
        }
		return list;
	}
}