package com.team5.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.team5.util.DBManager;
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

	Connection conn = null;
	CallableStatement cstmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// 유저 생성
	public void insertUser(UserVO userVO) {
		// 호출할 SQL 문장
		String runSP = "{ CALL user_pack.user_insert(?, ?)}";

		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 저장프로시저 파라미터 입력
			cstmt.setString(1, userVO.getUsername());
			cstmt.setString(2, userVO.getPassword());

			System.out.println(runSP);
			//실행
			cstmt.executeUpdate();
			System.out.println("유저 생성 완료");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
	}//end insertUser

	// 유저s select
	public ArrayList<UserVO> selectUsers() throws SQLException {
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

	// 유저 select by id
	public UserVO selectUserById(int id) {
		// 호출할 저장 프로시저
		String runSP = "{ CALL user_pack.user_select_by_id(?, ?)}";
		UserVO userVO = new UserVO();

		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 입력 파라미터
			cstmt.setInt(1, id);
			// 출력 파라미터
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			//실행 (리턴값: ResultSet)
			cstmt.execute();
			//레시피 상세 조회 결과 받아오기
			rs = (ResultSet)cstmt.getObject(2);
			while(rs.next()) {
				userVO.setId(rs.getInt("id"));
				userVO.setUsername(rs.getString("username"));
				userVO.setPassword(rs.getString("password"));
			}

		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return userVO;
	}//end selectUserById

	// 유저 select by username
	public UserVO selectUserByUsername(String username) {
		// 호출할 저장 프로시저
		String runSP = "{ CALL user_pack.user_select_by_username(?, ?)}";
		UserVO userVO = new UserVO();

		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 입력 파라미터
			cstmt.setString(1, username);
			// 출력 파라미터
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			//실행 (리턴값: ResultSet)
			cstmt.execute();
			//레시피 상세 조회 결과 받아오기
			rs = (ResultSet)cstmt.getObject(2);
			while(rs.next()) {
				userVO.setId(rs.getInt("id"));
				userVO.setUsername(rs.getString("username"));
				userVO.setPassword(rs.getString("password"));
			}

		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return userVO;
	}//end selectUserByUsername

	public boolean IsExistByUsername(String username) {
		String sql = "SELECT user_pack.is_user_exists(?) from dual;";

		try {
			// DB연결
			conn = DBManager.getConnection();
			// prepareStatement 저장 프로시저 호출
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();

//			if (rs.next()) {
//				result = 1;
//			} else {
//				result = -1;
//			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return true;
	}
}
