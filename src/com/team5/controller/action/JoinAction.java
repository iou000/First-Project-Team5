package com.team5.controller.action;

import com.team5.dao.UserDAO;
import com.team5.vo.UserVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author jihye
 */
public class JoinAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "user/login.jsp";
        HttpSession session = request.getSession();
        UserVO userVO = new UserVO();
        userVO.setUsername(request.getParameter("username"));
        userVO.setPassword(request.getParameter("password"));

        UserDAO userDAO = UserDAO.getInstance();
        userDAO.insertUser(userVO);

        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}//end class
