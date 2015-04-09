package org.ever4j.utils;

public class StringUtil {

	/**
	 * 自动判断首字符是否是大写，若为大写，则将首字母改为小写
	 */
	public static String convertInitial(String str){
		char[] chars=new char[1];
		chars[0]=str.charAt(0);
		String temp=new String(chars);
		if(chars[0]>='A' && chars[0]<='Z'){
			return str.replaceFirst(temp,temp.toLowerCase());
		}else{
			return str;
		}
	}
	
	/**
	 * 将驼峰式字符串，转为下划线分割字符串
	 */
	public static String convertStr(String str){
		StringBuilder sb = new StringBuilder();
		if(str != null && str.length() > 0){
			for (int i=0; i<str.length(); i++) {
				char[] chars=new char[1];
				chars[0]=str.charAt(i);
				String temp=new String(chars);
				if(chars[0]>='A' && chars[0]<='Z'){
					sb.append("_"+temp.toLowerCase());
				}else{
					sb.append(chars[0]);
				}
			}
		}
		return sb.toString();
	}
	
	/**
	 * 自动判断首字符是否是大写，若为小写，则将首字母改为大写
	 */
	public static String convertInitialUper(String str){
		if(str != null && !str.equals("")){
			char[] chars=new char[1];
			chars[0]=str.charAt(0);
			String temp=new String(chars);
			if(chars[0]>='a' && chars[0]<='z'){
				return str.replaceFirst(temp,temp.toUpperCase());
			}else{
				return str;
			}
		}
		return str;
	}
	
	public static void main(String[] args) {
		String str = "adminAcount";
		System.out.println(StringUtil.convertStr(str));
	}
}
