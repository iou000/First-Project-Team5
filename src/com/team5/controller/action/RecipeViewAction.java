package com.team5.controller.action;

import com.team5.dao.CommentDAO;
import com.team5.dao.RecipeDAO;
import com.team5.vo.CommentVO;
import com.team5.vo.RecipeVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @author SJH
 *
 */
public class RecipeViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String url = "recipe/recipeView.jsp";
		// 원래 클릭하면 recipeId 넘어가는거 일단 고정해둠 _ 지혜
	    //int recipeId = Integer.parseInt(request.getParameter("recipeId"));
		int recipeId = 18;

	    RecipeDAO recipeDAO = RecipeDAO.getInstance();
	    RecipeVO recipeVO = recipeDAO.selectRecipeById(recipeId);

	    CommentDAO commentDAO = CommentDAO.getInstance();
	    ArrayList<CommentVO> commentList = commentDAO.getCommentsById(recipeId);

	    request.setAttribute("recipeVO", recipeVO);
	    request.setAttribute("commentList", commentList);

	    request.getRequestDispatcher(url).forward(request, response);
	}
}
