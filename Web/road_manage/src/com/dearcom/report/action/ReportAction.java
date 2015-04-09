package com.dearcom.report.action;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.dearcom.report.service.ReportDayService;

@Controller
@RequestMapping("/report")
public class ReportAction {
	
	@Resource
	private ReportDayService reportDayService;
	
	/**
	 * 获取商场用户报表数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/mallReportFresh")
	@ResponseBody
	public Model mallReportFresh(Model model){
		String today = TimeUtil.getDate4String(0);
		String yesterday = TimeUtil.getDate4String(-1);
//		1：在线用户数
//		2：PV
//		3：UV
//		4：注册用户数
//		5：用户总数
//		6：商铺今天新增用户数
//		7：商铺总用户数
		// PV UV 注册用户数 （ 今天）
		Object pv = reportDayService.uniqueResult("select sum(count) from com_report_fresh where type=2 ");
		Object uv = reportDayService.uniqueResult("select sum(count) from com_report_fresh where type=3 ");
		Object newUser = reportDayService.uniqueResult("select sum(count) from com_report_fresh where type=4 ");
		Object allUser = reportDayService.uniqueResult("select sum(count) from com_report_fresh where type=5 ");
		
		// PV UV 注册用户数 （ 昨天）
		Object[] ydata = (Object[]) reportDayService.uniqueResult("select sum(pv) pv,sum(uv) uv,sum(new_user_count) new_user from com_report_day where date = ? ", yesterday);
		
		// 终端总量 
		Object allTerm =  reportDayService.uniqueResult("select count(1) from com_terminal where 1=1 ");
		// 在线终端数
		Object onlineTerm =  reportDayService.uniqueResult("select count(1) from com_terminal where online=1 ");
		
		
		model.addAttribute("mall_pv_today",pv);
		model.addAttribute("mall_pv_yesterday",ydata[0]);
		model.addAttribute("mall_uv_today",uv);
		model.addAttribute("mall_uv_yesterday",ydata[1]);
		model.addAttribute("mall_new_user_today",newUser);
		model.addAttribute("mall_new_user_yesterday",ydata[2]);
		model.addAttribute("mall_user_all",allUser);
		model.addAttribute("mall_term_all",allTerm);
		model.addAttribute("mall_term_online",onlineTerm);
		
		
		return model;
	}
	/**
	 * 获取商场用户报表数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/shopReportFresh")
	@ResponseBody
	public Model shopReportFresh(Model model){
		String today = TimeUtil.getDate4String(0);
		String yesterday = TimeUtil.getDate4String(-1);
//		记录类型：
//		1：在线用户数
//		2：PV
//		3：UV
//		4：注册用户数
//		5：用户总数
//		6：商铺今天新增用户数
//		7：商铺总用户数
		
		// 获取当前用户
		SysUser user = SessionUtil.getCurrentUser();
		String filterShopId="";
		String filterShopUUid="";
		if(user.getUserType().equals("3")){
			filterShopId=" and shop_id = "+user.getShop().getId()+" ";
			filterShopUUid=" and shop_uuid = '"+user.getShop().getShopUuid()+"' ";
		}
		
		// PV UV （ 今天）
		Object pv = reportDayService.uniqueResult("select sum(count) from com_report_fresh where type=2 "+filterShopUUid);
		Object uv = reportDayService.uniqueResult("select sum(count) from com_report_fresh where type=3 "+filterShopUUid);
		// PV UV（ 昨天）
		Object[] ydata = (Object[]) reportDayService.uniqueResult("select sum(pv) pv,sum(uv) uv from com_report_day where date = ? "+filterShopId, yesterday);
		
		// 新增用户数 昨天
		BigInteger yuser =  (BigInteger)reportDayService.uniqueResult("select count(1) from com_terminal where 1=1 "+filterShopUUid);
		// 新增用户数 今天
		Object tuser =  reportDayService.uniqueResult("select count from com_report_fresh where type=6 "+filterShopUUid);
		
		// 用户总数
		Object alluser =  reportDayService.uniqueResult("select count from com_report_fresh where type=7 "+filterShopUUid);
		
		
		model.addAttribute("mall_pv_today",pv==null?0:pv);
		model.addAttribute("mall_pv_yesterday",ydata[0]);
		model.addAttribute("mall_uv_today",uv==null?0:uv);
		model.addAttribute("mall_uv_yesterday",ydata[1]);
		model.addAttribute("mall_new_user_today",tuser==null?0:tuser);
		model.addAttribute("mall_new_user_yesterday",yuser==null||yuser.intValue()==0?0:yuser);
		model.addAttribute("mall_new_user_all",alluser==null?0:alluser);
		
		
		return model;
	}
	
	/**
	 * 获取商场用户报表数据
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/mallReport")
	@ResponseBody
	public Model mallReport(Model model){
		String today = TimeUtil.getDate4String(0);
		// pv 7 天趋势
		List lastPv7 = reportDayService.findBySql("select date, sum(pv) pv from com_report_day group by date order by date desc limit 0,7");
		JSONArray jsa = new JSONArray();
		for (int i = lastPv7.size()-1; i >=0; i--) {
			Object[] oo = (Object[]) lastPv7.get(i);
//			oo[0] = oo[0].toString().substring(4);
			jsa.add(oo);
		}
		// uv 7 天趋势
		List lastUv7 = reportDayService.findBySql("select date, sum(uv) uv from com_report_day group by date order by date desc limit 0,7");
		JSONArray jsaUv = new JSONArray();
		for (int i = lastUv7.size()-1; i >=0; i--) {
			Object[] oo = (Object[]) lastUv7.get(i);
//			oo[0] = oo[0].toString().substring(4);
			jsaUv.add(oo);
		}
		
		// 在线用户数 趋势 小时
		List onlineHour = reportDayService.findBySql("select time,online_user_count from com_report_hour where date=? order by id asc",today);
		JSONArray ojsa = new JSONArray();
		for (int i = 0; i <onlineHour.size(); i++) {
			Object[] oo = (Object[]) onlineHour.get(i);
//			oo[0] = oo[0].toString()+":00";
			ojsa.add(oo);
		}
		model.addAttribute("mall_last_pv",jsa);
		model.addAttribute("mall_last_uv",jsaUv);
		model.addAttribute("mall_online_hour",ojsa);
		
		
		return model;
	}
	/**
	 * 获取商铺用户报表数据  
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/shopReport")
	@ResponseBody
	public Model shopReport(Model model){
		// 获取当前用户
		SysUser user = SessionUtil.getCurrentUser();
		String shopId=user.getShop().getId().toString();
		
		// pv 30 天趋势
		List lastPv7 = reportDayService.findBySql("select date,pv from com_report_day where shop_id ="+shopId+"  order by date desc limit 0,30");
		JSONArray jsapv = new JSONArray();
		for (int i = lastPv7.size()-1; i >=0; i--) {
			Object[] oo = (Object[]) lastPv7.get(i);
//					oo[0] = oo[0].toString().substring(4);
			jsapv.add(oo);
		}
		// uv 30 天趋势
		List lastUv7 = reportDayService.findBySql("select date, uv from com_report_day where shop_id ="+shopId+"  order by date desc limit 0,30");
		JSONArray jsauv = new JSONArray();
		for (int i = lastUv7.size()-1; i >=0; i--) {
			Object[] oo = (Object[]) lastUv7.get(i);
//					oo[0] = oo[0].toString().substring(4);
			jsauv.add(oo);
		}
		
		model.addAttribute("mall_last_pv",jsapv);
		model.addAttribute("mall_last_uv",jsauv);
		return model;
	}
}
