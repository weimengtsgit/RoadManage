package com.dearcom.queue.action;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysEnumValue;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.dearcom.customer.entity.Message;
import com.dearcom.mall.entity.Shop;
import com.dearcom.mall.service.ShopService;
import com.dearcom.queue.entity.QueueCard;
import com.dearcom.queue.entity.QueueConfigShop;
import com.dearcom.queue.entity.QueueInfo;
import com.dearcom.queue.service.QueueCardService;
import com.dearcom.queue.service.QueueConfigShopService;

@Controller
@RequestMapping("/queue/queueCard")
public class QueueCardAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	
	@Resource
	private QueueCardService queueCardService;
	@Resource
	private QueueConfigShopService queueConfigShopService;
	@Resource
	private ShopService shopService;
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model,String s,String t){
		model.addAttribute("s",s);
		model.addAttribute("t",t);
		return SessionUtil.getViewPath("/queue/queueCard/listPage");
	}
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/cardPage")
	public String cardPage(HttpServletRequest request,Model model,Integer shopId){
		// 定义排号卡列表
		List<QueueConfigShop> cards = null;
		// 当前商铺
		SysUser curUser = SessionUtil.getCurrentUser();

		// 当前用户所属商铺
		if(curUser.getShop()!=null){
			shopId = curUser.getShop().getId();
		}
		if(shopId==null){
			
			return SessionUtil.getViewPath("/queue/queueCard/cardPage");
		}
		
		cards = queueConfigShopService.findHqlList("from QueueConfigShop as q where q.shop.id=? order by q.type ", shopId);
		List<QueueInfo> list = new ArrayList<QueueInfo>();
		
		String shopName = "所属商户";
		Shop curShop = shopService.find(shopId);
		if(curShop!=null){
			shopName = curShop.getName();
		}
		for (int i = 0; i < cards.size(); i++) {
			QueueInfo info = new QueueInfo();
			QueueConfigShop config = cards.get(i);
			// 商铺排号卡类型
			info.setCardType(SessionUtil.getEnumValue("queue_card_type", config.getType().toString()));
			info.setConfigShop(config);
			info.setNext(null);
			info.setWaitCount(10);
			info.setWaitTime(20);
			
			// 等待人数
			BigInteger waitCount = (BigInteger) queueCardService.uniqueResult("select count(1) from com_queue_card as card where card.shop_id=? and card.card_type=? and card.status=0", config.getShop().getId(),config.getType());
			info.setWaitCount(waitCount.intValue());
			// 等待时间
			Integer waitTime = config.getInterval()*waitCount.intValue();
			info.setWaitTime(waitTime);
			// 下一位
			QueueCard card = queueCardService.getCardByIndex(1,config.getShop().getId(),config.getType());
			info.setNext(card);
			
			
			list.add(info);
		}
		
		model.addAttribute("shopName", shopName);
		model.addAttribute("shopId", shopId);
		model.addAttribute("infos", list);
		
		return SessionUtil.getViewPath("/queue/queueCard/cardPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
				
		// 设置逻辑删除条件
		setLogicDelete(request,logicDelete);
		
		PageData<QueueCard> pageData = new PageData<QueueCard>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = queueCardService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/queue/queueCard/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		QueueCard queueCard = queueCardService.find(Integer.parseInt(id));
		model.addAttribute(queueCard);
		return SessionUtil.getViewPath("/queue/queueCard/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		QueueCard queueCard = queueCardService.find(Integer.parseInt(id));
		model.addAttribute(queueCard);
		return SessionUtil.getViewPath("/queue/queueCard/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param QueueCard
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, QueueCard queueCard){
		// 初始化
		returnCommand(model, request);
		if (queueCard.isNew()){
			queueCardService.save(queueCard);
		} else{
			queueCardService.update(queueCard);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 删除记录
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String ids){
		// 初始化
		returnCommand(model, request);
		delete(queueCardService, "QueueCard", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 快速设置status   0：未使用 1：已使用（已完成） 2:已作废
	 * @param model
	 * @param id 
	 * @return
	 */
	@RequestMapping(value = "/setStatus")
	public String setStatus(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		QueueCard card = queueCardService.find(Integer.parseInt(id));
		card.setStatus(Byte.parseByte(value));
		card.setEndTime(new Date());
		queueCardService.update(card);
		
		// 提醒
		queueCardService.call(card.getShop().getId(),card.getCardType());
		
		model.addAttribute("message", "操作成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/queue/queueCard/importExcel");
		request.setAttribute("navTabId", "queue_queueCard_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, queueCardService, new QueueCard());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(queueCardService, request, response, excelName, sheetName, title);
	}
	
}
