package com.smile.job;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBBackupJobListener implements JobListener {

    //SLF4J只是一个接口，可以实现程序的解藕。SLF4J可以与log4j、logback、jdk等日志系统结合，以及在这些日志系统之间切换。
    private static Logger logger = LoggerFactory.getLogger(DBBackupJob.class);

    @Override
    public String getName() {
        logger.info("DBbackupListener get name !");
        System.out.println("得到姓名");
        return this.getClass().getSimpleName();
    }

    @Override
    public void jobToBeExecuted(JobExecutionContext jobExecutionContext) {
        logger.info("DBBackupJob to be executed !");
        System.out.println("将要执行");
    }

    @Override
    public void jobExecutionVetoed(JobExecutionContext jobExecutionContext) {
        logger.info("DBBackupJob be vetoed !");
        System.out.println("被终止");
    }

    @Override
    public void jobWasExecuted(JobExecutionContext jobExecutionContext, JobExecutionException e) {
        logger.info("DBBackupJob wax executed !");
        System.out.println("执行完毕");
    }
}
