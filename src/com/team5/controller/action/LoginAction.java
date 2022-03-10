package com.team5.controller.action;

import com.team5.dao.UserDAO;
import com.team5.vo.UserVO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
*
*클래스 : LoginAction
*작성자 : 김지혜
*작성일 : 3/10/22
*
**/
public class LoginAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "/auth/login_fail.jsp";
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO userDAO = UserDAO.getInstance();
        UserVO userVO = userDAO.selectUserByUsername(username);

        if (userVO != null) {
            if (userVO.getPassword().equals(password)) { // 유저가 존재하고 비밀번호가 일치할 경우
                session.setAttribute("loginUser", userVO); // session update
                url = "/main.jsp";  // 홈 화면으로
            }
        }
        request.getRequestDispatcher(url).forward(request, response);
    }
}//end class
