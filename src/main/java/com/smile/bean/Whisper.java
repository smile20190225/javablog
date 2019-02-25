package com.smile.bean;

public class Whisper {
    private int whisperid;
    private int userid;
    private String whispercontent;
    private String picturepath;
    private String whispertime;
    private int commentcount;
    private int love;

    public Whisper() {
    }

    public int getWhisperid() {
        return whisperid;
    }

    public void setWhisperid(int whisperid) {
        this.whisperid = whisperid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getWhispercontent() {
        return whispercontent;
    }

    public void setWhispercontent(String whispercontent) {
        this.whispercontent = whispercontent;
    }

    public String getPicturepath() {
        return picturepath;
    }

    public void setPicturepath(String picturepath) {
        this.picturepath = picturepath;
    }

    public String getWhispertime() {
        return whispertime;
    }

    public void setWhispertime(String whispertime) {
        this.whispertime = whispertime;
    }

    public int getCommentcount() {
        return commentcount;
    }

    public void setCommentcount(int commentcount) {
        this.commentcount = commentcount;
    }

    public int getLove() {
        return love;
    }

    public void setLove(int love) {
        this.love = love;
    }
}
