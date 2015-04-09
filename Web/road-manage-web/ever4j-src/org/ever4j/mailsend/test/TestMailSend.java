package org.ever4j.mailsend.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.ever4j.mailsend.email.Attachment;
import org.ever4j.mailsend.email.EmailAddress;
import org.ever4j.mailsend.email.ServerConfig;
import org.ever4j.mailsend.mailSend.MailSendUtil;




public class TestMailSend {
	
	public static void main(String[] args) {
		Set<EmailAddress> receivers = new HashSet<EmailAddress>();
		List<Attachment> attachs = new ArrayList<Attachment>();
		EmailAddress emailAddress = new EmailAddress("laopan", "panbaotao@eversec.cn");
		receivers.add(emailAddress);
		String subject = "test";
		String htmlMsg = "test";
		ServerConfig serverConfig = new ServerConfig();
		serverConfig.setSmtpServer("smtp.qq.com");
		serverConfig.setServerAccount("wangchenglin@eversec.cn");
		serverConfig.setServerPasswd("lin8637aa");
		MailSendUtil.sendEmail(receivers, subject, htmlMsg, attachs, serverConfig);
		System.out.println("已经成功发送，请注意查看！");
	}
	
	/**
	 *  发送邮件
	 */
	public void sendMail(){
		Set<EmailAddress> receivers = new HashSet<EmailAddress>();
		List<Attachment> attachs = new ArrayList<Attachment>();
		EmailAddress emailAddress = new EmailAddress("lin", "chenglin198637@126.com");
//		EmailAddress emailAddress2 = new EmailAddress("lin", "chenglin198637@126.com");
		receivers.add(emailAddress);
//		receivers.add(emailAddress2);
		String subject = "程序出现错误！";
		String htmlMsg = "程序出错了，请赶快抢修呀......";
//		Attachment attachment = new Attachment();
//		File file = new File("d:\\优卓快捷方式.exe");
//		attachment.setRealPath(file.getPath());
//		attachment.setName(file.getName());
//		attachs.add(attachment);
//		String htmlMsg = readFile(file);
		
		MailSendUtil.sendEmail(receivers, subject, htmlMsg, attachs, null);
		System.out.println("已经成功发送，请注意查看！");
	}
	
	/**
	 * 读取文件 
	 */
	public static String readFile(File file) {
		StringBuffer sb = new StringBuffer();
	    BufferedReader reader = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
//              System.out.println("line " + line + ": " + tempString);
//              line++;
            	sb.append(tempString);
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
        return sb.toString();
	}
}
