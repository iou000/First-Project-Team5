package com.team5.controller.action;

import com.team5.dao.CommentDAO;
import com.team5.dao.RecipeDAO;
import com.team5.vo.CommentVO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author : 송진호
 * @Date : 2022. 3. 14.
 * @ClassName : RecipeViewAction
 * @Comment : 레시피 상세보기 액션
 * 
 * @author : 김경섭
 * @Date : 2022. 3. 16.
 * @ClassName : RecipeViewAction
 * @Comment : 조회수 증가 기능 (쿠키 사용)
 * 
 *  @author : 김지혜
 * @Date : 2022. 3. 16.
 * @ClassName : RecipeViewAction
 * @Comment : 댓글
 */

public class RecipeViewAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "recipe/recipeView.jsp";
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));

        /* 레시피 상세보기 기능 @송진호 */
        // 세션 생성
        HttpSession session = request.getSession();
        // 세션으로부터 loginUser 값을 받아와서 loginUser 변수 생성
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        // RecipeDAO로부터 인스턴스 정보를 가져옴
        RecipeDAO recipeDAO = RecipeDAO.getInstance();
        // recipeId로 레시피 상세정보를 불러와서 대입
        RecipeVO recipeVO = recipeDAO.selectRecipeById(recipeId);
        /* 레시피 상세보기 기능 @송진호 */

        CommentDAO commentDAO = CommentDAO.getInstance();
        List<CommentVO> commentList = commentDAO.getCommentsByRecipeId(recipeId);
        List<CommentVO> pagingCommentsByRecipeId = commentDAO.getPagingCommentsByRecipeId(recipeId, 1, 5);
        List<CommentVO> commentsByRecipeId = commentDAO.getCommentsByRecipeId(recipeId);

        /* 조회수 증가 로직(쿠키 사용) @김경섭 */
        Cookie[] cookies = request.getCookies(); //브라우저에 저장되어있는 쿠키들을 받아옴.
        boolean isVisitRecipe = false; // visitRecipe 존재 여부 (처음엔 없으니까 false).


        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("visitRecipe")) { //이름이 visitRecipe인 쿠키라면
                isVisitRecipe = true; // visitRecipe 쿠키가 존재한다고 설정.

                if (!cookie.getValue().equals(request.getParameter("recipeId"))) { // visitRecipe 쿠키의 값이 recipeId가 아니라면
                    recipeDAO.updateViewCount(Integer.parseInt(request.getParameter("recipeId"))); // 조회수 +1 증가.
                    cookie.setValue(request.getParameter("recipeId")); // visitRecipe 쿠키의 값을 recipeId로 설정해줌.
                    response.addCookie(cookie); // visitRecipe 쿠키 추가.
                } //end if
            } // end if
        } // end for

        if (isVisitRecipe == false) { // visitRecipe 쿠키가 존재하지 않으면
            recipeDAO.updateViewCount(Integer.parseInt(request.getParameter("recipeId"))); // 조회수 +1 증가.
            Cookie newCookie = new Cookie("visitRecipe", request.getParameter("recipeId")); // visitRecipe 쿠키를 만들고
            response.addCookie(newCookie); // visitRecipe 쿠키 추가
        }
        /* 조회수 증가 로직(쿠키 사용) 끝*/


        request.setAttribute("loginUser", loginUser);
        request.setAttribute("recipeVO", recipeVO);
        request.setAttribute("pagingCommentsByRecipeId", pagingCommentsByRecipeId);
        request.setAttribute("commentsByRecipeId", commentsByRecipeId);

        request.getRequestDispatcher(url).forward(request, response);
    }
}
