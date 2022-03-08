package com.team5.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.team5.vo.RecipeVO;

import util.DBManager;

/**
 * @author seop
 *
 */
public class RecipeDAO {
	private RecipeDAO() { } //싱글턴
	private static RecipeDAO instance = new RecipeDAO();
	public static RecipeDAO getInstance() {
		return instance;
	}
	
	Connection conn = null;
    CallableStatement cstmt = null;
	ResultSet rs = null;
    
	// 레시피 생성
	public void insertRecipe(RecipeVO recipeVO) {
		//호출할 SQL 문장
		String runSP = "{ CALL recipes_pack.recipes_insert(?, ?, ?, ?, ?, ?, ?)}";
	    
		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 저장프로시저 파라미터 입력
			cstmt.setString(1, recipeVO.getTitle());
			cstmt.setString(2, recipeVO.getIntro());
			cstmt.setString(3, recipeVO.getCategory());
			cstmt.setString(4, recipeVO.getIngrediens());
			cstmt.setString(5, recipeVO.getDetails());
			cstmt.setString(6, recipeVO.getImage());
			cstmt.setInt(7, recipeVO.getUser_id());
			
			System.out.println(runSP);
			cstmt.executeUpdate();
			System.out.println("레시피 생성 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
	}//end insertRecipe
	
	// 레시피 수정
	public void updateRecipe(RecipeVO recipeVO) {
		//호출할 저장 프로시저
		String runSP = "{ CALL recipes_pack.recipes_update(?, ?, ?, ?, ?, ?, ?)}";
		
		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 저장프로시저 파라미터 입력
			cstmt.setInt(1, recipeVO.getId());
			cstmt.setString(2, recipeVO.getTitle());
			cstmt.setString(3, recipeVO.getIntro());
			cstmt.setString(4, recipeVO.getCategory());
			cstmt.setString(5, recipeVO.getIngrediens());
			cstmt.setString(6, recipeVO.getDetails());
			cstmt.setString(7, recipeVO.getImage());
			
			System.out.println(runSP);
			cstmt.executeUpdate();
			System.out.println(recipeVO.getId()+"번  "+"레시피 수정 완료");
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
	}//end updateRecipe
	
	//레시피 삭제
	public void deleteRecipe(int recipe_id) {
		//호출할 저장 프로시저
		String runSP = "{ CALL recipes_pack.recipes_delete(?)}";
		
		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 저장프로시저 파라미터 입력
			cstmt.setInt(1, recipe_id);
			
			System.out.println(runSP);
			cstmt.executeUpdate();
			System.out.println(recipe_id+"번 "+"레시피 삭제 완료");
			
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
	}// end deleteRecipe
	
}
