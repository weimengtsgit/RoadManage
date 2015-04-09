package org.ever4j.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;


public class PropertiesUtil {
	
	public static String getValueByKey(String propertiesFile, String key){
		String res = null;
		try{
			InputStream is = PropertiesUtil.class.getClassLoader().getResourceAsStream(propertiesFile);
			Properties p = new Properties();
			p.load(is);
			is.close();
			res = p.getProperty(key);
		}
		catch(Exception err){
			err.printStackTrace();
		}
		return res;
	}
	
	public static String setValueByKey(String propertiesFile, String key, String value){
		String res = null;
		try{
			String newFilePath = PropertiesUtil.class.getResource("/").getPath();
			File file = new File(newFilePath); 
			file = new File(newFilePath + propertiesFile);
			if (!file.exists()) 
			file.createNewFile(); 
			InputStream fis = new FileInputStream(file); 
			Properties prop = new Properties();
			prop.load(fis); 
			fis.close(); 

			prop.setProperty(key, value); 
			OutputStream fos = new FileOutputStream(file.getPath()); 
			prop.store(fos, null); 
			fos.close();
		}
		catch(Exception err){
			err.printStackTrace();
		}
		
		return res;
	}
}
