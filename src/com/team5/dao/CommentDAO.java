package com.team5.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.team5.vo.CommentVO;

import util.DBManager;

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
	

	// 특정 레시피ID에 해당하는 평가 목록을 불러오는 메소드
	public ArrayList<CommentVO> getComments(int recipe_id) {
		ArrayList<CommentVO> list = new ArrayList<>();
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			// 연결 설정
			conn = DBManager.getConnection();
			// CallableStatement를 통해서 저장프로시저 호출
			cstmt = conn.prepareCall("{call comment_select(?)}");
			// 저장프로시저에 포함된 매개변수 설정
			cstmt.setInt(1, recipe_id);
			
			// 저장프로시저  실행 결과를 ResultSet에 저장
			rs = cstmt.executeQuery();
			// ResultSet에 저장된 각각의 결과에 대해서
			while (rs.next()) {
				// CommentVO 객체를 생성해서 author, grade, contents, updatedat을 설정
				CommentVO vo = new CommentVO();
				vo.setAuthor(rs.getString("us"));
				vo.setGrade(rs.getInt("gr"));
				vo.setContents(rs.getString("co"));
				vo.setUpdatedat(rs.getDate("up"));
				// 생성한 각각의 CommentVO 객체를 리스트에 추가
				list.add(vo);
			}
			
			// 사용한 conn, cstmt, rs 종료
			DBManager.close(conn, cstmt, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 최종적으로 리스트를 반환
		return list;
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
