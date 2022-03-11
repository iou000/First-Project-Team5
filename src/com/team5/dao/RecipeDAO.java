package com.team5.dao;

import com.team5.vo.RecipeVO;
import util.DBManager;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 * @author    : seop
 * @Date      : 2022. 3. 9.
 * @ClassName : RecipeDAO
 * @Comment   : 레시피 DAO
 */
public class RecipeDAO {
	private RecipeDAO() { } //싱글턴 처리
	private static RecipeDAO instance = new RecipeDAO();
	public static RecipeDAO getInstance() {
		return instance;
	}
	
	Connection conn = null;
    CallableStatement cstmt = null;
	ResultSet rs = null;

	/**
	 * @Author  : seop
	 * @Date    : 2022. 3. 9.
	 * @Method  : insertRecipe
	 * @return  : void
	 * @Comment : 레시피 생성
	 */
	public void insertRecipe(RecipeVO recipeVO) {
		// 호출할 SQL 문장
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
			cstmt.setString(4, recipeVO.getIngredients());
			cstmt.setString(5, recipeVO.getDetails());
			cstmt.setString(6, recipeVO.getImage());
			cstmt.setInt(7, recipeVO.getUser_id());
			System.out.println(runSP);
			//실행
			cstmt.executeUpdate();
			System.out.println("레시피 생성 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
	}//end insertRecipe
	/**
	 * @Author  : seop
	 * @Date    : 2022. 3. 9.
	 * @Method  : updateRecipe
	 * @return  : void
	 * @Comment : 레시피 수정
	 */
	public void updateRecipe(RecipeVO recipeVO) {
		// 호출할 저장 프로시저
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
			cstmt.setString(5, recipeVO.getIngredients());
			cstmt.setString(6, recipeVO.getDetails());
			cstmt.setString(7, recipeVO.getImage());
			System.out.println(runSP);
			//실행
			cstmt.executeUpdate();
			System.out.println(recipeVO.getId()+"번  "+"레시피 수정 완료");
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
	}//end updateRecipe
	/**
	 * @Author  : seop
	 * @Date    : 2022. 3. 9.
	 * @Method  : deleteRecipe
	 * @return  : void
	 * @Comment : 레시피 삭제
	 */
	public void deleteRecipe(int id) {
		// 호출할 저장 프로시저
		String runSP = "{ CALL recipes_pack.recipes_delete(?)}";
		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 저장프로시저 파라미터 입력
			cstmt.setInt(1, id);
			System.out.println(runSP);
			//실행
			cstmt.executeUpdate();
			System.out.println(id+"번 "+"레시피 삭제 완료");
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt);
		}
	}// end deleteRecipe
	/**
	 * @Author  : seop
	 * @Date    : 2022. 3. 9.
	 * @Method  : selectRecipeById
	 * @return  : RecipeVO
	 * @Comment : 레시피 상세 조회
	 */
	public RecipeVO selectRecipeById(int id) {
		// 호출할 저장 프로시저
		String runSP = "{ CALL recipes_pack.recipes_select_by_id(?, ?)}";
		RecipeVO recipeVO = new RecipeVO();
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
				recipeVO.setId(rs.getInt("id"));
				recipeVO.setImage(rs.getString("image"));
				recipeVO.setTitle(rs.getString("title"));
				recipeVO.setIntro(rs.getString("intro"));
				recipeVO.setCategory(rs.getString("category"));
				recipeVO.setIngredients(rs.getString("ingredients"));
				recipeVO.setDetails(rs.getString("details"));
				recipeVO.setCreatedAt(rs.getDate("createdAt"));
				recipeVO.setUpdatedAt(rs.getDate("updatedAt"));
				recipeVO.setViewcount(rs.getInt("viewCount"));
				recipeVO.setUser_id(rs.getInt("user_id"));
				recipeVO.setGrade(rs.getInt("grade"));
				recipeVO.setUsername(rs.getString("username"));
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return recipeVO;
	}//end selectRecipeById
	/**
	 * @Author  : seop
	 * @Date    : 2022. 3. 9.
	 * @Method  : selectRecipeList
	 * @return  : List<RecipeVO>
	 * @Comment : 레시피 리스트 조회(카테고리,검색어, 평점순)
	 */
	public List<RecipeVO> selectRecipeList(String category, String search_text) {
		// 레시피 리스트 생성
		List<RecipeVO> recipeList= new ArrayList<>();
		// 호출할 저장 프로시저
		String runSP = "{ CALL recipes_pack.recipes_select_list(?, ?, ?)}";
		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 입력 파라미터
			cstmt.setString(1, "");
			cstmt.setString(2, "");
			// 출력 파라미터
			cstmt.registerOutParameter(3, oracle.jdbc.OracleTypes.CURSOR);
			//실행 (리턴값: ResultSet)
			cstmt.execute();
			//레시피 상세 조회 결과 받아오기
			rs = (ResultSet)cstmt.getObject(3);
			while(rs.next()) {
				RecipeVO recipeVO = new RecipeVO();
				recipeVO.setId(rs.getInt("id"));
				recipeVO.setTitle(rs.getString("title"));
				recipeVO.setImage(rs.getString("image"));
				recipeVO.setViewcount(rs.getInt("viewcount"));
				recipeVO.setUsername(rs.getString("username"));
				recipeVO.setGrade(rs.getInt("grade"));
				
				recipeList.add(recipeVO);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		
		return recipeList;
	}//end selectRecipeList
	/**
	 * @Author  : seop
	 * @Date    : 2022. 3. 9.
	 * @Method  : selectRecipeListById
	 * @return  : RecipeVO
	 * @Comment : 각 유저별 레시피 리스트 조회
	 */
	public List<RecipeVO> selectRecipeListByUserId(int user_id) {
		// 레시피 리스트 생성
		List<RecipeVO> recipeList= new ArrayList<>();
		// 호출할 저장 프로시저
		String runSP = "{ CALL recipes_pack.recipes_select_list_by_user_id(?, ?)}";
		try {
			// DB연결
			conn = DBManager.getConnection();
			// CallableStatement로 저장 프로시저 호출
			cstmt = conn.prepareCall(runSP);
			// 입력 파라미터
			cstmt.setInt(1, user_id);
			// 출력 파라미터
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			//실행 (리턴값: ResultSet)
			cstmt.execute();
			//레시피 상세 조회 결과 받아오기
			rs = (ResultSet)cstmt.getObject(2);
			while(rs.next()) {
				RecipeVO recipeVO = new RecipeVO();
				recipeVO.setId(rs.getInt("id"));
				recipeVO.setTitle(rs.getString("title"));
				recipeVO.setImage(rs.getString("image"));
				recipeVO.setViewcount(rs.getInt("viewcount"));
				recipeVO.setUsername(rs.getString("username"));
				recipeVO.setGrade(rs.getInt("grade"));
				
				recipeList.add(recipeVO);
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			DBManager.close(conn, cstmt, rs);
		}
		return recipeList;
	}//end selectRecipeListByUserId
}
