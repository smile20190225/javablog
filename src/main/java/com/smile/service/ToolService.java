package com.smile.service;

import com.smile.dao.ToolDao;

public class ToolService {

    ToolDao toolDao = new ToolDao();
    public void addBackup(String backupTime, String filename, String url) {
        toolDao.addBackup(backupTime,filename,url);
    }
}
