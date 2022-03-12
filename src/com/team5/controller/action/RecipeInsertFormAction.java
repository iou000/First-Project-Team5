package com.team5.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.vo.UserVO;

/**
 * @author SJH
 *
 */
public class RecipeInsertFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "recipe/recipeInsertForm.jsp";
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			url = "app?command=login_form";
		} else {
			request.setAttribute("loginUser", loginUser);
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
