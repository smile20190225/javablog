package com.smile.bean;

public class Photo {
    private int photosid;
    private int userid;
    private  String photopath;
    private String position;
    private String mood;
    private String phototime;
    private int photostate;

    public Photo() {
    }

    public int getPhotosid() {
        return photosid;
    }

    public void setPhotosid(int photosid) {
        this.photosid = photosid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getPhotopath() {
        return photopath;
    }

    public void setPhotopath(String photopath) {
        this.photopath = photopath;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getMood() {
        return mood;
    }

    public void setMood(String mood) {
        this.mood = mood;
    }

    public String getPhototime() {
        return phototime;
    }

    public void setPhototime(String phototime) {
        this.phototime = phototime;
    }

    public int getPhotostate() {
        return photostate;
    }

    public void setPhotostate(int photostate) {
        this.photostate = photostate;
    }
}
