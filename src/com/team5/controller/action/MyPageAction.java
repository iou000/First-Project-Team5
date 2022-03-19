package com.team5.controller.action;

import com.team5.dao.CommentDAO;
import com.team5.dao.RecipeDAO;
import com.team5.vo.CommentVO;
import com.team5.vo.RecipeDesVO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * 클래스 : MyPageAction
 * 작성자 : 김지혜
 * 작성일 : 3/8/22
 * <p>
 * 클래스 : MyPageAction
 * 작성자 : 송진호
 * 작성일 : 3/13/22
 * 내용 : 마이페이지에서 내가 작성한 댓글 보여주는 기능
 **/
public class MyPageAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = "/mypage/mypage.jsp";
        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        if (loginUser == null) {
            url = "app?command=login_form";
        } else {
            RecipeDAO recipeDAO = RecipeDAO.getInstance();
            CommentDAO commentDAO = CommentDAO.getInstance();

            // 내가 올린 레시피
            List<RecipeVO> myRecipeList = recipeDAO.selectRecipeListByUserId(loginUser.getId());
            // 내가 댓글 작성한 레시피
            List<RecipeVO> commentRecipeList = recipeDAO.selectRecipeByComment(loginUser.getId());
            // 내가 올린 레시피들에 대한 통계
            List<RecipeDesVO> recipeDesVOS = recipeDAO.selectRecipeDescriptionByUserId(loginUser.getId());
            // 내가 올린 댓글
            List<CommentVO> commentList = commentDAO.getCommentsByUserId(loginUser.getId());
            // 내가 올린 댓글 (페이징)
            List<CommentVO> pagingCommentsByUserId = commentDAO.getPagingCommentsByUserId(loginUser.getId(), 1, 5);


            // 객체 JSP request
            request.setAttribute("loginUser", loginUser);
            request.setAttribute("myRecipeList", myRecipeList);
            request.setAttribute("commentRecipeList", commentRecipeList);
            request.setAttribute("commentList", commentList);
            request.setAttribute("recipeDesVOS", recipeDesVOS);
            request.setAttribute("pagingCommentsByUserId", pagingCommentsByUserId);
        }
        request.getRequestDispatcher(url).forward(request, response);
    }
}
