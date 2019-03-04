package com.smile.dao;

import com.smile.bean.Backup;
import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.awt.image.BufferedImage;
import java.sql.SQLException;

public class ToolDao {

    private QueryRunner runner = null;

    public ToolDao() {
        this.runner = new QueryRunner(DBUtils.getDataSource());
    }

    public int addBackup(String backupTime, String filename, String url) {
        String sql = "insert into Backup(backuptime,filename,sqlUrl) values(?,?,?)";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,backupTime,filename,url);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }

    public Backup getBackup() {
        String sql = "select * from backup order by backuptime";
        Backup backup = null;
        try {
            backup = runner.query(sql,new BeanHandler<Backup>(Backup.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return backup;
    }
}
