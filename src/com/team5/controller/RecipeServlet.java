package com.team5.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.controller.action.Action;

/**
 * @author jihye
 *
 */
<<<<<<< HEAD
@WebServlet("/RecipeServlet")
=======
@WebServlet("/app")
>>>>>>> 413d42b148d7f6cbef5ccfd91b5b77727e12a730
public class RecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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

	}
}
