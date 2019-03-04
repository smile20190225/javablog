package com.smile.utils;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils;

import java.io.*;

public class Bup_RecTool {
    private static String hostIP = "127.0.0.1";
    private static String userName = "root";
    private static String password = "123456";
    private static String databaseName = "blog";

    public static boolean backup(String savePath,String fileName){
        File saveFile = new File(savePath);
        if(!saveFile.exists()){
            saveFile.mkdirs();
        }
        //如果路径不是以"/"结尾
        if(!savePath.endsWith(File.separator)){
            savePath += File.separator;
        }
        StringBuffer command = new StringBuffer();
        //拼接成命令行
        command.append("mysqldump").append(" --opt").append(" -h").append(hostIP);
        command.append(" --user=").append(userName).append(" --password=").append(password)
                .append(" --lock-all-tables=true");
        command.append(" --result-file=").append(savePath + fileName).append(" --default-character-set=utf8 ")
                .append(databaseName);
        System.out.println(command.toString());
        try {
            Process process = Runtime.getRuntime().exec(command.toString());
            if (process.waitFor() == 0) {// 0 表示线程正常终止。
                return true;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }catch (InterruptedException e){
            e.printStackTrace();
        }
        return false;
    }

    public static boolean recover(String filePath){
        String databaseName = "blog2";
        String stmt1 = "mysqladmin -h "+hostIP+" -u "+userName+" -p"+password+" create "+databaseName;//先创建数据库
        StringBuilder sb = new StringBuilder();
        sb.append("mysql");
        sb.append(" -h"+hostIP);
        sb.append(" -u"+userName);
        sb.append(" -p"+password);
        sb.append(" "+databaseName+" <");
        sb.append(filePath);
        System.out.println("cmd命令为："+sb.toString());
        Runtime runtime = Runtime.getRuntime();
        System.out.println("开始还原数据");
        try {
            Runtime.getRuntime().exec(stmt1);
            Process process = runtime.exec("cmd /c"+sb.toString());
            InputStream is = process.getInputStream();
            BufferedReader bf = new BufferedReader(new InputStreamReader(is,"utf8"));
            String line = null;
            while ((line=bf.readLine())!=null){
                System.out.println(line);
            }
            is.close();
            bf.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("还原成功！");
        return true;
    }

}
