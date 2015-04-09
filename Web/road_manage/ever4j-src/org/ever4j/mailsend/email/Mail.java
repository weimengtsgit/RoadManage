package org.ever4j.mailsend.email;

import java.io.UnsupportedEncodingException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.mail.internet.MimeUtility;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import org.ever4j.mailsend.emailthread.TheadPool;
import org.ever4j.mailsend.emailthread.ThreadMail;



/**
 * 
 * @version 1.0 , 2011-5-19
 *
 */
public class Mail {
	private  String smtp ;
	private  String sslSmtpPort;
	private  String fromName ;
	private  String fromUsername ;
	private  String fromPassword ;
	
	public static TheadPool tp = null;//设置线程池
	/**
	 * @param smtp 发送邮件服务器SMTP
	 * @param fromName 发送者的名称
	 * @param fromUsername 发送邮箱登陆用户
	 * @param fromPassowrd 发送邮箱登陆密码
	 */
	public Mail(String smtp,String sslSmtpPort, String fromName, String fromUsername,
			String fromPassword) {
		super();
		System.out.println("[Mail]>>>>>>>>>>>>>>>>init the  Mail tool start");
		this.smtp = smtp;
		this.sslSmtpPort = sslSmtpPort;
		this.fromName = fromName;
		this.fromUsername = fromUsername;
		this.fromPassword = fromPassword;
		System.out.println("[Mail]>>>>>>>>>>>>>>>>>init the  Mail tool success");
	}

	/**
	 * 利用多线程发送邮件
	 * @param receivers 收件人列表  ValueObject : {name:"姓名" , email:"邮箱地址"}
	 * @param subject 主题
	 * @param htmlMsg 内容
	 * @param attachs 附件列表  ValueObject : {realPath:"附件绝对路径" , name:"附件名称"}
	 * @version 1.0 , 2010-10-20
	 * @author caobo
	 */
	public  void sendMailAsThread(Set<EmailAddress> receivers,String subject,String htmlMsg,List<Attachment> attachs){
		try {
    		if(tp==null){
          	    tp = new TheadPool(5);
    		}
  	        //任务数
  	        ThreadMail r = new ThreadMail();
  	        
  	        r.setSubject(subject);
  	        r.setAttachs(attachs);
  	        r.setHtmlMsg(htmlMsg);
  	        r.setReceivers(receivers);
  	        r.setSmtp(this.smtp);
  	        r.setAuth(true);
  	        r.setUser(this.fromUsername);
  	        r.setPass(this.fromPassword);
  	        r.setFrom(this.fromName);
  	        tp.execute(r);

    	}catch (Exception e) {
    		e.printStackTrace();
    	}
	}
	
	/**
	 * 发送邮件
	 * @param receivers 收件人列表  ValueObject : {name:"姓名" , email:"邮箱地址"}
	 * @param subject 主题
	 * @param htmlMsg 内容
	 * @param attachs 附件列表  ValueObject : {realPath:"附件绝对路径" , name:"附件名称"}
	 * @version 1.0 , 2010-10-20
	 * @author caobo
	 */
	public  void sendMail(Set<EmailAddress> receivers,String subject,String htmlMsg,List<Attachment> attachs){
		try {
			System.out.println("[Mail]>>>>>>>>>>>>>>send email start");
    		HtmlEmail email = new HtmlEmail();
    		email.setCharset("utf-8");
    		email.setHostName(this.smtp); // 发送邮件服务器 SMTP
//    		email.setSmtpPort(this.smtpPort);
            if(StringUtils.isNotBlank(this.sslSmtpPort)){
            	email.setSslSmtpPort(this.sslSmtpPort);
            	email.setSSL(true);
            }
    		email.setFrom(this.fromUsername, this.fromName);
    		email.setAuthentication(this.fromUsername, this.fromPassword);
    		email.setSubject(subject);
    		if(StringUtils.isNotBlank(htmlMsg)){
    			email.setHtmlMsg(htmlMsg);
    		}
    		addReceivers(email,receivers);
    		addAttachs(email,attachs);
    		email.send();
    		System.out.println("[Mail]>>>>>>>>>>>>>>send email success");
    	}
    	catch (EmailException e) {
    		System.out.println("[Mail]>>>>>>>>>>>>>>send email failing");
    		e.printStackTrace();
    	}
	}

	/**
	 * 给邮件增加附件
	 * @param email
	 * @param attachs 附件列表  ValueObject : {realPath:"附件绝对路径" , name:"附件名称"}
	 * @version 1.0 , 2010-10-20
	 * @author caobo
	 * @throws EmailException 
	 */
	private void addAttachs(HtmlEmail email, List<Attachment> attachs) throws EmailException {
		if(attachs!=null){
			Attachment vo;
			EmailAttachment ea;
			for(int i=0;i<attachs.size();i++){
				vo = attachs.get(i);
				ea = new EmailAttachment();
	    		ea.setPath(vo.getRealPath());
	    		try {
					ea.setName(MimeUtility.encodeText(vo.getName()));
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
	    		email.attach(ea);
			}
		}
	}

	/**
	 * 给邮件增加接收人
	 * @param email
	 * @param receivers 收件人列表  ValueObject : {name:"姓名" , email:"邮箱地址"}
	 * @version 1.0 , 2010-10-20
	 * @author caobo
	 * @throws EmailException 
	 */
	private void addReceivers(HtmlEmail email, Set<EmailAddress> receivers) throws EmailException {
		String emailAddr;
		for(EmailAddress vo:receivers){
			if(vo!=null){
				emailAddr = vo.getAddress();
				if(StringUtils.isNotBlank(emailAddr)){
					if(StringUtils.isNotBlank(vo.getName())){
						email.addTo(emailAddr,vo.getName());
					}else{
						email.addTo(emailAddr);
					}
				}
			}
		}
		// 默认个自己发一封
		//email.addTo(this.fromUsername);
	}
	
	public static void main(String[] args) {

		Mail mail = new Mail("mail.uwaysoft.com", "","weiboup", "uwaydesk@uwaysoft.com", "abc123abc");
		
		Set<EmailAddress> receivers = new HashSet<EmailAddress>();

		EmailAddress re2=new EmailAddress("abc123abc","zhanghs@uwaysoft.com");
		receivers.add(re2);
		
		//mail.sendMail(receivers, "测试邮件发送", "通知", null);
		//sendMailAsThread
		for(int i=0;i<15;i++){
			System.out.println("mail"+i);
			mail.sendMailAsThread(receivers, "测试邮件发送", "通知", null);
		}
	}
}
