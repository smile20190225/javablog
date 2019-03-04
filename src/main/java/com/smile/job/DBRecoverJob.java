package com.smile.job;

import com.smile.service.ToolService;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class DBRecoverJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        JobDataMap jobDataMap = jobExecutionContext.getJobDetail().getJobDataMap();
        String jobName = jobDataMap.getString("jobName");
        System.out.println(jobName);
        ToolService toolService = new ToolService();
        toolService.recoverDB();
    }
}
