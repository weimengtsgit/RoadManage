package org.ever4j.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.commons.lang.StringUtils;

import ch.ethz.ssh2.Connection;
import ch.ethz.ssh2.Session;

import com.alibaba.fastjson.JSONObject;

public class DeviceMonitor {

	/**
	 * 获取设备状态信息
	 * 
	 * @param hostname
	 * @param username
	 * @param password
	 * @param app
	 *            应用名称 用,分割
	 * @return
	 */
	public static JSONObject getActiveState(String hostname, String username,
			String password, String app) {
		JSONObject jso = new JSONObject();
		Connection conn = null;
		try {
			conn = new Connection(hostname);
			conn.connect();

			boolean isAuthenticated = conn.authenticateWithPassword(username,
					password);
			if (isAuthenticated == false)
				throw new IOException("Authentication failed.");


			float cpu = getCpuInfo(conn);
			jso = getMemoryInfo(conn,jso);
			long flow = getFlowInfo(conn); // Mbps
			int appState = getAppStates(conn, app);
			String  errApps = getErrorApps(conn, app);

			jso.put("cpu", cpu);
			jso.put("flow", flow);
			jso.put("appState", appState);
			jso.put("deviceState", 0);
			jso.put("msg", "");
			if(appState==1){
				jso.put("msg", "应用异常关闭");
			}
			jso.put("errApps", errApps);
			conn.close();
		} catch (IOException e) {
			jso.put("flow", 0);
			jso.put("deviceState", 1);
			jso.put("appState", 1);
			jso.put("msg", "服务器异常关闭");
			e.printStackTrace();
		} finally {
			
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
				}
			}
		}
		return jso;
	}

	private static String getErrorApps(Connection conn, String app) {
		String errs = "";
		if (StringUtils.isNotBlank(app)) {
			String[] apps = app.split(",");
			for (int i = 0; i < apps.length; i++) {
				int state = getAppState(conn, app);
				if (state == 0) {
					errs+=","+apps[i];
				}

			}
		}
		return errs;
	}

	/**
	 * 如果全部app都存在 则返回1 ，任何一个app不存在则返回0
	 * @param conn
	 * @param app
	 * @return
	 */
	private static int getAppStates(Connection conn, String app) {
		int n = 0;
		if (StringUtils.isNotBlank(app)) {
			String[] apps = app.split(",");
			for (int i = 0; i < apps.length; i++) {
				int state = getAppState(conn, app);
				if (state == 0) {
					n = 1;
					break;
				}

			}
		}

		return n;
	}

	private static int getAppState(Connection conn, String app) {
		String command = "ps -ef | grep -i '" + app
				+ "' | grep -v 'grep' | wc -l ";
		String re = excuteCommand(conn, command);
		int state = Integer.parseInt(re.split("\n")[0]);
		return state;
	}

	private static String excuteCommand(Connection conn, String command) {
		String re = "";
		Session sess = null;
		try {
			sess = conn.openSession();
			sess.execCommand(command);
			InputStream is = sess.getStdout();
			re = convertStreamToString(is);
//			InputStream is2 = sess.getStderr();
//			String re2 = convertStreamToString(is2);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				sess.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return re;
	}

	private static long getFlowInfo(Connection conn) {
		long start = getFlowBytes(conn);
		
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		long end = getFlowBytes(conn);
		
//		long flow = (end-start)/(1024*1024*5);
		long flow = (end-start)/(1024*5);
		
		return flow;
	}

	private static long getFlowBytes(Connection conn) {
		String re = excuteCommand(conn, "/sbin/ifconfig | grep 'RX bytes'");
		
		Pattern p=Pattern.compile("RX bytes:\\d+");
		Matcher m=p.matcher(re);
		long start = 0 ;
		while(m.find()){
			start+= Long.parseLong(m.group().replace("RX bytes:", ""));
		}
		p=Pattern.compile("TX bytes:\\d+");
		m=p.matcher(re);
		while(m.find()){
			start+= Long.parseLong(m.group().replace("TX bytes:", ""));
		}
		
		return start;
	}

	private static JSONObject getMemoryInfo(Connection conn, JSONObject jso) {
		String re = excuteCommand(conn, "free");
		Pattern p=Pattern.compile("Mem:.+");
		Matcher m=p.matcher(re);
		if(m.find()){
			String mms = m.group().replace("Mem:", "");
			Pattern p2=Pattern.compile("\\d+");
			Matcher m2=p2.matcher(mms);
			int count=0;
			while(m2.find()){
				switch (count) {
				case 0:
					jso.put("total", Long.parseLong(m2.group()));
					break;
				case 1:
					jso.put("used", Long.parseLong(m2.group()));
					break;
				case 2:
					jso.put("free", Long.parseLong(m2.group()));
					break;
				case 4:
					jso.put("buffer", Long.parseLong(m2.group()));
					break;

				default:
					break;
				}
				count++;
			}
			
			
		}
		return jso;
	}

	private static float getCpuInfo(Connection conn) {
		String re = excuteCommand(conn, "/usr/bin/top -ibcn 1");
		float n = 0;
		
		Pattern p=Pattern.compile("\\d+\\.\\d+%id");
		Matcher m=p.matcher(re);
		if(m.find()){
			n = Float.parseFloat(m.group().replace("%id", ""));
		}
		return 100-n;
	}

	public static String convertStreamToString(InputStream is)
			throws IOException {
		int i = -1;

		ByteArrayOutputStream baos = new ByteArrayOutputStream();

		while ((i = is.read()) != -1) {
			baos.write(i);
		}
		String content = baos.toString();
		return content;
	}

	public static void main(String[] args) {
		JSONObject jso = getActiveState("192.168.200.190", "root", "123456",
				"tomcat");
		System.out.println(jso);
	}
}
