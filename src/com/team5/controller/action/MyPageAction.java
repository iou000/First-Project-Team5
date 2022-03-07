package com.team5.controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.team5.dao.CommentDAO;

public class MyPageAction implements Action {
	  @Override
	  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String url = "RecipeApplication/recipe"; 
		  HttpSession session = request.getSession();

	      CommentDAO dao = CommentDAO.getInstance();
	      ArrayList<Integer> oseqList = //���� �ֹ����ΰ� ���� ��������
	    		  orderDAO.selectSeqOrderIng(loginUser.getId());
	      ArrayList<OrderVO> orderList = new ArrayList<OrderVO>();

	      for (int oseq : oseqList) { //�ݺ��� Ƚ������    	  
	    	  ArrayList<OrderVO> orderListIng = 
	        		orderDAO.listOrderById( loginUser.getId(), "1", oseq );
	    	  OrderVO orderVO = orderListIng.get(0);
	    	  orderVO.setPname(
	    		orderVO.getPname() + " �� " + ( orderListIng.size() -1) + "��");        
	    	  int totalPrice = 0;
	    	  for (OrderVO ovo : orderListIng) {
	    		  totalPrice += ovo.getPrice2() * ovo.getQuantity();
	    	  }
	        
	    	  orderVO.setPrice2(totalPrice);
	    	  orderList.add(orderVO);
	      
	      }
	      request.setAttribute("title", "���� ���� �ֹ� ����");
	      request.setAttribute("orderList", orderList);
	    }
	    request.getRequestDispatcher(url).forward(request, response);
	  }
}
