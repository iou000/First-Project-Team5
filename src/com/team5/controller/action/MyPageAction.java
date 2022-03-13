package com.team5.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.RecipeDAO;
import com.team5.dao.UserDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

/**
*
*클래스 : MyPageAction
*작성자 : 김지혜
*작성일 : 3/8/22
*
**/
public class MyPageAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/mypage/mypage.jsp";
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			url = "app?command=login_form";
		}
		else {
			UserDAO userDAO = UserDAO.getInstance();
			RecipeDAO recipeDAO = RecipeDAO.getInstance();
			List<RecipeVO> recipeVOS = recipeDAO.selectRecipeListByUserId(loginUser.getId());

			System.out.println("MyPageAction");
			request.setAttribute("loginUser", loginUser);
			request.setAttribute("recipeVOS", recipeVOS);
		}

	
		request.getRequestDispatcher(url).forward(request, response);
	}
}
