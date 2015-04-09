package com.dearcom.customer.action;

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

import com.dearcom.customer.entity.Mcard;
import  com.dearcom.customer.service.McardService;

@Controller
@RequestMapping("/customer/mcard")
public class McardAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = true;
	
	@Resource
	private McardService mcardService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/customer/mcard/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
		PageData<Mcard> pageData = new PageData<Mcard>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mcardService.find(pageData);

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
		return SessionUtil.getViewPath("/customer/mcard/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Mcard mcard = mcardService.find(Integer.parseInt(id));
		model.addAttribute(mcard);
		return SessionUtil.getViewPath("/customer/mcard/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Mcard mcard = mcardService.find(Integer.parseInt(id));
		model.addAttribute(mcard);
		return SessionUtil.getViewPath("/customer/mcard/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Mcard
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Mcard mcard){
		// 初始化
		returnCommand(model, request);
		if (mcard.isNew()){
			mcardService.save(mcard);
		} else{
			mcardService.update(mcard);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

	/**
	 * 删除单条记录
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String ids){
		// 初始化
		returnCommand(model, request);
		delete(mcardService, "Mcard", ids, logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setType")
	public String setType(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Mcard mcard = mcardService.find(Integer.parseInt(id));
		mcard.setType(Byte.parseByte(value));
		mcardService.update(mcard);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/mcard/importExcel");
		request.setAttribute("navTabId", "customer_mcard_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, mcardService, new Mcard());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(mcardService, request, response, excelName, sheetName, title);
	}
	
}
