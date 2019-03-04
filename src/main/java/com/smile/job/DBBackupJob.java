package com.smile.job;

import com.smile.service.ToolService;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class DBBackupJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        //获取外部数据
        JobDataMap dataMap = jobExecutionContext.getJobDetail().getJobDataMap();
        String jobName = dataMap.getString("jobName");
        System.out.println(jobName+",begin !");
        ToolService toolService = new ToolService();
        toolService.backupDB();
    }
}
