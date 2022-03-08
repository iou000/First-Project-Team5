package com.team5.vo;

import java.sql.Date;

public class CommentVO {
	private int id;
	private int grade;
	private String contents;
	private Date createdat;
	private Date updatedat;
	private int user_id;
	private int recipe_id;
	private String author;

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getGrade() {
		return grade;
	}
	
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	public String getContents() {
		return contents;
	}
	
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	public Date getCreatedat() {
		return createdat;
	}
	
	public void setCreatedat(Date createdat) {
		this.createdat = createdat;
	}
	public Date getUpdatedat() {
		return updatedat;
	}
	
	public void setUpdatedat(Date updatedat) {
		this.updatedat = updatedat;
	}
	
	public int getUser_id() {
		return user_id;
	}
	
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public int getRecipe_id() {
		return recipe_id;
	}
	
	public void setRecipe_id(int recipe_id) {
		this.recipe_id = recipe_id;
	}
	
	public String getAuthor() {
		return author;
	}
	
	public void setAuthor(String author) {
		this.author = author;
	}
}
