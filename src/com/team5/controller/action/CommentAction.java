package com.team5.controller.action;

import com.team5.dao.CommentDAO;
import com.team5.dao.UserDAO;
import com.team5.vo.CommentVO;
import com.team5.vo.UserVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

/**
*
*클래스 : CommentAction
*작성자 : 김지혜
*작성일 : 3/11/22
*
**/
public class CommentAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "app?command=recipeView";

        // comment 생성
        String contents = request.getParameter("contents");
        int grade = Integer.parseInt(request.getParameter("grade"));
        int userId = Integer.parseInt(request.getParameter("user_id"));
        int recipeId = Integer.parseInt(request.getParameter("recipe_id"));

        // commentDAO insertComments
        CommentDAO commentDAO = CommentDAO.getInstance();
        commentDAO.insertComments(grade, contents, userId, recipeId);

        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
