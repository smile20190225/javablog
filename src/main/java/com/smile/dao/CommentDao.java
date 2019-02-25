package com.smile.dao;

import com.smile.bean.Comment;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {

    private QueryRunner runner = null;

    public CommentDao() {
        runner = new QueryRunner(DBUtils.getDataSource());
    }

    public int addComment(Comment comment){
        String sql = "insert into comment(userid,articleid,commentcontent,commenttime) values(?,?,?,?)";
        String addCount = "update article set commentcount = commentcount + 1 where articleid = ? ";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,comment.getUserid(),comment.getArticleid(),comment.getCommentcontent(),comment.getCommenttime());
            if(isAdd>0)runner.update(addCount,comment.getArticleid());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }

    public List getWhisperComment(int whisperid) {
        String sql = "SELECT * \n" +
                "FROM COMMENT c\n" +
                "JOIN USER u\n" +
                "ON c.userid = u.userid\n" +
                "WHERE c.`whisperid` = ?";
        List whisperCommentSet = null;
        try {
            whisperCommentSet = new ArrayList<>();
            whisperCommentSet = runner.query(sql,new MapListHandler(),whisperid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return whisperCommentSet;
    }
}
