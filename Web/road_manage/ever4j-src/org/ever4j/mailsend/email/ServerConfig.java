package org.ever4j.mailsend.email;

public class ServerConfig {
	private String smtpServer;
	
	private String serverAccount;
	
	private String serverPasswd;

	public String getSmtpServer() {
		return smtpServer;
	}

	public void setSmtpServer(String smtpServer) {
		this.smtpServer = smtpServer;
	}

	public String getServerAccount() {
		return serverAccount;
	}

	public void setServerAccount(String serverAccount) {
		this.serverAccount = serverAccount;
	}

	public String getServerPasswd() {
		return serverPasswd;
	}

	public void setServerPasswd(String serverPasswd) {
		this.serverPasswd = serverPasswd;
	}
}
