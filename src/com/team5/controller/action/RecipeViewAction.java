package com.team5.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.CommentDAO;
import com.team5.dao.RecipeDAO;
import com.team5.vo.CommentVO;
import com.team5.vo.RecipeVO;

/**
 * @author SJH
 *
 */
public class RecipeViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String url = "recipe/recipeView.jsp";
	    String recipeSeq = request.getParameter("recipeSeq").trim();
	    
	    RecipeDAO recipeDAO = RecipeDAO.getInstance();
	    RecipeVO recipeVO = recipeDAO.selectContents(recipeDAO.getRecipes());
	    
	    CommentDAO commentDAO = CommentDAO.getInstance();
	    ArrayList<CommentVO> commentList = commentDAO.getComments(recipeVO.getId());
	    
	    request.setAttribute("recipeVO", recipeVO);
	    request.setAttribute("commentList", commentList);
	    request.getRequestDispatcher(url).forward(request, response);
	}
}
