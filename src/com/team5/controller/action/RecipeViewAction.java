package com.team5.controller.action;

import com.team5.dao.CommentDAO;
import com.team5.dao.RecipeDAO;
import com.team5.vo.CommentVO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * @author SJH
 */
public class RecipeViewAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "recipe/recipeView.jsp";
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));

        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        RecipeDAO recipeDAO = RecipeDAO.getInstance();
        RecipeVO recipeVO = recipeDAO.selectRecipeById(recipeId);

        CommentDAO commentDAO = CommentDAO.getInstance();
        ArrayList<CommentVO> commentList = commentDAO.getCommentsById(recipeId);

        request.setAttribute("loginUser", loginUser);
        request.setAttribute("recipeVO", recipeVO);
        request.setAttribute("commentList", commentList);

        request.getRequestDispatcher(url).forward(request, response);
    }
}
