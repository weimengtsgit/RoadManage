package org.ever4j.ftp.service;

import org.springframework.stereotype.Service;

import org.ever4j.ftp.base.ServerConnectConfig;

@Service
public interface FtpOperService {
	/**
	 * 单文件上传
	 */
	public void uploadFile();
	
	/**
	 * 批量上传
	 */
	public void batchUploadFile();
	
	/**
	 * 单文件下载
	 * @param serverConnectConfig 服务器连接配置 
	 * @param remotePath 运程ftp服务器上的某个文件夹（相对家目录路径）
	 * @param remoteFileName 要下载的远程ftp服务器上的某个文件
	 * @param localPath 要下载到本地的路径（全路径）
	 */
	public String downloadFile(ServerConnectConfig serverConnectConfig, String remotePath, String remoteFileName, String localPath);
	
	/**
	 * 批量下载
	 */
	public void batchDownloadFile();
	
	/**
	 * 单文件删除
	 */
	public void deleteFile();
	
	/**
	 * 批量删除
	 */
	public void batchDeleteFile();
}
