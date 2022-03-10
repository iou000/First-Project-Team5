package com.team5.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;

/**
 * @author SJH
 *
 */
public class MainPageAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";
		String search = request.getParameter("search").trim();
		String category = request.getParameter("category").trim();
		
		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		// 카테고리 또는 검색어를 통해서 레시피 조회
		ArrayList<RecipeVO> recipeList = recipeDAO.selectRecipeList(category, search);

		request.setAttribute("recipeList", recipeList);
		request.getRequestDispatcher(url).forward(request, response);
	}
}
