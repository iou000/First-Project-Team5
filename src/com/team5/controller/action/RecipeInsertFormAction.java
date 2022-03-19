package com.team5.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.vo.UserVO;

/**
 * @author 송진호
 *
 */
public class RecipeInsertFormAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "recipe/recipeInsertForm.jsp";
		HttpSession session = request.getSession(); // 세션 생성
		UserVO loginUser = (UserVO) session.getAttribute("loginUser"); // 세션으로부터 loginUser 객체를 받아옴 
		
		// 로그인 여부에 따라서 수행되는 기능
		if(loginUser == null) {
			url = "app?command=login_form"; // 로그인을 하지 않으면 로그인 페이지로 이동
		} else {
			request.setAttribute("loginUser", loginUser); // 로그인을 했으면 loginUser의 값으로 loginUser 정보를 넘겨줌
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}
