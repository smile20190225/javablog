package com.smile.dao;

import com.smile.bean.Article;
import com.smile.bean.User;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UserDao {
    private QueryRunner runner = null;//查询构造器

    public UserDao(){
        runner = new QueryRunner(DBUtils.getDataSource());
    }

    public int register(User user){
        String sql = "insert into user(username,password,email,registertime,salt)values(?,?,?,?,?)";
        try {
            int insert = runner.update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getRegistertime(),user.getSalt());
            return insert;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }
    }

    public List getAllUser(){
        String sql = "select * from user";
        List<Object[]> userList = null;
        try {
            userList = runner.query(sql,new ArrayListHandler());
            /*for(Map<String,Object> map:userList){
                for(String key:map.keySet()){
                    System.out.println(key+":"+map.get(key));
                }
            }*/
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public User findUserByName(String username){
        String sql = "select * from user where username = ?";
        User user = null;
        try {
            List<User> userList = runner.query(sql,new BeanListHandler<User>(User.class),username);
            if(!userList.isEmpty())user = userList.get(0);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public List getUserArticleList(int userid){
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

    public boolean hasUserOnName(String username) {
        String sql = "select * from user where username = ?";
        List userList = new ArrayList();
        try {
            userList = runner.query(sql,new MapListHandler(),username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(!userList.isEmpty())return true;
        else return false;
    }

    public boolean checkEmail(String email) {
        String sql = "select * from user where email = ?";
        User user = null;
        try {
            user = runner.query(sql,new BeanHandler<User>(User.class),email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(user != null)return true;
        else return false;
    }

    public boolean hasUserOnEmail(String email) {
        String sql = "select * from user where email = ?";
        List userList = new ArrayList();
        try {
            userList = runner.query(sql,new MapListHandler(),email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(!userList.isEmpty())return true;
        else return false;
    }

    public User findUserByEmail(String email) {
        String sql = "select * from user where email = ?";
        User user = null;
        try {
            user = new User();
            user = runner.query(sql,new BeanHandler<User>(User.class),email);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public int changePassword(User user) {
        String sql = "update User set password = ? , salt = ? where userid = ?";
        int isChange = 0;
        try {
            isChange = runner.update(sql,user.getPassword(),user.getSalt(),user.getUserid());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isChange;
    }
}
