package com.team5.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBManager;
import com.team5.vo.UserVO;

public class UserDAO {
  private UserDAO() {  } //ΩÃ±€≈œ √≥∏Æ
  private static UserDAO instance = new UserDAO();
  public static UserDAO getInstance() {
    return instance;
  }

  public ArrayList<UserVO> selectUser(String user_id) {    
    ArrayList<UserVO> list = new ArrayList<UserVO>();    
    String sql = "select * from t_user where id = ?";    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
      conn = DBManager.getConnection();
      pstmt=conn.prepareStatement(sql);
      pstmt.setString(1, user_id);
      rs = pstmt.executeQuery();
      while (rs.next()) {
    	  UserVO userVO = new UserVO();
    	  userVO.setUsername(rs.getString("username"));
    	  userVO.setPassword(rs.getString("password"));
    	  list.add(userVO);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return list;
  }
}
