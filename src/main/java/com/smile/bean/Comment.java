package com.smile.bean;

public class Comment {
    private int commentid;
    private int userid;
    private int articleid;
    private int whisperid;
    private String commentcontent;
    private String commenttime;

    public Comment() {
    }

    public int getCommentid() {
        return commentid;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getArticleid() {
        return articleid;
    }

    public void setArticleid(int articleid) {
        this.articleid = articleid;
    }

    public int getWhisperid() {
        return whisperid;
    }

    public void setWhisperid(int whisperid) {
        this.whisperid = whisperid;
    }

    public String getCommentcontent() {
        return commentcontent;
    }

    public void setCommentcontent(String commentcontent) {
        this.commentcontent = commentcontent;
    }

    public String getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(String commenttime) {
        this.commenttime = commenttime;
    }
}
