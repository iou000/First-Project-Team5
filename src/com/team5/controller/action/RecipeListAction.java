package com.team5.controller.action;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 * @author : seop
 * @Date : 2022. 3. 15.
 * @ClassName : RecipeListAction
 * @Comment : 레시피 리스트 조회
 */
public class RecipeListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String url = "recipe/recipeList.jsp";
		
		/* 키워드, 검색어, 정렬조건(조회수 or 평점) 받아오기 */
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		String sortType = request.getParameter("sortType");
		
		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		/* 카테고리, 검색어, 정렬조건(조회수 or 평점)을 통해서 레시피 조회 @seop */
		List<RecipeVO> recipeList = recipeDAO.selectRecipeList(category, keyword, sortType, 1, 8); // 처음엔 1페이지, 8개를 기본으로 가져옴
		
		int totRecipeListCnt = recipeDAO.selectRecipeListTot(category, keyword);
		System.out.println(totRecipeListCnt);
		
		request.setAttribute("keywordAjax", keyword);
		request.setAttribute("categoryAjax",category);
		request.setAttribute("sortTypeAjax",sortType);
		request.setAttribute("recipeList", recipeList);
		request.setAttribute("totRecipeListCnt", totRecipeListCnt);
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}