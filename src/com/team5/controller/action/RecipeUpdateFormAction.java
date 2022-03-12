package com.team5.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

/**
 * @author    : seop
 * @Date      : 2022. 3. 12.
 * @ClassName : RecipeUpdateFormAction
 * @Comment   : 레시피 수정 폼 Action
 */
public class RecipeUpdateFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "recipe/recipeUpdateForm.jsp";
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		int recipeId = Integer.parseInt(request.getParameter("recipeId"));
		
		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		RecipeVO recipeVO = recipeDAO.selectRecipeById(recipeId);
		
		
		if(loginUser == null) {
			url = "app?command=login_form";
		} else {
			request.setAttribute("recipeVO", recipeVO);
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
