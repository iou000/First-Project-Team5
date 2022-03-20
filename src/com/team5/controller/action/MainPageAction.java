package com.team5.controller.action;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author 송진호
 */
/**
*
*클래스 : MainPageAction
*작성자 : 김지혜
*작성일 : 3/15/22
*
**/
public class MainPageAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "main.jsp";

        /* 키워드 or 검색어 받아오기 */
        String keyword = request.getParameter("keyword");
        String category = request.getParameter("category");

        RecipeDAO recipeDAO = RecipeDAO.getInstance();
        /* 카테고리 또는 검색어를 통해서 레시피 조회 @김경섭 */
        List<RecipeVO> view_high_recipeList = recipeDAO.selectRecipeList(null, null, "viewcount", 1, 4); // 처음엔 1페이지를 기본으로 가져옴
        List<RecipeVO> grade_high_recipeList = recipeDAO.selectRecipeList(null, null, "grade", 1, 4); // 처음엔 1페이지를 기본으로 가져옴

        request.setAttribute("keywordAjax", keyword);
        request.setAttribute("categoryAjax", category);
        request.setAttribute("view_high_recipeList", view_high_recipeList);
        request.setAttribute("grade_high_recipeList", grade_high_recipeList);

        request.getRequestDispatcher(url).forward(request, response);
    }
}
