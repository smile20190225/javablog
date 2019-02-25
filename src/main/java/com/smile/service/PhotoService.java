package com.smile.service;

import com.smile.bean.Photo;
import com.smile.dao.PhotoDao;

import java.util.List;

public class PhotoService {
    private PhotoDao photoDao = new PhotoDao();

    public List getPhotoSet(int bloggerid){
        return photoDao.getPhotoSet(bloggerid);
    }

    public int uploadPhoto(Photo photo) {
        return photoDao.uploadPhoto(photo);
    }
}
