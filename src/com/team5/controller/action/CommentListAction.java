package com.team5.controller.action;

import com.fasterxml.jackson.databind.ObjectMapper;
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

        int userId = Integer.parseInt(request.getParameter("userId"));
        int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));

        CommentDAO commentDAO = new CommentDAO();
        List<CommentVO> commentsByUserId = commentDAO.getCommentByUserId(userId, pageNumber, 5);

        ObjectMapper mapper = new ObjectMapper();
        String commentsByUserIdStr = mapper.writeValueAsString(commentsByUserId);
        System.out.println(commentsByUserIdStr);

        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(commentsByUserIdStr);
    }
}
