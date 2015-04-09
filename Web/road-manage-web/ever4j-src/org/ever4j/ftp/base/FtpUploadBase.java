package org.ever4j.ftp.base;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
@Service
public class FtpUploadBase {
	
	private static Logger log = Logger.getLogger(FtpUploadBase.class);
	
	private FTPClient ftpClient = new FTPClient();
	private ServerConnectConfig serverConnectConfig;	
	
	
	public static void main(String[] args) {
		FtpUploadBase ftpUpload = new FtpUploadBase();
		ServerConnectConfig serverConfig = new ServerConnectConfig("192.168.30.56", 21, "lin", "123456");
		ftpUpload.setServerConnectConfig(serverConfig);
		try {
			ftpUpload.connect();
			try {
				String flag = ftpUpload.downloadFile("/", "test.xml", "f:/lin/test");
				if(flag != null){
					log.info("成功完成下载，下载文件路径为：f:/lin/test/test.xml");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 遍历某个远程文件夹的所有文件
	 * @param remotePath
	 * @param fileList
	 * @return 该目录下的所有文件名（全路径）组成的集合
	 */
	public List<String> getAllFileNamesInDirectory(String remotePath, List<String> fileNamesList){
		try {
			//将工作目录切换到指定的远程目录下
			ftpClient.changeWorkingDirectory(remotePath);
			FTPFile[] files = ftpClient.listFiles();
			if (files != null && files.length > 0) {
				for (FTPFile file : files) {
					if (file != null && file.isDirectory()) {
						getAllFileNamesInDirectory(remotePath, fileNamesList);
					}else if(file != null && file.isFile()){
						String filepath = remotePath + "/" + file.getName();
						fileNamesList.add(filepath);
					}
				}
			}
			return fileNamesList;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 遍历某个远程文件夹的所有文件
	 * @param remotePath
	 * @param fileList
	 * @return List<FTPFile>
	 */
	public List<FTPFile> getAllFilesInDirectory(String remotePath, List<FTPFile> fileList){
		try {
			//将工作目录切换到指定的远程目录下
			ftpClient.changeWorkingDirectory(remotePath);
			FTPFile[] files = ftpClient.listFiles();
			if (files != null && files.length > 0) {
				for (FTPFile file : files) {
					if (file != null && file.isDirectory()) {
						getAllFilesInDirectory(remotePath, fileList);
					}else if(file != null && file.isFile()){
						fileList.add(file);
					}
				}
			}
			return fileList;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询某个文件夹下的某个文件
	 * @param remotePath
	 * @param fileList
	 * @return List<FTPFile>
	 */
	public FTPFile getFileInDirectory(String remotePath, String remoteFileName){
		try {
			//将工作目录切换到指定的远程目录下
			ftpClient.changeWorkingDirectory(remotePath);
			FTPFile[] files = ftpClient.listFiles();
			if (files != null && files.length > 0) {
				for (FTPFile file : files) {
					if (file != null && file.isDirectory()) {
						getFileInDirectory(remotePath, remoteFileName);
					}else if(file != null && file.isFile()){
						if(file.getName().equals(remoteFileName)){
							return file;
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/** 
	  * 连接到FTP服务器 
	  * @return 是否连接成功 
	  * @throws IOException 
	  */ 
	 public boolean connect() throws IOException{  
		 ftpClient.connect(serverConnectConfig.getServerHost(), serverConnectConfig.getPort());   
	     ftpClient.setControlEncoding("GBK");   
	     if(FTPReply.isPositiveCompletion(ftpClient.getReplyCode())){   
	         if(ftpClient.login(serverConnectConfig.getFtpUserName(), serverConnectConfig.getFtpUserPasswd())){   
	             return true;   
	         }   
	     }   
	     ftpClient.disconnect();   
	     return false;   
	 }
	 
	 /** 
	  * 断开与远程服务器的连接 
	  * @throws IOException 
	  */ 
	 public void disconnect() throws IOException{   
	     if(ftpClient.isConnected()){   
	         ftpClient.disconnect();   
	     }   
	 }   
	
	 /**  
      * Description: 从FTP服务器下载文件  
      * @param remotePath FTP服务器上的相对路径  
      * @param fileName 要下载的文件名  
      * @param localPath 下载后保存到本地的路径  
      * @return  
      */   
     public String downloadFile( String remotePath, String fileName, String localPath) {   
         try {   
             ftpClient.changeWorkingDirectory(remotePath);//转移到FTP服务器目录    
             FTPFile[] fs = ftpClient.listFiles();   
             for(FTPFile ff:fs){   
                 if(ff.getName().equals(fileName)){   
                     File localFile = new File(localPath + "/" + ff.getName());   
                     OutputStream is = new FileOutputStream(localFile);    
                     ftpClient.retrieveFile(ff.getName(), is);   
                     is.close(); 
                     //删除该文件
                     ftpClient.deleteFile(remotePath + "/" + ff.getName());
                     return ff.getName();
                 }   
             }   
         } catch (IOException e) {   
             e.printStackTrace();   
         } 
         return null;   
     }


	public ServerConnectConfig getServerConnectConfig() {
		return serverConnectConfig;
	}

	public void setServerConnectConfig(ServerConnectConfig serverConnectConfig) {
		if(serverConnectConfig == null){
			serverConnectConfig = new ServerConnectConfig("192.168.30.56", 21, "lin", "123456");
		}
		this.serverConnectConfig = serverConnectConfig;
	} 
}
