package com.smile.service;

import com.smile.bean.Comment;
import com.smile.bean.User;
import com.smile.dao.UserDao;
import com.smile.utils.EncryptionTool;
import com.smile.utils.POIUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.io.File;
import java.util.List;

public class UserSevice {
    private  UserDao userDao = new UserDao();
    public int register(User user){
        if(hasUserOnName(user.getUsername())||hasUserOnEmail(user.getEmail()))return 0;
        EncryptionTool.encryptPasswd(user);
        return userDao.register(user);
    }

    public boolean hasUserOnName(String username){
        return userDao.hasUserOnName(username);
    }

    public boolean hasUserOnEmail(String email){return userDao.hasUserOnEmail(email);}

    public int login(String username, String password){
        if(!hasUserOnName(username))return 0;//用户不存在
        User user = userDao.findUserByName(username);
        if(EncryptionTool.checkPassword(user,password))return 1;
        else return -1;
    }

    public User findUserById(int userid){
        return userDao.findUserById(userid);
    }

    public List getUserArticleList(int userid){
        return userDao.getUserArticleList(userid);
    }

    public User findUserByName(String username) {
        return userDao.findUserByName(username);
    }

    public boolean checkEmail(String email){
        return userDao.checkEmail(email);
    }

    public int changePassword(User user, String newPassword) {
        user.setPassword(newPassword);
        EncryptionTool.encryptPasswd(user);
        return userDao.changePassword(user);
    }

    public User findUserByEmail(String email) {
        return userDao.findUserByEmail(email);
    }

    public HSSFWorkbook createUserExcel() {
        String[] title = {"userid","username","password","address","work","sex","age","email","image","spaceimage","motto","words","interest","usertype","userstate","registertime","salt"};
        List userList = userDao.getAllUser();
        if(userList == null || userList.isEmpty())return null;
        else{
            String sheetName = "UserSheet";
            HSSFWorkbook workbook = POIUtils.getHSSFWorkbook(sheetName,title,userList);
            return workbook;
        }
    }
}
