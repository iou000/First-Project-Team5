package com.team5.dao;

import com.team5.vo.CommentVO;
import com.team5.vo.RecipeVO;
import util.DBManager;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * @author SJH
 *
 */
public class CommentDAO {
	public CommentDAO() {
	}
	
	private static CommentDAO instance = new CommentDAO();
	public static CommentDAO getInstance() {
		return instance;
	}

	Connection conn = null;
	CallableStatement cstmt = null;
	ResultSet rs = null;

	/**
	*
	*메소드 : getCommentsById
	*작성자 : 김지혜
	*작성일 : 3/10/22
	*
	**/
	// 특정 레시피ID에 해당하는 평가 목록을 불러오는 메소드
	public ArrayList<CommentVO> getCommentsById(int recipe_id) {
		ArrayList<CommentVO> commentVOS = new ArrayList<>();
		String runSP = "{ CALL comment_pack.comment_select_by_recipe_id(?, ?)}";
		CommentVO commentVO = new CommentVO();
		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 입력 파라미터
			cstmt.setInt(1, recipe_id);
			// 출력 파라미터
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			//실행 (리턴값: ResultSet)
			cstmt.execute();
			//레시피 상세 조회 결과 받아오기
			rs = (ResultSet)cstmt.getObject(2);
			// ResultSet에 저장된 각각의 결과에 대해서
			while (rs.next()) {
				// CommentVO 객체를 생성해서 author, grade, contents, updatedat을 설정
				CommentVO vo = commentVO;
				vo.setAuthor(rs.getString("username"));
				vo.setGrade(rs.getInt("grade"));
				vo.setContents(rs.getString("contents"));
				vo.setUpdatedAt(rs.getDate("updatedAt"));
				// 생성한 각각의 CommentVO 객체를 리스트에 추가
				commentVOS.add(vo);
			}
			
			// 사용한 conn, cstmt, rs 종료
			DBManager.close(conn, cstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 최종적으로 리스트를 반환
		return commentVOS;
	}
	
	// 새로운 평가를 추가하는 메소드
	public void insertComments(int grade, String contents, int user_id, int recipe_id) {
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			// 연결 설정
			conn = DBManager.getConnection();
			// CallableStatement를 통해서 저장프로시저 호출
			cstmt = conn.prepareCall("{call comment_insert(?, ?, ?, ?)}");
			// 저장프로시저에 포함된 매개변수 설정
			cstmt.setInt(1, grade);
			cstmt.setString(2, contents);
			cstmt.setInt(3, user_id);
			cstmt.setInt(4, recipe_id);
			
			// 저장프로시저 실행
			cstmt.execute();
			// 사용한 conn, cstmt, rs 종료
			DBManager.close(conn, cstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 평가를 수정하는 메소드
	public void updateComments(int id, int grade, String contents) {
		Connection conn = null;
		CallableStatement cstmt = null;
		try {
			// 연결 설정
			conn = DBManager.getConnection();
			// CallableStatement를 통해서 저장프로시저 호출
			cstmt = conn.prepareCall("{call comment_update(?, ?, ?)}");
			// 저장프로시저에 포함된 매개변수 설정
			cstmt.setInt(1, id);
			cstmt.setInt(2, grade);
			cstmt.setString(3, contents);
			
			// 저장프로시저 실행
			cstmt.execute();
			// 사용한 conn, cstmt, rs 종료
			DBManager.close(conn, cstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 평가를 삭제하는 메소드
	public void deleteComments(int id) {
		Connection conn = null;
		CallableStatement cstmt = null;
		try {
			// 연결 설정
			conn = DBManager.getConnection();
			// CallableStatement를 통해서 저장프로시저 호출
			cstmt = conn.prepareCall("{call comment_delete(?)}");
			// 저장프로시저에 포함된 매개변수 설정
			cstmt.setInt(1, id);
			
			// 저장프로시저 실행
			cstmt.execute();
			// 사용한 conn, cstmt, rs 종료
			DBManager.close(conn, cstmt);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
