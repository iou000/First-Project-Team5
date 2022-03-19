package com.team5.controller.action;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.team5.dao.RecipeDAO;
import com.team5.vo.CategoryVO;
import com.team5.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
*
*클래스 : ChartPageAction
*작성자 : 김지혜
*작성일 : 3/11/22
*
**/
public class ChartPageAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/chart/chart.jsp";

        //get login user
        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        //get recipe view_average & grade_average
        RecipeDAO recipeDAO = RecipeDAO.getInstance();
        List<CategoryVO> categoryVOS = recipeDAO.selectRecipeViewGradeByCategory();

        // object to json string
        ObjectMapper mapper = new ObjectMapper();
        String categoryStr = mapper.writeValueAsString(categoryVOS);
        System.out.println(categoryStr);

        request.setAttribute("loginUser", loginUser);
        request.setAttribute("categoryStr", categoryStr);

        request.getRequestDispatcher(url).forward(request, response);
    }
}
