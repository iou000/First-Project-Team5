package com.team5.controller.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
*
*클래스 : LogoutAction
*작성자 : 김지혜
*작성일 : 3/10/22
*
**/
public class LogoutAction implements Action {
    @Override
    public void execute(HttpServletRequest request,
                        HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/app?command=index";
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        request.getRequestDispatcher(url).forward(request, response);
    }
}//end class