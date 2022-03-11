package com.team5.controller;

import com.team5.controller.action.Action;
import com.team5.controller.action.JoinAction;
import com.team5.controller.action.JoinFormAction;
import com.team5.controller.action.LoginAction;
import com.team5.controller.action.LoginFormAction;
import com.team5.controller.action.LogoutAction;
import com.team5.controller.action.MainPageAction;
import com.team5.controller.action.MyPageAction;
import com.team5.controller.action.RecipeInsertAction;
import com.team5.controller.action.RecipeViewAction;

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
        if (command.equals("main")) {
            action = new MainPageAction();
        } else if (command.equals("mypage")) {
            action = new MyPageAction();
        } else if (command.equals("join_form")) {
            action = new JoinFormAction();
        } else if (command.equals("join")) {
            action = new JoinAction();
        } else if (command.equals("login_form")) {
            action = new LoginFormAction();
        } else if (command.equals("login")) {
            action = new LoginAction();
        } else if (command.equals("logout")) {
            action = new LogoutAction();
        } else if (command.equals("mainpage")) {
          action = new MainPageAction();
        } else if(command.equals("mypage")) {
          action = new MyPageAction();
        } else if(command.equals("recipe_view")) {
          action = new RecipeViewAction();
        } else if(command.equals("recipe_insert")) {
          action = new RecipeInsertAction();
		}
        return action;
    }
}