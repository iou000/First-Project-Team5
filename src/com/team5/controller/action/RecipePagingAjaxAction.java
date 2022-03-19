package com.team5.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.google.gson.Gson;
import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;


/**
 * @author    : 김경섭
 * @Date      : 2022. 3. 13.
 * @ClassName : RecipePagingAction
 * @Comment   : 레시피 페이징 AJAX
 */
public class RecipePagingAjaxAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 키워드, 검색어, 정렬조건(조회수 or 평점) 받아오기 */
		String categoryAjax = request.getParameter("categoryAjax");
		String keywordAjax = request.getParameter("keywordAjax");
		String sortTypeAjax = request.getParameter("sortTypeAjax");
		/* 페이징 정보 받아오기  */
		int pageNO = Integer.parseInt(request.getParameter("pageNO"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		

		/* 키워드, 카테고리, 정렬조건(조회수 or 평점) 페이지번호, 페이지 크기로 recipe정보 조회 */
		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		List<RecipeVO> recipeList = recipeDAO.selectRecipeList(categoryAjax, keywordAjax, sortTypeAjax, pageNO, pageSize);
		
		
		/* json 형식으로 데이터를 보냄 */
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
		
        // recipeList를 json객체로 바꿔줌.
        String gson = new Gson().toJson(recipeList);
        
        response.getWriter().write(gson);
		
	}
}