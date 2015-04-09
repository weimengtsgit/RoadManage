package com.dearcom.stat.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.dearcom.mall.entity.ShopPromotion;
import com.dearcom.mall.service.ShopPromotionService;

@Controller
@RequestMapping("/stat/statShopProm")
public class StatShopPromAction extends BaseAction {

	@Resource
	private ShopPromotionService shopPromotionService;

	/**
	 * 显示商铺优惠统计页面(商场管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statShopProm/view");
	}

	/**
	 * 获取商铺优惠的统计数据(商场管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/fresh")
	@ResponseBody
	public Model fresh(Model model) {
		String today = TimeUtil.getDate4String(0);
		SysUser user = SessionUtil.getCurrentUser();
		Integer mallId = user.getMall().getId();
		Object received = shopPromotionService
				.uniqueResult(
						"select count(1) from com_member_promotion where mall_id = ? and date(received_time) = ?",
						mallId, today);
		Object consumed = shopPromotionService
				.uniqueResult(
						"select count(1) from com_member_promotion where mall_id = ? and date(consumed_time) = ?",
						mallId, today);

		Object totalReceived = shopPromotionService.uniqueResult(
				"select count(1) from com_member_promotion where mall_id = ?",
				mallId);
		Object totalConsumed = shopPromotionService.uniqueResult(
				"select count(1) from com_member_promotion where mall_id = ?",
				mallId);
		model.addAttribute("received", received == null ? 0 : received);
		model.addAttribute("consumed", consumed == null ? 0 : consumed);
		model.addAttribute("totalReceived", totalReceived == null ? 0
				: totalReceived);
		model.addAttribute("totalConsumed", totalConsumed == null ? 0
				: totalConsumed);
		return model;
	}

	/**
	 * 显示商铺优惠的统计列表(商铺管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statShopProm/listPage");
	}

	/**
	 * 获取商铺优惠的统计数据(商铺管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model) {
		SysUser user = SessionUtil.getCurrentUser();
		request.setAttribute("filter_EQI_shop.id", user.getShop().getId()
				.toString());
		PageData<ShopPromotion> pageData = new PageData<ShopPromotion>();
		// 给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopPromotionService.find(pageData);
		List<ShopPromotion> list = pageData.getResult();
		if (list != null && list.size() > 0) {
			String today = TimeUtil.getDate4String(0);
			for (ShopPromotion sp : list) {
				Object received = shopPromotionService
						.uniqueResult(
								"select count(1) from com_member_promotion where promotion_id = ? and date(received_time) = ?",
								sp.getId(), today);
				Object consumed = shopPromotionService
						.uniqueResult(
								"select count(1) from com_member_promotion where promotion_id = ? and date(consumed_time) = ?",
								sp.getId(), today);
				sp.setTodayReceived(received == null ? 0 : ((Number) received)
						.intValue());
				sp.setTodayConsumed(consumed == null ? 0 : ((Number) consumed)
						.intValue());
			}
		}
		return this.toPageModel(model, pageData);
	}

	/**
	 * 获取商铺优惠的统计数据(商铺管理员角色)
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/freshById")
	@ResponseBody
	public Model freshById(Model model, Integer id) {
		ShopPromotion promotion = shopPromotionService.find(id);
		model.addAttribute("intro", promotion.getIntro());
		model.addAttribute("showCount", promotion.getShowCount() == null ? 0
				: promotion.getShowCount());
		model.addAttribute("received", promotion.getReceived() == null ? 0
				: promotion.getReceived());
		model.addAttribute("consumed", promotion.getConsumed() == null ? 0
				: promotion.getConsumed());
		return model;
	}

	/**
	 * 获取商铺优惠统计的趋势图(商铺管理员角色)
	 * 
	 * @param model
	 * @param id
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	@RequestMapping(value = "/chartById")
	@ResponseBody
	public Model chartById(Model model, Integer id, String startDate,
			String endDate) {
		if (startDate == null || endDate == null) {
			startDate = TimeUtil.getDate4String(-7);
			endDate = TimeUtil.getDate4String(-1);
		}
		List list = shopPromotionService
				.findBySql(
						"select date, consumed from com_stat_shop_prom where shop_prom_id = ? and date >= ? and date <= ? order by date",
						id, startDate, endDate);
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
