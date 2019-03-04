package com.smile.service;

import com.smile.bean.Backup;
import com.smile.dao.ToolDao;
import com.smile.utils.Bup_RecTool;
import com.smile.utils.ToolUtils;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ToolService {

    ToolDao toolDao = new ToolDao();
    public void addBackup(String backupTime, String filename, String url) {
        toolDao.addBackup(backupTime,filename,url);
    }

    public void backupDB() {
        Date backupDate = new Date();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy_MM_dd_HH-mm-ss");
        String backupTime1 = sdf1.format(backupDate);
        String backupTime2 = sdf2.format(backupDate);
        String filename = backupTime2+".sql";
        String savePath = "D:\\IDEAworkspace\\blog\\src\\main\\webapp\\DatabaseBackup";
        String url = savePath + File.separator + filename;
        if(Bup_RecTool.backup(savePath,filename)){
            addBackup(backupTime1,filename,url);
            System.out.println("数据备份成功啦，哈哈哈");
        }else{
            System.out.println("oh no ,备份失败");
        }
    }

    public void recoverDB() {
        Backup backup = toolDao.getBackup();
        String url = backup.getSqlUrl();
        if(Bup_RecTool.recover(url)) System.out.println("数据库恢复成功");
        else System.out.println("数据库恢复失败");
    }
}
