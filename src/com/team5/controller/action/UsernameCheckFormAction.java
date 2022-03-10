package com.team5.controller.action;

import com.team5.dao.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author jihye
 *
 */
public class UsernameCheckFormAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/user/username_check.jsp";

        String username = request.getParameter("username");
        UserDAO userDAO=UserDAO.getInstance();
        boolean isExistByUsername = userDAO.IsExistByUsername(username);

        request.setAttribute("isExistByUsername", isExistByUsername);
        request.setAttribute("username", username);
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
}//end class
