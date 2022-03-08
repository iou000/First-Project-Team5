package com.team5.controller.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.UserDAO;

public class MyPageAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "mypage/mypage.jsp";
		UserDAO userDAO = UserDAO.getInstance();

		System.out.println("MyPageAction");
		request.setAttribute("title", "title");
		request.setAttribute("userList", userDAO.listMember());
	
		request.getRequestDispatcher(url).forward(request, response);
	}
}
