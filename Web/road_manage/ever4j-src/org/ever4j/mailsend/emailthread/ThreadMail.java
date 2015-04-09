package org.ever4j.mailsend.emailthread;

import javax.mail.internet.MimeUtility;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import org.ever4j.mailsend.email.Attachment;
import org.ever4j.mailsend.email.EmailAddress;



public class ThreadMail implements Runnable{
	  
	private  String smtp="";
	private  String port="";
	private  String from="";
	private  String to="";
	private  String cc="";
	private  String content="";
	private  String subject="";
	private  String user="";
	private  String pass="";
	
	private  String htmlMsg="";
	Set<EmailAddress> receivers;
	List<Attachment> attachs;
    boolean  auth=false;
    boolean  debug=false;
	//private  String sslSmtpPort="";
	//private  String fromName="" ;
	//private  String fromUsername ="";
	//private  String fromPassword ="";
  
  /**
   * 发送Email方法
   * @return boolean
   */
  public void run(){
      try {
  		  HtmlEmail email = new HtmlEmail();
  		  email.setCharset("utf-8");
  		  email.setHostName(this.smtp); // 发送邮件服务器 SMTP
//  		email.setSmtpPort(this.smtpPort);
          if(StringUtils.isNotBlank(this.port)){
              email.setSslSmtpPort(this.port);
              email.setSSL(true);
          }
  		  email.setFrom(this.user, this.from);
  		  email.setAuthentication(this.user, this.pass);
  		  email.setSubject(subject);
  		  if(StringUtils.isNotBlank(htmlMsg)){
  			  email.setHtmlMsg(htmlMsg);
  		  }
  		  addReceivers(email,receivers);
  		  addAttachs(email,attachs);
  		  email.send();
          /**
          //System.out.println(Thread.currentThread().getName()+" excute ......");
          
          //创建属性对象
          Properties props = new Properties();
          //设置邮件传输协议为：smtp
          props.put("mail.transpost.protocol","smtp");
          //设置邮件服务器地址
          props.put("mail.smtp.host", this.smtp);

          //设置邮件服务器端口
          props.put("mail.smtp.port",this.port);
        
        
          //创建session对象
          Session sendMailSession=null;
        
         if(this.auth){
                  //设置邮件验证为真
                  props.put("mail.smtp.auth", "true");
                  SmtpAuthenticator sa=new SmtpAuthenticator(this.user,this.pass);
                  sendMailSession = Session.getInstance(props, sa);
                  
          }else{
                  sendMailSession = Session.getInstance(props, null);
                   
         }
       
         //设置输出调试信息
         sendMailSession.setDebug(this.debug);

          //创建信息对象
         final MimeMessage newMessage = new MimeMessage(sendMailSession);
       
          //设置发信人地址
          newMessage.setFrom(new InternetAddress(this.from));
        

          //设置收信人地址，可以支持多用户发送

          newMessage.setRecipients(Message.RecipientType.TO,
                                  InternetAddress.parse(this.to));
        
          //设置抄送人地址
          newMessage.setRecipients(Message.RecipientType.CC,
                  InternetAddress.parse(this.cc));

          //设置信件正文
          newMessage.setContent(content, "text/plain;charset=GB2312");

          //设置信件主题

          newMessage.setSubject(this.subject,"GB2312");

          //设置信件发送日期
        
          newMessage.setSentDate(new Date());
        
          //发送邮件
          System.out.println("begin send to "+to+"...");
          Transport.send(newMessage);
         */
      }catch (EmailException e) {
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
  
  /**
   * 设置smtp服务器地址
   * @param smtp
   */
  public void setSmtp(String smtp){
      this.smtp=smtp;
  }
 
  /**
   * 设置端口
   * @param port
   */
  public void setPort(String port){
      this.port=port;
  }
 
  /**
   * 设置发信人地址
   * @param from
   */
  public void setFrom(String from){
      this.from=from;
  }
  /**
   * 设置收信人地址，可以支持多用户发送(,分隔)
   * @param to
   */
  public void setTo(String to){
      this.to=to;
  }
 
  /**
   * 设置抄送人地址
   * @param from
   */
  public void setCC(String cc){
      this.cc=cc;
  }
 
  /**
   * 设置正文内容text格式
   * @param content
   */
  public void setContent(String content){
      this.content=content;
  }
 
  /**
   * 设置标题
   * @param subject
   */
  public void setSubject(String subject){
      this.subject=subject;
  }
 
  /**
   * 验证的用户名
   * @param user
   */
  public void setUser(String user){
      this.user=user;
  }
 
  /**
   * 验证的用户密码
   * @param pass
   */
  public void setPass(String pass){
      this.pass=pass;
  }
 
  /**
   * 是否验证
   * @param auth
   */
  public void setAuth(boolean auth){
      this.auth=auth;
  }
 
  /**
   * 是否输出调试信息
   * @param debug
   */
  public void setDebug(boolean debug){
      this.debug=debug;
  }

  /**
   * @return the cc
   */
  public String getCc() {
  	return cc;
  }

  /**
   * @param cc the cc to set
   */
  public void setCc(String cc) {
  	this.cc = cc;
  }

  /**
   * @return the htmlMsg
   */
  public String getHtmlMsg() {
  	return htmlMsg;
  }

  /**
   * @param htmlMsg the htmlMsg to set
   */
  public void setHtmlMsg(String htmlMsg) {
  	this.htmlMsg = htmlMsg;
  }

  /**
   * @return the receivers
   */
  public Set<EmailAddress> getReceivers() {
  	return receivers;
  }

  /**
   * @param receivers the receivers to set
   */
  public void setReceivers(Set<EmailAddress> receivers) {
  	this.receivers = receivers;
  }

  /**
   * @return the attachs
   */
  public List<Attachment> getAttachs() {
  	return attachs;
  }

  /**
   * @param attachs the attachs to set
   */
  public void setAttachs(List<Attachment> attachs) {
  	this.attachs = attachs;
  }

  /**
   * @return the smtp
   */
  public String getSmtp() {
  	return smtp;
  }

  /**
   * @return the port
   */
  public String getPort() {
  	return port;
  }

  /**
   * @return the from
   */
  public String getFrom() {
  	return from;
  }

  /**
   * @return the to
   */
  public String getTo() {
  	return to;
  }

  /**
   * @return the content
   */
  public String getContent() {
  	return content;
  }

  /**
   * @return the subject
   */
  public String getSubject() {
  	return subject;
  }

  /**
   * @return the user
   */
  public String getUser() {
  	return user;
  }

  /**
   * @return the pass
   */
  public String getPass() {
  	return pass;
  }

  /**
   * @return the auth
   */
  public boolean isAuth() {
  	return auth;
  }

  /**
   * @return the debug
   */
  public boolean isDebug() {
  	return debug;
  }
   
}

