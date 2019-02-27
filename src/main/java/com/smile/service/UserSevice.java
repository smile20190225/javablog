package com.smile.service;

import com.smile.bean.Comment;
import com.smile.bean.User;
import com.smile.dao.UserDao;
import com.smile.utils.EncryptionTool;

import java.util.List;

public class UserSevice {
    private  UserDao userDao = new UserDao();
    public int register(User user){
        if(hasUser(user.getUsername()))return 0;
        EncryptionTool.encryptPasswd(user);
        return userDao.register(user);
    }

    public boolean hasUser(String username){
        return userDao.hasUser(username);
    }

    public int login(String username, String password){
        if(!hasUser(username))return 0;//用户不存在
        User user = userDao.findUserByName(username);
        if(EncryptionTool.checkPassword(user,password))return 1;
        else return -1;
    }


    public User findUserById(int userid){
        return userDao.findUserById(userid);
    }

    public List getUserArticleList(int userid){
        return userDao.getgetUserArticleList(userid);
    }

    public User findUserByName(String username) {
        return userDao.findUserByName(username);
    }
}
