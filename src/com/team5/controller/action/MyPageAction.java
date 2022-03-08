package com.team5.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.CommentDAO;

public class MyPageAction implements Action {
	  @Override
	  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String url = "RecipeApplication/recipe"; 
		  HttpSession session = request.getSession();
		  
	  }
}
