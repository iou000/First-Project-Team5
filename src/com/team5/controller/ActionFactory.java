package com.team5.controller;

import com.team5.controller.action.*;

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

        System.out.println("ActionFactory : " + command);
        if (command.equals("mainpage")) {
            action = new MainPageAction();
        } else if (command.equals("mypage")) {
            action = new MyPageAction();
        } else if (command.equals("chartpage")) {
            action = new ChartPageAction();
        } else if (command.equals("join_form")) {
            action = new JoinFormAction();
        } else if (command.equals("join")) {
            action = new JoinAction();
        } else if (command.equals("join_check")) {
            action = new JoinCheckAction();
        } else if (command.equals("login_form")) {
            action = new LoginFormAction();
        } else if (command.equals("login")) {
            action = new LoginAction();
        } else if (command.equals("logout")) {
            action = new LogoutAction();
        } else if (command.equals("recipe_view")) {
            action = new RecipeViewAction();
        } else if (command.equals("recipe_insert")) {
            action = new RecipeInsertAction();
        } else if (command.equals("recipe_insert_form")) {
            action = new RecipeInsertFormAction();
        } else if (command.equals("recipe_delete")) {
            action = new RecipeDeleteAction();
        } else if (command.equals("recipe_update")) {
            action = new RecipeUpdateAction();
        } else if (command.equals("recipe_update_form")) {
            action = new RecipeUpdateFormAction();
        } else if (command.equals("insert_comment")) {
            action = new CommentInsertAction();
        } else if (command.equals("recipe_paging_ajax")) {
            action = new RecipePagingAjaxAction();
        } else if (command.equals("recipe_list")) {
            action = new RecipeListAction();
        }
        return action;
    }
}