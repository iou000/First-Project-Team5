package com.team5.dao;


/**
 * @author seop
 *
 */
public class RecipeDAO {
	private RecipeDAO() { } //싱글턴
	private static RecipeDAO instance = new RecipeDAO();
	public static RecipeDAO getInstance() {
		return instance;
	}
	
	
}
