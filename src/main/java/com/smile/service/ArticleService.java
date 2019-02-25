package com.smile.service;

import com.smile.bean.Article;
import com.smile.bean.User;
import com.smile.dao.ArticleDao;

import java.util.List;

public class ArticleService {
    private  ArticleDao articleDao = new ArticleDao();
    public List<Article> showAllArticle(){
        return articleDao.showAllArticle();
    }

    public List getUCSet(int articleid){
        return articleDao.getUCSet(articleid);
    }

    public Article findArticleById(int articleid) {
       return articleDao.findArticleById(articleid);

    }

    public User findUserById(int userid) {
        return articleDao.findUserById(userid);
    }

    public int publicArticle(Article article) {
        return articleDao.publicArticle(article);
    }
}
