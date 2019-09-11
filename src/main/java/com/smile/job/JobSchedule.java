package com.smile.job;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.matchers.EverythingMatcher;
import org.quartz.impl.matchers.KeyMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JobSchedule {
    public static Scheduler schedule;
    public static JobDetail jobDetail;
    public static CronTrigger cronTrigger;
    private static Logger logger = LoggerFactory.getLogger(JobSchedule.class);


    public static void backupScheduler(String jobName,String jobGroupName,String triggerName,String triggerGroupName)throws SchedulerException{
        //通过schedulerFactory获取一个调度器
        SchedulerFactory schedulerFactory = new StdSchedulerFactory();
        schedule = schedulerFactory.getScheduler();
        //创建一个JobDetail实例，绑定Job类
        jobDetail = JobBuilder.newJob(DBRecoverJob.class).withIdentity(jobName,jobGroupName).build();
        //向job传递数据
        JobDataMap jobDataMap = jobDetail.getJobDataMap();
        jobDataMap.put("jobName","备份数据库");
        //创建触发规则
        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("0 11 10 * * ? ");
        cronTrigger = TriggerBuilder.newTrigger().withIdentity(triggerName,triggerGroupName).withSchedule(cronScheduleBuilder).build();
        //把作业和触发器注册到任务调度中
        schedule.scheduleJob(jobDetail,cronTrigger);
        //创建并注册一个全局的Job Listener
        DBBackupJobListener dbBackupJobListener = new DBBackupJobListener();
        //schedule.getListenerManager().addJobListener(dbBackupJobListener, EverythingMatcher.allJobs());
        //创建一个指定Job的Job Listener
        Matcher<JobKey> matcher = KeyMatcher.keyEquals(new JobKey("111","222"));
        //schedule.getListenerManager().addJobListener(dbBackupJobListener, KeyMatcher.keyEquals(JobKey.jobKey("111","222")));
        schedule.getListenerManager().addJobListener(dbBackupJobListener,matcher);
        logger.info("schedule begin");
        //启动调度
        schedule.start();
    }

    public static void recoverScherduler(String jobName,String jobGroupName,String triggerName,String triggerGroupName)throws SchedulerException{
        SchedulerFactory schedulerFactory = new StdSchedulerFactory();
        schedule = schedulerFactory.getScheduler();
        JobDetail jobDetail = JobBuilder.newJob(DBRecoverJob.class).withIdentity(jobName,jobGroupName).build();
        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("0 15 22 * * ?");
        cronTrigger = TriggerBuilder.newTrigger().withIdentity(triggerName,triggerGroupName).withSchedule(cronScheduleBuilder).build();
        schedule.scheduleJob(jobDetail,cronTrigger);
        schedule.start();
    }

}
