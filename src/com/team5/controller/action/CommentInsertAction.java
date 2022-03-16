package com.team5.controller.action;

import com.team5.dao.CommentDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 클래스 : CommentAction
 * 작성자 : 김지혜
 * 작성일 : 3/11/22
 **/
public class CommentInsertAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "app?command=recipe_view";

        System.out.println(request.getParameter("contents"));
        System.out.println(request.getParameter("grade"));
        System.out.println(request.getParameter("user_id"));
        System.out.println(request.getParameter("recipe_id"));

        // comment 생성
        String contents = request.getParameter("contents");
        int grade = Integer.parseInt(request.getParameter("grade"));
        int userId = Integer.parseInt(request.getParameter("user_id"));
        int recipeId = Integer.parseInt(request.getParameter("recipe_id"));

        // commentDAO insertComments
        CommentDAO commentDAO = CommentDAO.getInstance();
        commentDAO.insertComment(grade, contents, userId, recipeId);

        url = url + "&recipeId=" + recipeId;

        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}
