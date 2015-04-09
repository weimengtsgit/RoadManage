package com.dearcom.stat.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.base4j.orm.hibernate.BaseAction;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.dearcom.stat.service.StatMallService;

@Controller
@RequestMapping("/stat/statShowMall")
public class StatShowMallAction extends BaseAction {

	@Resource
	private StatMallService statMallService;

	/**
	 * 显示客流量统计页面(平台、商场管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statShowMall/view");
	}

	/**
	 * 初始化商场客流量的数据(平台、商场管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/init")
	@ResponseBody
	public Model init(Model model) {
		String today = TimeUtil.getDate4String(0);
		String yesterday = TimeUtil.getDate4String(-1);
		String beforeYesterday = TimeUtil.getDate4String(-2);
		// 如果为商场管理员，则只显示当前用户所属商场的信息
		SysUser user = SessionUtil.getCurrentUser();
		if (user.getUserType().equals("2")) {
			Integer mallId = user.getMall().getId();
			Object totalPv = statMallService.uniqueResult(
					"select show_count from com_mall where id = ? ", mallId);
			Object todayPv = statMallService
					.uniqueResult(
							"select count(1) from com_show_mall where date(time) = ? and mall_id = ?",
							today, mallId);
			Object yesterdayPv = statMallService
					.uniqueResult(
							"select pv from com_stat_mall where date = ? and mall_id = ? ",
							yesterday, mallId);
			Object beforeYesterdayPv = statMallService
					.uniqueResult(
							"select pv from com_stat_mall where date = ? and mall_id = ? ",
							beforeYesterday, mallId);
			model.addAttribute("totalPv", totalPv == null ? 0 : totalPv);
			model.addAttribute("todayPv", todayPv == null ? 0 : todayPv);
			model.addAttribute("yesterdayPv", yesterdayPv == null ? 0
					: yesterdayPv);
			model.addAttribute("beforeYesterdayPv",
					beforeYesterdayPv == null ? 0 : beforeYesterdayPv);
		} else {
			Object totalPv = statMallService
					.uniqueResult("select sum(show_count) from com_mall");
			Object todayPv = statMallService.uniqueResult(
					"select count(1) from com_show_mall where date(time) = ?",
					today);
			Object yesterdayPv = statMallService.uniqueResult(
					"select sum(pv) from com_stat_mall where date = ? ",
					yesterday);
			Object beforeYesterdayPv = statMallService.uniqueResult(
					"select sum(pv) from com_stat_mall where date = ? ",
					beforeYesterday);
			model.addAttribute("totalPv", totalPv == null ? 0 : totalPv);
			model.addAttribute("todayPv", todayPv == null ? 0 : todayPv);
			model.addAttribute("yesterdayPv", yesterdayPv == null ? 0
					: yesterdayPv);
			model.addAttribute("beforeYesterdayPv",
					beforeYesterdayPv == null ? 0 : beforeYesterdayPv);
		}
		return model;
	}

	/**
	 * 获取商场客流量的数据(平台、商场管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/fresh")
	@ResponseBody
	public Model fresh(Model model) {
		String today = TimeUtil.getDate4String(0);
		// 如果为商场管理员，则只显示当前用户所属商场的信息
		SysUser user = SessionUtil.getCurrentUser();
		if (user.getUserType().equals("2")) {
			Integer mallId = user.getMall().getId();
			Object totalPv = statMallService.uniqueResult(
					"select show_count from com_mall where id = ? ", mallId);
			Object todayPv = statMallService
					.uniqueResult(
							"select count(1) from com_show_mall where date(time) = ? and mall_id = ?",
							today, mallId);
			model.addAttribute("totalPv", totalPv == null ? 0 : totalPv);
			model.addAttribute("todayPv", todayPv == null ? 0 : todayPv);
		} else {
			Object totalPv = statMallService
					.uniqueResult("select sum(show_count) from com_mall");
			Object todayPv = statMallService.uniqueResult(
					"select count(1) from com_show_mall where date(time) = ?",
					today);
			model.addAttribute("totalPv", totalPv == null ? 0 : totalPv);
			model.addAttribute("todayPv", todayPv == null ? 0 : todayPv);
		}
		return model;
	}

	/**
	 * 获取商场客流量的趋势图(平台、商场管理员角色)
	 * 
	 * @param model
	 * @param startDate
	 *            开始日期,格式:yyyyMMdd
	 * @param endDate
	 *            结束日期,格式:yyyyMMdd
	 * @return
	 */
	@RequestMapping(value = "/chart")
	@ResponseBody
	public Model chart(Model model, String startDate, String endDate) {
		if (startDate == null || endDate == null) {
			startDate = TimeUtil.getDate4String(-7);
			endDate = TimeUtil.getDate4String(-1);
		}
		List list = null;
		// 如果为商场管理员，则只显示当前用户所属商场的信息
		SysUser user = SessionUtil.getCurrentUser();
		if (user.getUserType().equals("2")) {
			Integer mallId = user.getMall().getId();
			list = statMallService
					.findBySql(
							"select date, pv from com_stat_mall where mall_id = ? and date >= ? and date <= ? order by date",
							mallId, startDate, endDate);

		} else {
			list = statMallService
					.findBySql(
							"select date, sum(pv) pv from com_stat_mall where date >= ? and date <= ? group by date order by date",
							startDate, endDate);
		}
		Map<String, Object[]> map = new HashMap<String, Object[]>();
		for (Object obj : list) {
			Object[] oo = (Object[]) obj;
			map.put((String) oo[0].toString(), oo);
		}
		JSONArray jsa = new JSONArray();
		Calendar cdr = Calendar.getInstance();
		Date i = TimeUtil.str2Date(startDate, "yyyyMMdd");
		Date j = TimeUtil.str2Date(endDate, "yyyyMMdd");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		model.addAttribute("startDate", sdf.format(i));
		for (cdr.setTime(i); i.compareTo(j) <= 0; i = cdr.getTime()) {
			String date = sdf.format(i);
			if (map.containsKey(date)) {
				jsa.add(map.get(date));
			} else {
				jsa.add(new Object[] { date, 0 });
			}
			cdr.add(Calendar.DAY_OF_MONTH, 1);
		}
		model.addAttribute("endDate", sdf.format(j));
		model.addAttribute("pv", jsa);
		return model;
	}
}
