package com.team5.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.CommentDAO;
import com.team5.dao.RecipeDAO;
import com.team5.vo.CommentVO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

/**
*
*클래스 : MyPageAction
*작성자 : 김지혜
*작성일 : 3/8/22
*
*클래스 : MyPageAction
*작성자 : 송진호
*작성일 : 3/13/22
*내용 : 마이페이지에서 내가 작성한 댓글 보여주는 기능
**/
public class MyPageAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/mypage/mypage.jsp";
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			url = "app?command=login_form";
		} else {
			RecipeDAO recipeDAO = RecipeDAO.getInstance();
			List<RecipeVO> recipeList = recipeDAO.selectRecipeListByUserId(loginUser.getId());
			
			CommentDAO commentDAO = CommentDAO.getInstance();
			List<CommentVO> commentList = commentDAO.getCommentsByUserId(loginUser.getId());

			request.setAttribute("loginUser", loginUser);
			request.setAttribute("recipeList", recipeList);
			request.setAttribute("commentList", commentList);
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}