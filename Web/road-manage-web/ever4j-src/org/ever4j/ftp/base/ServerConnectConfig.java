package org.ever4j.ftp.base;

public class ServerConnectConfig {
	private String serverHost;
	private Integer port;
	private String ftpUserName;
	private String ftpUserPasswd;
	
	public ServerConnectConfig(){}
	/**
	 * @param serverHost： 服务器host名称
	 * @param port：端口  
	 * @param ftpUserName：ftp用户名
	 * @param ftpUserPasswd：ftp密码
	 */
	public ServerConnectConfig(String serverHost, Integer port, String ftpUserName, String ftpUserPasswd){
		this.serverHost = serverHost;
		this.port = port;
		this.ftpUserName = ftpUserName;
		this.ftpUserPasswd = ftpUserPasswd;
	}

	public String getServerHost() {
		return serverHost;
	}

	public void setServerHost(String serverHost) {
		this.serverHost = serverHost;
	}

	public Integer getPort() {
		return port;
	}

	public void setPort(Integer port) {
		this.port = port;
	}

	public String getFtpUserName() {
		return ftpUserName;
	}

	public void setFtpUserName(String ftpUserName) {
		this.ftpUserName = ftpUserName;
	}

	public String getFtpUserPasswd() {
		return ftpUserPasswd;
	}

	public void setFtpUserPasswd(String ftpUserPasswd) {
		this.ftpUserPasswd = ftpUserPasswd;
	}
}
