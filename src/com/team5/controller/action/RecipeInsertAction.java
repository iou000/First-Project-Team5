package com.team5.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;


/**
 * @author    : seop
 * @Date      : 2022. 3. 10.
 * @ClassName : RecipeCreateAction
 * @Comment   : 레시피 생성 Action
 */
public class RecipeInsertAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "app?command=mainpage";
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		if (loginUser == null) {
			url = "app?command=login_form";
		}
		else {
			RecipeVO recipeVO = new RecipeVO();
			recipeVO.setTitle(request.getParameter("title"));
			recipeVO.setIntro(request.getParameter("intro").replace("\r\n","<br>")); //개행문자를 <br>로 바꿔서 DB에 저장
			recipeVO.setCategory(request.getParameter("category"));
			recipeVO.setIngredients(request.getParameter("ingredients"));
			recipeVO.setDetails(request.getParameter("details").replace("\r\n","<br>")); //개행문자를 <br>로 바꿔서 DB에 저장
			recipeVO.setImage("recipe.jpg");
			recipeVO.setUser_id(loginUser.getId()); //레시피 생성시 현재 세션에 있는 사용자의 ID를 등록함.
			
			RecipeDAO recipeDAO = RecipeDAO.getInstance();
			recipeDAO.insertRecipe(recipeVO); //레시피 생성
		}
		
	    response.sendRedirect(url);
	}
}
