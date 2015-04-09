package org.ever4j.utils;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class Utils {
	/**
	 * 将汉字由字节转为16进制
	 */
	public static String byte2hex(byte[] b) {
	    StringBuffer sb = new StringBuffer();
	    sb.append("|");
	    String stmp="";
	    for (int n=0; n<b.length; n++){
	      stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
	      if (stmp.length() == 1){
	        sb.append("0");
	        sb.append(stmp);
	        sb.append(" ");
	      }else{
	    	  sb.append(stmp);
	    	  if(n < b.length - 1) {
	    		  sb.append(" ");
	    	  }
	      }
	    }
	    sb.append("|");
	    return sb.toString().toUpperCase();
	}
	
	/**
	 * 格式化日期
	 */
	public static String dateToString(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
	public static String getHex(String keyWord, String type){
		byte[] bs;
		try {
			//用GBK转码
			if(type != null && type.equals("GBK")) {
				bs = keyWord.getBytes(type);
				String gbkv = Utils.byte2hex(bs);
				return gbkv;
			}else if(type != null && type.equals("UTF-8")) {
				//用UTF-8转码
				bs = keyWord.getBytes(type);
//				String utfv = new String(bs,type);
//				bs = utfv.getBytes(type);
				String hexfv = Utils.byte2hex(bs);
				return hexfv;
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String generateUUID(){
		 UUID uuid = UUID.randomUUID();
		 return uuid.toString().toUpperCase().replace("-", "");
	}
	
	public static void main(String[] args) {
//		String str = "医疗卫生";
//		byte[] bs;
		////			bs = str.getBytes("ISO-8859-1");
//			String utfv = new String(str.getBytes(),"UTF-8");
//			bs = utfv.getBytes("UTF-8");
//			String hexfv = Utils.byte2hex(bs);
//		System.out.println(Utils.getHex(str, "UTF-8"));
		System.out.println(String.valueOf(new Date().getTime()));
	}
}
