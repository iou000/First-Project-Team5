package com.team5.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

/**
 * @author    : seop
 * @Date      : 2022. 3. 10.
 * @ClassName : RecipeCreateAction
 * @Comment   : 레시피 생성 Action
 */
public class RecipeInsertAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";
		//HttpSession session = request.getSession();
		//UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		RecipeVO recipeVO = new RecipeVO();
		recipeVO.setTitle(request.getParameter("title"));
		recipeVO.setIntro(request.getParameter("intro").replace("\r\n","<br>"));
		recipeVO.setCategory(request.getParameter("category"));
		recipeVO.setIngredients(request.getParameter("ingredients"));
		recipeVO.setDetails(request.getParameter("details").replace("\r\n","<br>"));
		recipeVO.setImage("recipe.jpg");
		recipeVO.setUser_id(1);
		
		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		recipeDAO.insertRecipe(recipeVO);
		System.out.println(recipeVO.getTitle());
		
	    response.sendRedirect(url);
	}
}
