package com.smile.dao;

import com.smile.bean.Photo;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.MapListHandler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhotoDao {

    private QueryRunner runner = null;

    public PhotoDao() {
        runner = new QueryRunner(DBUtils.getDataSource());
    }

    public List getPhotoSet(int bloggerid) {
        String sql = "select * from Photo where userid = ? order by phototime desc";
        List photoSet = null;
        photoSet = new ArrayList();
        try {
            photoSet = runner.query(sql,new MapListHandler(),bloggerid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return photoSet;
    }

    public int uploadPhoto(Photo photo) {
        String sql = "insert into photo(userid,photopath,position,mood,phototime) values(?,?,?,?,?)";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,photo.getUserid(),photo.getPhotopath(),photo.getPosition(),photo.getMood(),photo.getPhototime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }
}
