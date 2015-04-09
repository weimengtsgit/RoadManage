package com.dearcom.queue.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.queue.entity.QueueConfigShop;
import  com.dearcom.queue.service.QueueConfigShopService;

@Controller
@RequestMapping("/queue/queueConfigShop")
public class QueueConfigShopAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	
	@Resource
	private QueueConfigShopService queueConfigShopService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/queue/queueConfigShop/listPage");
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
		//setLogicDelete(request,logicDelete);
		// 根据用户类型 只显示自己相关的数据
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_shop.id", user.getShop().getId().toString());
		}
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		PageData<QueueConfigShop> pageData = new PageData<QueueConfigShop>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = queueConfigShopService.find(pageData);

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
		return SessionUtil.getViewPath("/queue/queueConfigShop/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		QueueConfigShop queueConfigShop = queueConfigShopService.find(Integer.parseInt(id));
		model.addAttribute(queueConfigShop);
		return SessionUtil.getViewPath("/queue/queueConfigShop/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		QueueConfigShop queueConfigShop = queueConfigShopService.find(Integer.parseInt(id));
		model.addAttribute(queueConfigShop);
		return SessionUtil.getViewPath("/queue/queueConfigShop/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param QueueConfigShop
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, QueueConfigShop queueConfigShop){
		// 初始化
		returnCommand(model, request);
		if (queueConfigShop.isNew()){
			queueConfigShopService.save(queueConfigShop);
		} else{
			queueConfigShopService.update(queueConfigShop);
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
		delete(queueConfigShopService, "QueueConfigShop", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置isCall
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setIsCall")
	public String setIsCall(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		QueueConfigShop queueConfigShop = queueConfigShopService.find(Integer.parseInt(id));
		queueConfigShop.setIsCall(new Byte(value));
		queueConfigShopService.update(queueConfigShop);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/**
	 * 快速设置callType
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setCallType")
	public String setCallType(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		QueueConfigShop queueConfigShop = queueConfigShopService.find(Integer.parseInt(id));
		queueConfigShop.setCallType(new Byte(value));
		queueConfigShopService.update(queueConfigShop);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/** 
	 * 快速设置status  状态： 0:正常 1:暂停排号 2:终止排号
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setStatus")
	public String setStatus(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		QueueConfigShop queueConfigShop = queueConfigShopService.find(Integer.parseInt(id));
		queueConfigShop.setStatus(new Byte(value));
		queueConfigShopService.update(queueConfigShop);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/queue/queueConfigShop/importExcel");
		request.setAttribute("navTabId", "queue_queueConfigShop_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, queueConfigShopService, new QueueConfigShop());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(queueConfigShopService, request, response, excelName, sheetName, title);
	}
	
}
