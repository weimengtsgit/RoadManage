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
import com.dearcom.customer.service.CustomerRalationService;

@Controller
@RequestMapping("/stat/statShopMember")
public class StatShopMemberAction extends BaseAction {

	@Resource
	private CustomerRalationService customerRalationService;

	/**
	 * 显示会员统计页面(商铺管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statShopMember/view");
	}

	/**
	 * 获取会员的统计数据(商铺管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/fresh")
	@ResponseBody
	public Model fresh(Model model) {
		String today = TimeUtil.getDate4String(0);
		// 如果为商户管理员，则只显示当前用户所属商户的信息
		SysUser user = SessionUtil.getCurrentUser();
		Integer shopId = user.getShop().getId();
		Object total = customerRalationService
				.uniqueResult(
						"select count(1) from com_customer_relation where shop_id = ? and is_del = ? ",
						shopId, 0);

		Object todayIncrease = customerRalationService
				.uniqueResult(
						"select count(1) from com_customer_relation where date(create_time) = ? and shop_id = ? and is_del = ? ",
						today, shopId, 0);
		model.addAttribute("total", total == null ? 0 : total);
		model.addAttribute("today", todayIncrease == null ? 0 : todayIncrease);
		return model;
	}

	/**
	 * 获取会员统计的趋势图(商铺管理员角色)
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
		// 如果为商户管理员，则只显示当前用户所属商户的信息
		SysUser user = SessionUtil.getCurrentUser();
		Integer shopId = user.getShop().getId();
		List list = customerRalationService
				.findBySql(
						"select date(create_time) date, count(1) increase from com_customer_relation where shop_id = ? and date(create_time) >= ? and date(create_time) <= ? group by date(create_time) order by date",
						shopId, startDate, endDate);
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
