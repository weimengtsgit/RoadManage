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
import com.dearcom.stat.service.StatQueueCardService;

@Controller
@RequestMapping("/stat/statQueueCard")
public class StatQueueCardAction extends BaseAction {

	@Resource
	private StatQueueCardService statQueueCardService;

	/**
	 * 显示排队的统计页面(商铺管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statQueueCard/view");
	}

	/**
	 * 初始化排队的统计数据(商铺管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/init")
	@ResponseBody
	public Model init(Model model) {
		String today = TimeUtil.getDate4String(0);
		String yesterday = TimeUtil.getDate4String(-1);
		SysUser user = SessionUtil.getCurrentUser();
		Integer shopId = user.getShop().getId();
		Object todayReceived = statQueueCardService
				.uniqueResult(
						"select count(1) from com_queue_card where shop_id = ? and date(start_time) = ? ",
						shopId, today);
		Object todayUsed = statQueueCardService
				.uniqueResult(
						"select count(1) from com_queue_card where shop_id = ? and date(start_time) = ? and status = ? ",
						shopId, today, 1);
		Object yesterdayReceived = statQueueCardService
				.uniqueResult(
						"select count(1) from com_queue_card where shop_id = ? and date(start_time) = ? ",
						shopId, yesterday);
		Object yesterdayUsed = statQueueCardService
				.uniqueResult(
						"select count(1) from com_queue_card where shop_id = ? and date(start_time) = ? and status = ? ",
						shopId, yesterday, 1);
		model.addAttribute("todayReceived", todayReceived == null ? 0
				: todayReceived);
		model.addAttribute("todayUsed", todayUsed == null ? 0 : todayUsed);
		model.addAttribute("yesterdayReceived", yesterdayReceived == null ? 0
				: yesterdayReceived);
		model.addAttribute("yesterdayUsed", yesterdayUsed == null ? 0
				: yesterdayUsed);
		return model;
	}

	/**
	 * 获取排队的统计数据(商铺管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/fresh")
	@ResponseBody
	public Model fresh(Model model) {
		String today = TimeUtil.getDate4String(0);
		SysUser user = SessionUtil.getCurrentUser();
		Integer shopId = user.getShop().getId();
		Object todayReceived = statQueueCardService
				.uniqueResult(
						"select count(1) from com_queue_card where shop_id = ? and date(start_time) = ? ",
						shopId, today);
		Object todayUsed = statQueueCardService
				.uniqueResult(
						"select count(1) from com_queue_card where shop_id = ? and date(start_time) = ? and status = ? ",
						shopId, today, 1);
		model.addAttribute("todayReceived", todayReceived == null ? 0
				: todayReceived);
		model.addAttribute("todayUsed", todayUsed == null ? 0 : todayUsed);
		return model;
	}

	/**
	 * 获取商铺排队统计的趋势图(商铺管理员角色)
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
		SysUser user = SessionUtil.getCurrentUser();
		Integer shopId = user.getShop().getId();
		List list = statQueueCardService
				.findBySql(
						"select date(start_time) date, count(1) used from com_queue_card where shop_id = ? and date(start_time) >= ? and date(start_time) <= ? and status = ? group by date(start_time) order by date(start_time)",
						shopId, startDate, endDate, 1);
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
		model.addAttribute("chart", jsa);
		return model;
	}
}
