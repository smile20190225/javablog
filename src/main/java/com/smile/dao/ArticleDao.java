package com.smile.dao;

import com.smile.bean.Article;
import com.smile.bean.User;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.*;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ArticleDao {

    private QueryRunner runner = null;

    public ArticleDao() {
        runner = new QueryRunner(DBUtils.getDataSource());
    }

    public List<Article> showAllArticle(){
        String sql = "select * from Article";
        List<Article> articleList = new ArrayList<Article>();
        try {
            articleList = runner.query(sql,new BeanListHandler<Article>(Article.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return articleList;
    }

   public List getUCSet(int articleid){
        String sql = "SELECT * \n" +
                "FROM COMMENT c\n" +
                "INNER JOIN USER u\n" +
                "ON c.userid = u.userid\n" +
                "LEFT JOIN reply r\n" +
                "ON c.commentid = r.commentidd\n" +
                "WHERE c.articleid = ?";
        List ucSet = new ArrayList();
       try {
           ucSet = runner.query(sql,new MapListHandler(),articleid);
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return ucSet;
   }

   public Article findArticleById(int articleid){
        String sql = "select * from article where articleid = ?";
       Article article = null;
       try {
           article = runner.query(sql,new BeanHandler<Article>(Article.class),articleid);
       } catch (SQLException e) {
           e.printStackTrace();
       }
        return article;
   }

   public User findUserById(int userid){
       String sql = "select * from user where userid = ?";
       User user = null;
       try {
           user = runner.query(sql,new BeanHandler<User>(User.class),userid);
       } catch (SQLException e) {
           e.printStackTrace();
       }
       return user;
   }

    public int publicArticle(Article article) {
        String sql = "insert into article(userid,title,type,content,contentimage,publictime) values(?,?,?,?,?,?)";
        int isPublic = -1;
        try {
            isPublic = runner.execute(sql,article.getUserid(),article.getTitle(),article.getType(),article.getContent(),article.getContentimage(),article.getPublictime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isPublic;

    }

    public void saveStaticUrl(int articleid, String url) {
        String sql = "update article set url = ? where articleid = ?";
        try {
            runner.update(sql,url,articleid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
