package com.smile.bean;

public class Backup {
    private int backupid;
    private String backuptime;
    private String filename;
    private String sqlUrl;

    public int getBackupid() {
        return backupid;
    }

    public void setBackupid(int backupid) {
        this.backupid = backupid;
    }

    public String getBackuptime() {
        return backuptime;
    }

    public void setBackuptime(String backuptime) {
        this.backuptime = backuptime;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getSqlUrl() {
        return sqlUrl;
    }

    public void setSqlUrl(String sqlUrl) {
        this.sqlUrl = sqlUrl;
    }
}

