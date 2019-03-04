package com.smile.job;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

public class JobSchedule {
    public static Scheduler schedule;
    public static JobDetail jobDetail;
    public static CronTrigger cronTrigger;

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
        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule("0 39 21 * * ? ");
        cronTrigger = TriggerBuilder.newTrigger().withIdentity(triggerName,triggerGroupName).withSchedule(cronScheduleBuilder).build();
        //把作业和触发器注册到任务调度中
        schedule.scheduleJob(jobDetail,cronTrigger);
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
