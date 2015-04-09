package org.ever4j.mailsend.emailthread;

public class Threadmailtest {

	public static void main(String [] args){
	
		TheadPool tp=new TheadPool(5);
	      //任务数
	      ThreadMail r[]=new ThreadMail[200];
	      String[] mutliTo={"XXX@136.com",};///自己加要发送的人
	      for (int i=0,j=200;i<j;i++){
	          r[i]=new ThreadMail();
	          r[i].setTo( mutliTo[i]);
	          r[i].setSubject("");
	          r[i].setContent("");
	          r[i].setSmtp("smtp.sina.com");
	          r[i].setAuth(true);
	          r[i].setUser("XX");
	          r[i].setPass("xx");
	          r[i].setFrom("xx");
	          tp.execute(r[i]);
	      }
	}
}
