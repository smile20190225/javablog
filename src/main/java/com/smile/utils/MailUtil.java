package com.smile.utils;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailUtil implements Runnable{
	
	public static final String SMTPSERVER = "smtp.163.com";//邮箱服务器地址（用QQ还是网易看需求，我这里用的是网易邮箱）
    public static final String SMTPPORT = "465"; //邮箱服务器默认端口
    public static final String ACCOUT = "13432929246@163.com";//邮箱帐号
    public static final String PWD = "smile123";//这是授权码，并不是邮箱的登录密码

	public static int sendEmail(String email,String code,int userid) {
		Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "smtp"); // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", SMTPSERVER); // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.port", SMTPPORT); 
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.auth", "true"); // 需要请求认证
        props.setProperty("mail.smtp.ssl.enable", "true");// 开启ssl
		
 
     		// 保存设置
     		try {
     			  // 1.根据邮件配置创建会话，注意session别导错包
     	        Session session = Session.getDefaultInstance(props);
     	        // 开启debug模式，可以看到更多详细的输入日志
     	        session.setDebug(true);
     	     
     	     // 2.创建邮件对象
     	       Message message = new MimeMessage(session);
     	     	
     	        //2.1 address邮件地址, personal邮件昵称, charset编码方式
     	        InternetAddress fromAddress = new InternetAddress(ACCOUT, "smile邮件测试", "utf-8");
     	        // 设置发送邮件方
     	        message.setFrom(fromAddress);
     	        
     	        //2.2 设置邮件接收方
     	        InternetAddress receiveAddress = new InternetAddress(email , "邮箱验证", "utf-8");
     	        message.setRecipient(RecipientType.TO, receiveAddress);
     	     
     	        // 2.3设置邮件标题
     	        message.setSubject("邮箱验证");
     	        //msg.setContent(m,"text/html;charset=gb2312");
     	       
     	     	// 2.4设置邮件内容

				/*String content = "<html><head></head><body><h1>这是一封找回密码的邮件,请点击以下链接重新设置您的密码</h1><h3><a href='http://localhost:8080/blog/servlet/UserServlet?code="
						+ code + "'>重新设置密码</h3></body></html>";*/
				String content = "<!DOCTYPE html>\n" +
						"<html lang=\"en\">\n" +
						"<head>\n" +
						"    <meta charset=\"UTF-8\">\n" +
						"    <title>find password</title>\n" +
						"</head>\n" +
						"<body>\n" +
						"    <h1>click this magnet and chang your password:</h1>\n" +
						"    <a href='http://localhost:8080/blog/home/changePassword.html?code="+code+"&userid="+userid+"'>change my password</a>\n" +
						"</body>\n" +
						"</html>";

     	     	message.setContent(content, "text/html;charset=UTF-8");

     	        //2.5 设置显示的发件时间
     	     	message.setSentDate(new Date());
     			
     			//2.6保存设置  			
				message.saveChanges();

		     	// 3.发送邮件
				Transport transport = session.getTransport();
		        transport.connect(SMTPSERVER,ACCOUT, PWD);
		        //连接，并发送邮件
		        transport.sendMessage(message, message.getAllRecipients());
		        transport.close();
		     		     		
			} catch (MessagingException e) {
				e.printStackTrace();
				return -1;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
				return -2;
			}
     		return 1;
	}


	@Override
	public void run() {
		System.out.println("run");
	}
}
