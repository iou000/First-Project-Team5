package com.team5.controller;

import com.team5.controller.action.Action;
import com.team5.controller.action.MainPageAction;
import com.team5.controller.action.MyPageAction;
import com.team5.controller.action.RecipeViewAction;

/**
 * @author jihye
 *
 */
public class ActionFactory {
    private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;
		
		System.out.println("ActionFactory  : " + command);

		if(command.equals("search") || command.equals("category")) {
			action = new MainPageAction();
		} else if(command.equals("mypage")) {
			action = new MyPageAction();
		} else if(command.equals("recipe_viiew")) {
			action = new RecipeViewAction();
		}
		return action;
	}
}