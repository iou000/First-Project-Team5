package com.team5.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.CommentDAO;
import com.team5.vo.CommentVO;

/**
 * @author SJH
 *
 */
public class RecipeViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String url = "recipe/recipeView.jsp";

	    RecipeDAO recipeDAO = RecipeDAO.getInstance();
	    RecipeVO recipeVO = recipeDAO.selectContents(recipeDAO.getId());
	    
	    CommentDAO commentDAO = CommentDAO.getInstance();
	    ArrayList<CommentVO> commentList = commentDAO.selectComments(recipeDAO.getId());
	    
	    request.setAttribute("recipeVO", recipeVO);
	    request.setAttribute("commentList", commentList);
	    request.getRequestDispatcher(url).forward(request, response);
	}
}
