package com.smile.utils;
import org.apache.commons.mail.SimpleEmail;

import java.util.Date;

public class EMailTool {
	static public String emailHost = "smtp.163.com";
	static public String emailUserEmail = "13432929246@163.com";
	static public String emailUserName = "13432929246";
	static public String emailPassword = "smile123";
	static public String domain = "http://localhost:8080/blog";
	
	static public boolean sendSimpleEmail(String to, String subject, String emailContent){
		boolean result = false;
		SimpleEmail simpleEmail=new SimpleEmail();
		//设置字符编码方式
		simpleEmail.setCharset("UTF-8");
		try {
			//设置邮件服务器
			simpleEmail.setHostName(emailHost);
			//设置帐号密码
			simpleEmail.setAuthentication(emailUserName,emailPassword);
			//设置发送源邮箱
			simpleEmail.setFrom(emailUserEmail);
			//设置目标邮箱
			simpleEmail.addTo(to, emailUserEmail);
			//设置主题
			simpleEmail.setSubject(subject);
			//设置邮件内容
			simpleEmail.setMsg(emailContent);
			//发送邮件
			simpleEmail.send();
			result = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	static public Integer sendReturnPassword(String to, String code){
		Integer result = -1;
		SimpleEmail simpleEmail=new SimpleEmail();
		//设置字符编码方式
		simpleEmail.setCharset("UTF-8");
		try {
			simpleEmail.setSslSmtpPort("25");
			//设置SMTP邮件服务器，比如:smtp.163.com
			simpleEmail.setHostName(emailHost);
			//设置登入认证服务器的 用户名 和 授权密码 （发件人））
			simpleEmail.setAuthentication(emailUserName,emailPassword);
			//设置发送源邮箱
			simpleEmail.setFrom(emailUserEmail);
			//设置收件人可以是多个：simpleEmail.addTo("xxx@qq.com", "sky-xuyi");
			simpleEmail.addTo(to, emailUserEmail);				
			//设置主题
			simpleEmail.setSubject("找回密码");			
			//设置邮件内容
			String url=domain+"/home/changePassword?code="+code;
			simpleEmail.setMsg("找回密码--请复制以下网址，并在浏览器地址栏粘贴并访问："+url);
			//发送邮件
			simpleEmail.setSentDate(new Date());
			simpleEmail.send();
			result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}	
}
