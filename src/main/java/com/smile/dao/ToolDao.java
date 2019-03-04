package com.smile.dao;

import com.smile.utils.DBUtils;
import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import java.sql.SQLException;

public class ToolDao {

    private QueryRunner runner = null;

    public ToolDao() {
        this.runner = new QueryRunner(DBUtils.getDataSource());
    }

    public int addBackup(String backupTime, String filename, String url) {
        String sql = "insert into backup(backuptime,filename,sqlUrl) values(?,?,?)";
        int isAdd = 0;
        try {
            isAdd = runner.update(sql,backupTime,filename,url);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isAdd;
    }
}
