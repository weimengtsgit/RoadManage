package org.ever4j.mailsend.mailSend;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.ever4j.mailsend.email.Attachment;
import org.ever4j.mailsend.email.EmailAddress;
import org.ever4j.mailsend.email.Mail;
import org.ever4j.mailsend.email.ServerConfig;



public class MailSendUtil {
	
	
	/**
	 * 发送邮件
	 * @param receivers 接受者的地址，是一个set
	 * @param msgHtml   要发送信息的Html格式
	 * @param title     邮件主题
	 */
	public static void sendEmail(Set<EmailAddress> receivers,String subject,String htmlMsg, List<Attachment> attachs, ServerConfig serverconfig) {
		Mail mail = new Mail(serverconfig.getSmtpServer(), "","系统邮件", serverconfig.getServerAccount(), serverconfig.getServerPasswd());
		mail.sendMailAsThread(receivers, subject, htmlMsg, attachs);
	}
	/**
	 * 发送邮件
	 * @param receivers 接受者的地址
	 * @param msgHtml   要发送信息的Html格式
	 * @param title     邮件主题
	 */
	public static void sendEmail(EmailAddress receiver,String subject,String htmlMsg, List<Attachment> attachs) {
		Set<EmailAddress> receivers = new HashSet<EmailAddress>();
		receivers.add(receiver);
		sendEmail(receivers, subject, htmlMsg, attachs, null);
	}
}
