package com.dearcom.stat.action;

import java.util.List;

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

import com.dearcom.mall.entity.MallPromotion;
import com.dearcom.mall.service.MallPromotionService;

@Controller
@RequestMapping("/stat/statMallProm")
public class StatMallPromAction extends BaseAction {

	@Resource
	private MallPromotionService mallPromotionService;

	/**
	 * 显示商场活动统计页面(平台管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/view")
	public String view(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statMallProm/view");
	}

	/**
	 * 获取商场活动的统计数据(平台管理员角色)
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/fresh")
	@ResponseBody
	public Model fresh(Model model) {
		String today = TimeUtil.getDate4String(0);
		Object totalPv = mallPromotionService
				.uniqueResult("select sum(show_count) from com_mall_promotion");

		Object todayPv = mallPromotionService
				.uniqueResult(
						"select count(1) from com_show_mall_prom where date(time) = ? ",
						today);

		model.addAttribute("totalPv", totalPv);
		model.addAttribute("todayPv", todayPv);
		return model;
	}

	/**
	 * 显示商场活动的统计列表(商场管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request, Model model) {
		return SessionUtil.getViewPath("/stat/statMallProm/listPage");
	}

	/**
	 * 获取商场活动的统计数据(商场管理员角色)
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model) {
		SysUser user = SessionUtil.getCurrentUser();
		request.setAttribute("filter_EQI_mall.id", user.getMall().getId()
				.toString());
		PageData<MallPromotion> pageData = new PageData<MallPromotion>();
		// 给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mallPromotionService.find(pageData);
		List<MallPromotion> list = pageData.getResult();
		if (list != null && list.size() > 0) {
			String today = TimeUtil.getDate4String(0);
			String yesterday = TimeUtil.getDate4String(-1);
			for (MallPromotion mp : list) {
				Object todayPv = mallPromotionService
						.uniqueResult(
								"select count(1) from com_show_mall_prom where date(time) = ? and mall_prom_id = ? ",
								today, mp.getId());
				Object yesterdayPv = mallPromotionService
						.uniqueResult(
								"select browsed from com_stat_mall_prom where date = ? and mall_prom_id = ? ",
								yesterday, mp.getId());
				mp.setTodayPv(todayPv == null ? 0 : ((Number) todayPv)
						.intValue());
				mp.setYesterdayPv(yesterdayPv == null ? 0
						: ((Number) yesterdayPv).intValue());
				if (mp.getYesterdayPv() != 0) {
					mp.setUp((mp.getTodayPv() - mp.getYesterdayPv())
							/ mp.getYesterdayPv());
				}
			}
		}
		return this.toPageModel(model, pageData);
	}
}
