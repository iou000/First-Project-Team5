package com.team5.controller.action;

import com.google.gson.Gson;
import com.team5.dao.CommentDAO;
import com.team5.vo.CommentVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
*
*클래스 : CommentListAction
*작성자 : 김지혜
*작성일 : 3/15/22
*
**/
public class CommentListAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommentDAO commentDAO = new CommentDAO();

        // 마이페이지 댓글 불러오기
        if (request.getParameter("recipeId") == null) {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            
            // 페이징처리된 댓글 리스트 불러오기 (유저별)
            List<CommentVO> commentsByUserId = commentDAO.getPagingCommentsByUserId(userId, pageNumber, 5);

            // 댓글 리스트 json 변환
            String gson = new Gson().toJson(commentsByUserId);
            System.out.println(gson);

            // json 댓글 리스트 response
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(gson);
        }
        // 레시피 상세 페이지 댓글 불러오기
        else {
            int recipeId = Integer.parseInt(request.getParameter("recipeId"));
            int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
            
            // 페이징처리된 댓글 리스트 불러오기 (레시피별)
            List<CommentVO> commentsByRecipeId = commentDAO.getPagingCommentsByRecipeId(recipeId, pageNumber, 5);

            // 댓글 리스트 json 변환
            String gson = new Gson().toJson(commentsByRecipeId);
            System.out.println(gson);

            // json 댓글 리스트 response
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(gson);
        }
    }
}
