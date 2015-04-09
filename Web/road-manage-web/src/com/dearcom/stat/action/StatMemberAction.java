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
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.dearcom.customer.service.CustomerService;

@Controller
@RequestMapping("/stat/statMember")
public class StatMemberAction extends BaseAction {

	@Resource
	private CustomerService customerService;

	/**
	 * 显示会员统计页面(平台管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statMember/view");
	}

	/**
	 * 初始化会员统计的数据(平台、商铺管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/init")
	@ResponseBody
	public Model init(Model model) {
		String today = TimeUtil.getDate4String(0);
		String yesterday = TimeUtil.getDate4String(-1);
		Object total = customerService.uniqueResult(
				"select count(1) from com_customer where is_del = ? ", 0);

		Object todayIncrease = customerService
				.uniqueResult(
						"select count(1) from com_customer where date(create_time) = ? and is_del = ? ",
						today, 0);
		Object yesterdayIncrease = customerService
				.uniqueResult(
						"select count(1) from com_customer where date(create_time) = ? and is_del = ? ",
						yesterday, 0);
		model.addAttribute("total", total == null ? 0 : total);
		model.addAttribute("today", todayIncrease == null ? 0 : todayIncrease);
		model.addAttribute("yesterday", yesterdayIncrease == null ? 0
				: yesterdayIncrease);
		return model;
	}

	/**
	 * 获取会员的统计数据(平台管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/fresh")
	@ResponseBody
	public Model fresh(Model model) {
		String today = TimeUtil.getDate4String(0);
		Object total = customerService.uniqueResult(
				"select count(1) from com_customer where is_del = ? ", 0);

		Object todayIncrease = customerService
				.uniqueResult(
						"select count(1) from com_customer where date(create_time) = ? and is_del = ? ",
						today, 0);
		model.addAttribute("total", total == null ? 0 : total);
		model.addAttribute("today", todayIncrease == null ? 0 : todayIncrease);
		return model;
	}

	/**
	 * 获取会员统计的趋势图(平台管理员角色)
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
		List list = customerService
				.findBySql(
						"select date(create_time) date, count(1) increase from com_customer where date(create_time) >= ? and date(create_time) <= ? group by date(create_time) order by date",
						startDate, endDate);
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
		model.addAttribute("member", jsa);
		return model;
	}
}
