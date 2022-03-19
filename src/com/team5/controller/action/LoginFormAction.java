package com.team5.controller.action;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
*
*클래스 : LoginFormAction
*작성자 : 김지혜
*작성일 : 3/10/22
*
**/
public class LoginFormAction implements Action {

  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {    
    String url = "auth/login.jsp";
     
    RequestDispatcher dispatcher=request.getRequestDispatcher(url);
    dispatcher.forward(request, response);    
  }
}//end class