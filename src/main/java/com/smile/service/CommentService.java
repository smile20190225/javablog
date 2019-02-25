package com.smile.service;

import com.smile.bean.Comment;
import com.smile.dao.CommentDao;

import java.util.List;

public class CommentService {
    private CommentDao commentDao = new CommentDao();

    public int addComment(Comment comment){
        return commentDao.addComment(comment);
    }

    public List getWhisperComment(int whisperid) {
        return commentDao.getWhisperComment(whisperid);
    }
}
