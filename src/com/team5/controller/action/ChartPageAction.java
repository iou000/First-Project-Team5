package com.team5.controller.action;

import com.team5.dao.RecipeDAO;
import com.team5.dao.UserDAO;
import com.team5.vo.RecipeVO;
import com.team5.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ChartPageAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "/chart/chart.jsp";
        HttpSession session = request.getSession();
        UserVO loginUser = (UserVO) session.getAttribute("loginUser");

        ArrayList<Category> categories = new ArrayList<>();
        for (int i = 0; i < 6; i++) {
            Category category = new Category();
            category.setCategory("카테고리");
            category.setView(i);
            category.setGrade(i + (int)(Math.random()+100));
            categories.add(category);
        }
        request.setAttribute("categoryList", categories);
        request.getRequestDispatcher(url).forward(request, response);
    }
    public class Category {
        private String category;

        private int view;

        private int grade;

        public String getCategory() {
            return category;
        }

        public void setCategory(String category) {
            this.category = category;
        }

        public int getView() {
            return view;
        }

        public void setView(int view) {
            this.view = view;
        }

        public int getGrade() {
            return grade;
        }

        public void setGrade(int grade) {
            this.grade = grade;
        }
    }
}
