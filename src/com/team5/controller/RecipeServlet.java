package com.team5.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.controller.action.Action;

/**
*
*클래스 : RecipeServlet
*작성자 : 김지혜
*작성일 : 3/7/22
*
**/
@WebServlet("/app")
public class RecipeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		System.out.println("RecipeServlet : " + command);

		ActionFactory af = ActionFactory.getInstance();
		Action action = af.getAction(command);

		if (action != null) {
			action.execute(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}
