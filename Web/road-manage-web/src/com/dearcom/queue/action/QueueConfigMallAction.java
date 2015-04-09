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

import com.dearcom.queue.entity.QueueConfigMall;
import  com.dearcom.queue.service.QueueConfigMallService;

@Controller
@RequestMapping("/queue/queueConfigMall")
public class QueueConfigMallAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	
	@Resource
	private QueueConfigMallService queueConfigMallService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/queue/queueConfigMall/listPage");
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
		// 根据用户类型 只显示自己相关的数据
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		PageData<QueueConfigMall> pageData = new PageData<QueueConfigMall>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = queueConfigMallService.find(pageData);

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
		return SessionUtil.getViewPath("/queue/queueConfigMall/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/config")
	public String config(Model model) {
		
		SysUser curUser = SessionUtil.getCurrentUser();
		
		QueueConfigMall queueConfigMall = queueConfigMallService.find("mall", curUser.getMall());
		if(queueConfigMall!=null)
		model.addAttribute(queueConfigMall);
		return SessionUtil.getViewPath("/queue/queueConfigMall/input");
	}
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		QueueConfigMall queueConfigMall = queueConfigMallService.find(Integer.parseInt(id));
		model.addAttribute(queueConfigMall);
		return SessionUtil.getViewPath("/queue/queueConfigMall/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		QueueConfigMall queueConfigMall = queueConfigMallService.find(Integer.parseInt(id));
		model.addAttribute(queueConfigMall);
		return SessionUtil.getViewPath("/queue/queueConfigMall/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param QueueConfigMall
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, QueueConfigMall queueConfigMall){
		// 初始化
		returnCommand(model, request);
		SysUser curUser = SessionUtil.getCurrentUser();
		if(curUser.getUserType().equals("2")){
			queueConfigMall.setMall(curUser.getMall());
		}
		if (queueConfigMall.isNew()){
			queueConfigMallService.save(queueConfigMall);
		} else{
			queueConfigMallService.update(queueConfigMall);
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
		delete(queueConfigMallService, "QueueConfigMall", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/queue/queueConfigMall/importExcel");
		request.setAttribute("navTabId", "queue_queueConfigMall_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, queueConfigMallService, new QueueConfigMall());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(queueConfigMallService, request, response, excelName, sheetName, title);
	}
	
}
