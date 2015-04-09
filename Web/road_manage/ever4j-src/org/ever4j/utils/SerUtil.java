package org.ever4j.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class SerUtil {
	/**
	 * 序列化对象为String字符串
	 * 
	 * @param o
	 *            Object
	 * @return String
	 * @throws Exception
	 */
	public static String writeObject(Object o) throws Exception {
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		ObjectOutputStream oos = new ObjectOutputStream(bos);
		oos.writeObject(o);
		oos.flush();
		oos.close();
		bos.close();
		return new BASE64Encoder().encode(bos.toByteArray());
	}

	/**
	 * 反序列化字符串为对象
	 * 
	 * @param object
	 *            String
	 * @return
	 * @throws Exception
	 */
	public static Object readObject(String object) throws Exception {
		ByteArrayInputStream bis = new ByteArrayInputStream(
				new BASE64Decoder().decodeBuffer(object));
		ObjectInputStream ois = new ObjectInputStream(bis);
		Object o = ois.readObject();
		bis.close();
		ois.close();
		return o;
	}
}
