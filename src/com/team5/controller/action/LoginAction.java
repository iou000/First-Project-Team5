package com.team5.controller.action;

import com.team5.dao.UserDAO;
import com.team5.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 클래스 : LoginAction
 * 작성자 : 김지혜
 * 작성일 : 3/10/22
 **/
public class LoginAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "auth/login_fail.jsp";
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = UserDAO.getInstance();
        UserVO userVO = userDAO.selectUserByUsername(username);

        // 아이디가 있음
        if (userVO.getUsername() != null) {
            // 비밀 번호도 같음
            if (userVO.getPassword().equals(password)) {
                System.out.println("로그인 성공");
                // session update
                session.setAttribute("loginUser", userVO);
                // 홈 화면으로 redirect
                url = "app?command=mainpage"; 
                response.sendRedirect(url);
                return;
            }
        }
        request.getRequestDispatcher(url).forward(request, response);
    }
}//end class
