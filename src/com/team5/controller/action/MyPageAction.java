package com.team5.controller.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.UserDAO;
import com.team5.vo.UserVO;

/**
 * @author jihye
 *
 */
public class MyPageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "mypage/mypage.jsp";
		
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			System.out.print("check");
			url = "a";
		}
		else {
			UserDAO userDAO = UserDAO.getInstance();
			ArrayList<UserVO> userList = null;
			try {
				userList = userDAO.selectUser();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.print(userList);
			request.setAttribute("title", "≈∏¿Ã∆≤");
			request.setAttribute("userList", userList);
		}
		
		
		
		
	}

}
