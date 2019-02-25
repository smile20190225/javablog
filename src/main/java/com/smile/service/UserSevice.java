package com.smile.service;

import com.smile.bean.Comment;
import com.smile.bean.User;
import com.smile.dao.UserDao;

import java.util.List;

public class UserSevice {
    private  UserDao userDao = new UserDao();
    public int register(User user){
        return userDao.register(user);
    }

    public int login(String username, String password){
        return userDao.login(username,password);
    }

    public User findUser(String username, String password){
        return userDao.findUser(username,password);
    }

    public User findUserById(int userid){
        return userDao.findUserById(userid);
    }

    public List getUserArticleList(int userid){
        return userDao.getgetUserArticleList(userid);
    }

}
