package com.team5.controller.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.team5.dao.RecipeDAO;
import com.team5.dao.UserDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;



/**
 * @author    : seop
 * @Date      : 2022. 3. 11.
 * @ClassName : RecipeDeleteAction
 * @Comment   : 레시피 삭제 Action
 */
public class RecipeDeleteAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "main.jsp";
		
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		int recipe_id = Integer.parseInt(request.getParameter("recipe_id"));
        
        if (loginUser == null) {
			url = "app?command=login_form";
		}
		else {
			
			RecipeDAO recipeDAO = RecipeDAO.getInstance();
			recipeDAO.deleteRecipe(recipe_id);

			System.out.println("RecipeDeleteAction");
		}
		
        request.getRequestDispatcher(url).forward(request, response);
	}
}

