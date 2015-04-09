package org.ever4j.ftp.service;

import java.io.IOException;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.ever4j.ftp.base.FtpUploadBase;
import org.ever4j.ftp.base.ServerConnectConfig;

@Service
public class FtpOperServiceImpl implements FtpOperService{

	@Resource
	private FtpUploadBase ftpUploadBase;
	
	/**
	 * 上传文件
	 */
	@Override
	public void uploadFile() {
		
	}

	/**
	 * @param serverConnectConfig 服务器连接配置 
	 * @param remotePath 运程ftp服务器上的某个文件夹（相对家目录路径）
	 * @param remoteFileName 要下载的远程ftp服务器上的某个文件
	 * @param localPath 要下载到本地的路径（全路径）
	 */
	@Override
	public String downloadFile(ServerConnectConfig serverConnectConfig, String remotePath, String remoteFileName, String localPath) {
		//设置连接服务器
		ftpUploadBase.setServerConnectConfig(serverConnectConfig);
		try {
			//获得连接
			ftpUploadBase.connect();
			//下载文件
			String fileName = ftpUploadBase.downloadFile(remotePath, remoteFileName, localPath);
			//关闭连接
			ftpUploadBase.disconnect();
			if(fileName != null){
				return localPath + "/" + fileName;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 删除文件
	 */
	@Override
	public void deleteFile() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void batchUploadFile() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void batchDownloadFile() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void batchDeleteFile() {
		// TODO Auto-generated method stub
		
	}
	
}
