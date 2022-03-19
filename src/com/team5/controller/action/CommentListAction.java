package com.team5.controller.action;

import com.google.gson.Gson;
import com.team5.dao.CommentDAO;
import com.team5.vo.CommentVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CommentListAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getParameter("recipeId"));
        System.out.println(request.getParameter("userId"));
        System.out.println(request.getParameter("pageNumber"));

        CommentDAO commentDAO = new CommentDAO();

        // 마이페이지 댓글 불러오기
        if (request.getParameter("recipeId") == null) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            List<CommentVO> commentsByUserId = commentDAO.getPagingCommentsByUserId(userId, pageNumber, 5);

            String gson = new Gson().toJson(commentsByUserId);
            System.out.println(gson);

            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(gson);
        }
        // 레시피 상세 페이지 댓글 불러오기
        else {
            int recipeId = Integer.parseInt(request.getParameter("recipeId"));
            int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            List<CommentVO> commentsByRecipeId = commentDAO.getPagingCommentsByRecipeId(recipeId, pageNumber, 5);

            String gson = new Gson().toJson(commentsByRecipeId);
            System.out.println(gson);

            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(gson);
        }
    }
}
