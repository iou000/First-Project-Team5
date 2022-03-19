package com.team5.dao;

import com.team5.vo.CommentVO;
import util.DBManager;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 송진호
 */

/**
 * 클래스 : CommentDAO
 * 작성자 : 김지혜
 * 작성일 : 3/15/22
 **/
public class CommentDAO {
    private static CommentDAO instance = new CommentDAO();
    Connection conn = null;
    CallableStatement cstmt = null;
    ResultSet rs = null;

    public CommentDAO() {
    }

    public static CommentDAO getInstance() {
        return instance;
    }

    /**
     * 메소드 : getCommentsById
     * 작성자 : 김지혜
     * 작성일 : 3/10/22
     **/
    // 특정 레시피ID에 해당하는 평가 목록을 불러오는 메소드
    public List<CommentVO> getCommentsByRecipeId(int recipe_id) {
        List<CommentVO> commentList = new ArrayList<>();
        String runSP = "{ CALL comment_pack.comment_select_by_recipe_id(?, ?)}";
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
            rs = (ResultSet) cstmt.getObject(2);
            // ResultSet에 저장된 각각의 결과에 대해서
            while (rs.next()) {
                // CommentVO 객체를 생성해서 author, grade, contents, updatedat을 설정
                CommentVO commentVO = new CommentVO();
                commentVO.setAuthor(rs.getString("username"));
                commentVO.setGrade(rs.getInt("grade"));
                commentVO.setContents(rs.getString("contents"));
                commentVO.setUpdatedAt(rs.getDate("updatedAt").toString());
                // 생성한 각각의 CommentVO 객체를 리스트에 추가
                commentList.add(commentVO);
            }
            // 사용한 conn, cstmt, rs 종료
            DBManager.close(conn, cstmt, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 최종적으로 리스트를 반환
        return commentList;
    }

    /**
     * 메소드 : getPagingCommentsByRecipeId
     * 작성자 : 김지혜
     * 작성일 : 3/17/22
     **/
    public List<CommentVO> getPagingCommentsByRecipeId(int recipe_id, int pageNumber, int pageSize) {
        List<CommentVO> commentList = new ArrayList<>();
        try {
            // DB 연결
            conn = DBManager.getConnection();
            // CallableStatement를 통해서 저장프로시저 호출
            cstmt = conn.prepareCall("{call comment_pack.comment_select_by_recipe_id_paging(?, ?, ?, ?)}");
            // 입력 파라미터
            cstmt.setInt(1, recipe_id);
            cstmt.setInt(2, pageNumber);
            cstmt.setInt(3, pageSize);
            // 출력 파라미터
            cstmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR);
            // 저장프로시저 실행
            cstmt.execute();
            //레시피 상세 조회 결과 받아오기
            rs = (ResultSet) cstmt.getObject(4);
            // ResultSet에 저장된 각각의 결과에 대해서
            while (rs.next()) {
                // CommentVO 객체를 생성해서 author, grade, contents, updatedat을 설정
                CommentVO commentVO = new CommentVO();
                commentVO.setGrade(rs.getInt("grade"));
                commentVO.setContents(rs.getString("contents"));
                commentVO.setCreatedAt(rs.getDate("createdAt").toString());
                commentVO.setAuthor(rs.getString("username"));
                commentVO.setUser_id(rs.getInt("user_id"));
                // total_comments
                // 생성한 각각의 CommentVO 객체를 리스트에 추가
                commentList.add(commentVO);
            }
            // 사용한 conn, cstmt, rs 종료
            DBManager.close(conn, cstmt, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commentList;
    }

    /**
     * 메소드 : getCommentsByUserId
     * 작성자 : 김지혜
     * 작성일 : 3/15/22
     **/
    // 특정 사용자ID에 해당하는 평가 목록을 불러오는 메소드
    public List<CommentVO> getCommentsByUserId(int user_id) {
        List<CommentVO> commentList = new ArrayList<>();
        try {
            // DB 연결
            conn = DBManager.getConnection();
            // CallableStatement를 통해서 저장프로시저 호출
            cstmt = conn.prepareCall("{call comment_pack.comment_select_by_user_id(?, ?)}");
            // 입력 파라미터
            cstmt.setInt(1, user_id);
            // 출력 파라미터
            cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
            // 저장프로시저 실행
            cstmt.execute();
            //레시피 상세 조회 결과 받아오기
            rs = (ResultSet) cstmt.getObject(2);
            // ResultSet에 저장된 각각의 결과에 대해서
            while (rs.next()) {
                // CommentVO 객체를 생성해서 author, grade, contents, updatedat을 설정
                CommentVO commentVO = new CommentVO();
                commentVO.setRecipe_id(rs.getInt("recipe_id"));
                commentVO.setGrade(rs.getInt("grade"));
                commentVO.setContents(rs.getString("contents"));
                commentVO.setUpdatedAt(rs.getDate("updatedAt").toString());
                // 생성한 각각의 CommentVO 객체를 리스트에 추가
                commentList.add(commentVO);
            }
            // 사용한 conn, cstmt, rs 종료
            DBManager.close(conn, cstmt, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commentList;
    }


    /**
     * 메소드 : getPagingCommentsByUserId
     * 작성자 : 김지혜
     * 작성일 : 3/15/22
     **/
    public List<CommentVO> getPagingCommentsByUserId(int user_id, int pageNumber, int pageSize) {
        List<CommentVO> commentList = new ArrayList<>();
        try {
            // DB 연결
            conn = DBManager.getConnection();
            // CallableStatement를 통해서 저장프로시저 호출
            cstmt = conn.prepareCall("{call comment_pack.comment_select_by_user_id_paging(?, ?, ?, ?)}");
            // 입력 파라미터
            cstmt.setInt(1, user_id);
            cstmt.setInt(2, pageNumber);
            cstmt.setInt(3, pageSize);
            // 출력 파라미터
            cstmt.registerOutParameter(4, oracle.jdbc.OracleTypes.CURSOR);
            // 저장프로시저 실행
            cstmt.execute();
            //레시피 상세 조회 결과 받아오기
            rs = (ResultSet) cstmt.getObject(4);
            // ResultSet에 저장된 각각의 결과에 대해서
            while (rs.next()) {
                // CommentVO 객체를 생성해서 author, grade, contents, updatedat을 설정
                CommentVO commentVO = new CommentVO();
                commentVO.setRecipe_id(rs.getInt("recipe_id"));
                commentVO.setGrade(rs.getInt("grade"));
                commentVO.setContents(rs.getString("contents"));
                commentVO.setUpdatedAt(rs.getDate("createdat").toString());
                // total_comments
                // 생성한 각각의 CommentVO 객체를 리스트에 추가
                commentList.add(commentVO);
            }
            // 사용한 conn, cstmt, rs 종료
            DBManager.close(conn, cstmt, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commentList;
    }

    /**
     * 메소드 : insertComments
     * 작성자 : 김지혜
     * 작성일 : 3/15/22
     **/
    public void insertComment(int grade, String contents, int user_id, int recipe_id) {
        String runSP = "{call comment_pack.comment_insert(?, ?, ?, ?)}";
        try {
            // 연결 설정
            conn = DBManager.getConnection();
            // CallableStatement를 통해서 저장프로시저 호출
            cstmt = conn.prepareCall(runSP);
            // 저장프로시저에 포함된 매개변수 설정
            cstmt.setInt(1, grade);
            cstmt.setString(2, contents);
            cstmt.setInt(3, user_id);
            cstmt.setInt(4, recipe_id);
            // 저장프로시저 실행
            cstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt);
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
            cstmt = conn.prepareCall("{call comment_pack.comment_update(?, ?, ?)}");
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
            cstmt = conn.prepareCall("{call comment_pack.comment_delete(?)}");
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
