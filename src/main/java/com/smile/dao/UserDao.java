package com.smile.dao;

import com.smile.bean.Article;
import com.smile.bean.User;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private QueryRunner runner = null;//查询构造器

    public UserDao(){
        runner = new QueryRunner(DBUtils.getDataSource());
    }

    public int register(User user){
        String sql = "insert into user(username,password,email,registertime)values(?,?,?,?)";
        try {
            int insert = runner.update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getRegistertime());
            return insert;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    public int login(String username, String password){
        String hasSql = "select * from user where username = ?";
        try {
            List<User> userList = runner.query(hasSql,new BeanListHandler<User>(User.class),username);
            if(userList.isEmpty()){
                return -1;
            }
            if(findUser(username,password)==null){
                return 0;
            }else{
                return 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -2;
        }
    }

    public User findUser(String username, String password){
        String sql = "select * from user where username = ? and password = ?";
        User user = null;
        try {
            List<User> userList = runner.query(sql,new BeanListHandler<User>(User.class),username,password);
            if(!userList.isEmpty())user = userList.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public List getgetUserArticleList(int userid){
        String sql = "select * from article where userid = ?";
        List<Article> userArticleList = new ArrayList<Article>();
        try {
            userArticleList = runner.query(sql,new BeanListHandler<Article>(Article.class),userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userArticleList;
    }

    public User findUserById(int userid) {
        String sql = "select * from user where userid = ?";
        User user = null;
        try {
            user = new User();
            user = runner.query(sql,new BeanHandler<User>(User.class),userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
