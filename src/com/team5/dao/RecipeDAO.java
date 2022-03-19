package com.team5.dao;

import com.team5.vo.CategoryVO;
import com.team5.vo.RecipeDesVO;
import com.team5.vo.RecipeVO;
import util.DBManager;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 * @author : 김경섭
 * @Date : 2022. 3. 9.
 * @ClassName : RecipeDAO
 * @Comment : 레시피 DAO
 */
public class RecipeDAO {
    private static RecipeDAO instance = new RecipeDAO();
    Connection conn = null;
    CallableStatement cstmt = null;
    ResultSet rs = null;

    private RecipeDAO() {
    } //싱글턴 처리

    public static RecipeDAO getInstance() {
        return instance;
    }

    /**
     * @return : void
     * @Author : 김경섭
     * @Date : 2022. 3. 9.
     * @Method : insertRecipe
     * @Comment : 레시피 생성
     */
    public int insertRecipe(RecipeVO recipeVO) {
        // 호출할 SQL 문장
        String runSP = "{ ? = call recipe_pack.recipe_insert(?, ?, ?, ?, ?, ?, ?) }";
        int recipe_id = 1;
        try {
            // DB연결
            conn = DBManager.getConnection();
            // CallableStatement로 저장 프로시저 호출
            cstmt = conn.prepareCall(runSP);

            // 저장프로시저 파라미터 입력
            cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMBER);
            cstmt.setString(2, recipeVO.getTitle());
            cstmt.setString(3, recipeVO.getIntro());
            cstmt.setString(4, recipeVO.getCategory());
            cstmt.setString(5, recipeVO.getIngredients());
            cstmt.setString(6, recipeVO.getDetails());
            cstmt.setString(7, recipeVO.getImage());
            cstmt.setInt(8, recipeVO.getUser_id());
            System.out.println(runSP);

            //실행
            cstmt.executeUpdate();
            recipe_id = cstmt.getInt(1);

            System.out.println(recipe_id);
            System.out.println("레시피 생성 완료. 레시피 ID : " + recipe_id);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt);
        }

        return recipe_id;
    }//end insertRecipe

    /**
     * @return : void
     * @Author : 김경섭
     * @Date : 2022. 3. 9.
     * @Method : updateRecipe
     * @Comment : 레시피 수정
     */
    public void updateRecipe(int id, RecipeVO recipeVO) {
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_update(?, ?, ?, ?, ?, ?, ?)}";
        try {
            // DB연결
            conn = DBManager.getConnection();
            // CallableStatement로 저장 프로시저 호출
            cstmt = conn.prepareCall(runSP);

            // 저장프로시저 파라미터 입력
            cstmt.setInt(1, id);
            cstmt.setString(2, recipeVO.getTitle());
            cstmt.setString(3, recipeVO.getIntro());
            cstmt.setString(4, recipeVO.getCategory());
            cstmt.setString(5, recipeVO.getIngredients());
            cstmt.setString(6, recipeVO.getDetails());
            cstmt.setString(7, recipeVO.getImage());

            System.out.println(runSP);

            //실행
            cstmt.executeUpdate();
            System.out.println(recipeVO.getId() + "번  " + "레시피 수정 완료");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt);
        }
    }//end updateRecipe

    /**
     * @return : void
     * @Author : 김경섭
     * @Date : 2022. 3. 9.
     * @Method : deleteRecipe
     * @Comment : 레시피 삭제
     */
    public void deleteRecipe(int id) {
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_delete(?)}";
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
            System.out.println(id + "번 " + "레시피 삭제 완료");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt);
        }
    }// end deleteRecipe

    /**
     * @return : RecipeVO
     * @Author : 김경섭
     * @Date : 2022. 3. 9.
     * @Method : selectRecipeById
     * @Comment : 레시피 상세 조회
     */
    public RecipeVO selectRecipeById(int id) {
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_select_by_id(?, ?)}";
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
            rs = (ResultSet) cstmt.getObject(2);
            while (rs.next()) {
                recipeVO.setId(rs.getInt("id"));
                recipeVO.setTitle(rs.getString("title"));
                recipeVO.setIntro(rs.getString("intro"));
                recipeVO.setGrade(rs.getDouble("grade"));
                recipeVO.setCategory(rs.getString("category"));
                recipeVO.setIngredients(rs.getString("ingredients"));
                recipeVO.setDetails(rs.getString("details"));
                recipeVO.setImage(rs.getString("image"));
                recipeVO.setCreatedAt(rs.getDate("createdAt"));
                recipeVO.setUpdatedAt(rs.getDate("updatedAt"));
                recipeVO.setViewcount(rs.getInt("viewCount"));
                recipeVO.setUser_id(rs.getInt("user_id"));
                recipeVO.setUsername(rs.getString("username"));
            }
            System.out.println(runSP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt, rs);
        }
        return recipeVO;
    }//end selectRecipeById

    /**
     * @return : List<RecipeVO>
     * @Author : 김경섭
     * @Date : 2022. 3. 9.
     * @Method : selectRecipeList
     * @Comment : 레시피 리스트 조회(카테고리,검색어, 평점순)
     */
    public List<RecipeVO> selectRecipeList(String category, String search_text, String sortType, int pageNo, int pageSize) {
        // 레시피 리스트 생성
        List<RecipeVO> recipeList = new ArrayList<>();
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_select_list(?, ?, ?, ?, ?, ?)}";
        try {
            // DB연결
            conn = DBManager.getConnection();
            // CallableStatement로 저장 프로시저 호출
            cstmt = conn.prepareCall(runSP);
            // 입력 파라미터
            cstmt.setString(1, category);
            cstmt.setString(2, search_text);
            cstmt.setString(3, sortType);
            cstmt.setInt(4, pageNo);
            cstmt.setInt(5, pageSize);
            // 출력 파라미터
            cstmt.registerOutParameter(6, oracle.jdbc.OracleTypes.CURSOR);
            //실행 (리턴값: ResultSet)
            cstmt.execute();
            //레시피 상세 조회 결과 받아오기
            rs = (ResultSet) cstmt.getObject(6);
            while (rs.next()) {
                RecipeVO recipeVO = new RecipeVO();
                recipeVO.setId(rs.getInt("id"));
                recipeVO.setTitle(rs.getString("title"));
                recipeVO.setGrade(rs.getDouble("grade"));
                recipeVO.setImage(rs.getString("image"));
                recipeVO.setViewcount(rs.getInt("viewcount"));
                recipeVO.setUsername(rs.getString("username"));
                recipeList.add(recipeVO);
            }
            System.out.println(runSP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt, rs);
        }
        return recipeList;
    }//end selectRecipeList

    /**
     * @return : RecipeVO
     * @Author : 김경섭
     * @Date : 2022. 3. 9.
     * @Method : selectRecipeListById
     * @Comment : 각 유저별 레시피 리스트 조회
     */
    public List<RecipeVO> selectRecipeListByUserId(int user_id) {
        // 레시피 리스트 생성
        List<RecipeVO> recipeList = new ArrayList<>();
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_select_list_by_user_id(?, ?)}";
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
            rs = (ResultSet) cstmt.getObject(2);
            while (rs.next()) {
                RecipeVO recipeVO = new RecipeVO();
                recipeVO.setId(rs.getInt("id"));
                recipeVO.setTitle(rs.getString("title"));
                recipeVO.setGrade(rs.getDouble("grade"));
                recipeVO.setImage(rs.getString("image"));
                recipeVO.setViewcount(rs.getInt("viewcount"));
                recipeVO.setUsername(rs.getString("username"));
                recipeList.add(recipeVO);
            }
            System.out.println(runSP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt, rs);
        }
        return recipeList;
    }//end selectRecipeListByUserId


    /**
     * @return : void
     * @Author : 김경섭
     * @Date : 2022. 3. 14.
     * @Method : updateViewCount
     * @Comment : 조회수 +1 증가
     */
    public void updateViewCount(int id) {
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_update_viewcount(?)}";
        try {
            // DB연결
            conn = DBManager.getConnection();
            // CallableStatement로 저장 프로시저 호출
            cstmt = conn.prepareCall(runSP);
            // 저장프로시저 파라미터 입력
            cstmt.setInt(1, id);
            //실행
            cstmt.executeUpdate();
            System.out.println(runSP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt);
        }
    }//end updateRecipe
    
    
    
    /**
     * @Author  : 김경섭
     * @Date    : 2022. 3. 16.
     * @Method  : selectRecipeListTot
     * @return  : int
     * @Comment : 카테고리, 검색어별 레시피 총 개수 조회
     */
    public int selectRecipeListTot(String category, String search_text) {
        
    	int totcnt = 0;
    	
        // 호출할 저장 프로시저
        String runSP = "{ ? = call recipe_pack.recipe_select_list_tot(?, ?)}";
        try {
            // DB연결
            conn = DBManager.getConnection();
            // CallableStatement로 저장 프로시저 호출
            cstmt = conn.prepareCall(runSP);
            // 입력 파라미터
            cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.NUMBER);
            cstmt.setString(2, category);
            cstmt.setString(3, search_text);
            
            
            //실행
            cstmt.executeUpdate();
            totcnt = cstmt.getInt(1);
            
            System.out.println(runSP +"검색된 레시피: "+ totcnt + "개");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt, rs);
        }
        return totcnt;
    }//end selectRecipeListTot
    
    /**
     * 메서드 : selectRecipeViewGradeByCategory
     * 작성자 : 김지혜
     * 작성일 : 3/14/22
     **/
    public List<CategoryVO> selectRecipeViewGradeByCategory() {
        // 레시피 리스트 생성
        List<CategoryVO> categoryVOList = new ArrayList<>();
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_avg_view_grade_select_by_category(?)}";
        try {
            // DB연결
            conn = DBManager.getConnection();
            // CallableStatement로 저장 프로시저 호출
            cstmt = conn.prepareCall(runSP);
            // 출력 파라미터
            cstmt.registerOutParameter(1, oracle.jdbc.OracleTypes.CURSOR);
            //실행 (리턴값: ResultSet)
            cstmt.execute();
            //레시피 상세 조회 결과 받아오기
            rs = (ResultSet) cstmt.getObject(1);
            while (rs.next()) {
                CategoryVO categoryVO = new CategoryVO();
                categoryVO.setCategory(rs.getString("category"));
                categoryVO.setView_average(rs.getDouble("view_average"));
                categoryVO.setGrade_average(rs.getDouble("grade_average"));
                categoryVOList.add(categoryVO);
            }
            System.out.println(runSP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt, rs);
        }
        return categoryVOList;
    }//end selectRecipeViewGradeByCategory

    /**
     * 메서드 : selectRecipeByComment
     * 작성자 : 김지혜
     * 작성일 : 3/14/22
     **/
    public List<RecipeVO> selectRecipeByComment(int user_id) {
        // 레시피 리스트 생성
        List<RecipeVO> recipeVOList = new ArrayList<>();
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_select_by_comment_user_id(?, ?)}";
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
            rs = (ResultSet) cstmt.getObject(2);
            while (rs.next()) {
                RecipeVO recipeVO = new RecipeVO();
                recipeVO.setTitle(rs.getString("title"));
                recipeVO.setImage(rs.getString("image"));
                recipeVO.setUpdatedAt(rs.getDate("updatedat"));
                recipeVO.setId(rs.getInt("id"));
                recipeVOList.add(recipeVO);
            }
            System.out.println(runSP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt, rs);
        }
        return recipeVOList;
    }//end selectRecipeViewGradeByCategory

    /**
     * 메서드 : selectRecipeDescriptionByUserId
     * 작성자 : 김지혜
     * 작성일 : 3/15/22
     **/
    public List<RecipeDesVO> selectRecipeDescriptionByUserId(int user_id) {
        // 레시피 리스트 생성
        List<RecipeDesVO> recipeVOList = new ArrayList<>();
        // 호출할 저장 프로시저
        String runSP = "{ CALL recipe_pack.recipe_view_grade_count_select_by_userId(?, ?)}";
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
            rs = (ResultSet) cstmt.getObject(2);
            while (rs.next()) {
                RecipeDesVO recipeDesVO = new RecipeDesVO();
                recipeDesVO.setRecipe_count(rs.getInt("recipe_count"));
                recipeDesVO.setRecipe_view_count(rs.getInt("recipe_view_count"));
                recipeDesVO.setRecipe_grade_average(rs.getInt("recipe_grade_average"));
                recipeVOList.add(recipeDesVO);
            }
            System.out.println(runSP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(conn, cstmt, rs);
        }
        return recipeVOList;
    }//end selectRecipeDescriptionByUserId
    
}
