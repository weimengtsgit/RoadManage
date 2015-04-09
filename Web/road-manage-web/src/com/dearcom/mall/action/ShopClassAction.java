package com.dearcom.mall.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
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

import com.dearcom.mall.entity.ShopClass;
import  com.dearcom.mall.service.ShopClassService;

@Controller
@RequestMapping("/mall/shopClass")
public class ShopClassAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	
	@Resource
	private ShopClassService shopClassService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/mall/shopClass/listPage");
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
		
		PageData<ShopClass> pageData = new PageData<ShopClass>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = shopClassService.find(pageData);

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
		return SessionUtil.getViewPath("/mall/shopClass/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		ShopClass shopClass = shopClassService.find(Integer.parseInt(id));
		model.addAttribute(shopClass);
		return SessionUtil.getViewPath("/mall/shopClass/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		ShopClass shopClass = shopClassService.find(Integer.parseInt(id));
		model.addAttribute(shopClass);
		return SessionUtil.getViewPath("/mall/shopClass/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param ShopClass
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, ShopClass shopClass){
		// 初始化
		returnCommand(model, request);
		if(shopClass.getParentType()!=null && shopClass.getParentType().getId()==null){
			shopClass.setParentType(null);
		}
		if (shopClass.isNew()){
			shopClassService.save(shopClass);
		} else{
			shopClassService.update(shopClass);
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
		delete(shopClassService, "ShopClass", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置level
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setLevel")
	public String setLevel(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		ShopClass shopClass = shopClassService.find(Integer.parseInt(id));
		shopClass.setLevel(Integer.parseInt(value));
		shopClassService.update(shopClass);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/mall/shopClass/importExcel");
		request.setAttribute("navTabId", "mall_shopClass_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, shopClassService, new ShopClass());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(shopClassService, request, response, excelName, sheetName, title);
	}
	
}
