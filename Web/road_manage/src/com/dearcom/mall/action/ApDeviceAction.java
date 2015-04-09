package com.dearcom.mall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.mall.entity.ApDevice;
import  com.dearcom.mall.service.ApDeviceService;

@Controller
@RequestMapping("/mall/apDevice")
public class ApDeviceAction extends BaseAction{
	// 是否逻辑删除
	private boolean logicDelete = true;
	
	@Resource
	private ApDeviceService apDeviceService;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<ApDevice> pageData = new PageData<ApDevice>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = apDeviceService.find(pageData);

		return new ModelMap(pageData);
	}
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/mall/apDevice/listPage");
	}
	
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model){
		// 设置逻辑删除条件
		setLogicDelete(request,logicDelete);
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		PageData<ApDevice> pageData = new PageData<ApDevice>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = apDeviceService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<ApDevice> pageData = new PageData<ApDevice>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = apDeviceService.find(pageData);
		
		return new ModelMap(pageData);
	}

	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<ApDevice> pageData = new PageData<ApDevice>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = apDeviceService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<ApDevice> lookupJson(HttpServletRequest request){
		PageData<ApDevice> pageData = new PageData<ApDevice>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = apDeviceService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/mall/apDevice/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/mall/apDevice/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		ApDevice apDevice = apDeviceService.find(Integer.parseInt(id));
		model.addAttribute(apDevice);
		return SessionUtil.getViewPath("/mall/apDevice/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		ApDevice apDevice = apDeviceService.find(Integer.parseInt(id));
		model.addAttribute(apDevice);
		return SessionUtil.getViewPath("/mall/apDevice/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public ApDevice viewJson(Model model, String id) {
		ApDevice apDevice = apDeviceService.find(Integer.parseInt(id));
		model.addAttribute(apDevice);
		return apDevice;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param ApDevice
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, ApDevice apDevice){
		// 初始化
		returnCommand(model, request);
		if (apDevice.isNew()){
			apDeviceService.save(apDevice);
		} else{
			apDeviceService.update(apDevice);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}


	
	/**
	 * 删除
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String ids){
		// 初始化
		returnCommand(model, request);
		delete(apDeviceService, "ApDevice", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setStatus")
	public String setStatus(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		ApDevice apDevice = apDeviceService.find(Integer.parseInt(id));
		apDevice.setStatus(Byte.parseByte(value));
		apDeviceService.update(apDevice);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/apDevice/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/apDevice/importExcel");
		request.setAttribute("navTabId", "mall_apDevice_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, apDeviceService, new ApDevice());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(apDeviceService, request, response, excelName, sheetName, title);
	}
	
}
