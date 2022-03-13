package com.team5.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;


/**
 * @author    : seop
 * @Date      : 2022. 3. 13.
 * @ClassName : RecipePagingAction
 * @Comment   : 레시피 페이징 AJAX
 */
public class RecipePagingAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 키워드 or 검색어 받아오기 */
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		
		/* 페이징 정보 받아오기  */
		int pageNO = Integer.parseInt(request.getParameter("pageNO"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		

		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		// 카테고리 또는 검색어를 통해서 레시피 조회
		List<RecipeVO> recipeList = recipeDAO.selectRecipeList(keyword, category, pageNO, pageSize);
		
		response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
		
        String gson = new Gson().toJson(recipeList);
        
        response.getWriter().write(gson);
		
	}
}