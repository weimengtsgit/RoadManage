package com.dearcom.customer.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.customer.entity.Terminal;
import  com.dearcom.customer.service.TerminalService;

@Controller
@RequestMapping("/customer/terminal")
public class TerminalAction extends BaseAction{
	
	@Resource
	private TerminalService terminalService;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<Terminal> pageData = new PageData<Terminal>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = terminalService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<Terminal> pageData = new PageData<Terminal>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = terminalService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/customer/terminal/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model){
		PageData<Terminal> pageData = new PageData<Terminal>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = terminalService.find(pageData);
		
		return this.toPageModel(model, pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<Terminal> pageData = new PageData<Terminal>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = terminalService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<Terminal> lookupJson(HttpServletRequest request){
		PageData<Terminal> pageData = new PageData<Terminal>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = terminalService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/customer/terminal/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/customer/terminal/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Terminal terminal = terminalService.find(Integer.parseInt(id));
		model.addAttribute(terminal);
		return "/customer/terminal/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id,String termMac) {
		if(StringUtils.isNotBlank(id)){
			Terminal terminal = terminalService.find(Integer.parseInt(id));
			model.addAttribute(terminal);
		}else{
			Terminal terminal = terminalService.find("mac", termMac);
			model.addAttribute(terminal);
		}
		return SessionUtil.getViewPath("/customer/terminal/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public Terminal viewJson(Model model, String id) {
		Terminal terminal = terminalService.find(Integer.parseInt(id));
		model.addAttribute(terminal);
		return terminal;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Terminal
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Terminal terminal){
		// 初始化
		returnCommand(model, request);
		if (terminal.isNew()){
			terminalService.save(terminal);
		} else{
			terminalService.update(terminal);
		}
		
		model.addAttribute("message", "保存成功");
		return "/commons/ajaxDone";
	}

	/**
	 * 删除单条记录
	 * @param request
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		terminalService.delete(Integer.parseInt(id));
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 批量删除记录
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delAll")
	public String delAll(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		for(String id : ids.split(",")){
			terminalService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 逻辑删除(单条删除)
	 */
	@RequestMapping(value = "/delete4x")
	public String delete4x(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		
		terminalService.batchExecute("update Terminal set visible = ? where id = ?",false, Integer.parseInt(id));
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 逻辑删除(批量删除)
	 */
	@RequestMapping(value = "/delAll4x")
	public String delAll4x(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		if(ids != null && ids.length() > 0){
			String[] idArray = ids.split(",");
			for (String idStr : idArray) {
				terminalService.batchExecute("update Terminal  set visible = ? where id = ?", false, Integer.parseInt(idStr));
			}
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
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
		Terminal terminal = terminalService.find(Integer.parseInt(id));
		terminal.setType(Byte.parseByte(value));
		terminalService.update(terminal);
		model.addAttribute("message", "设置成功");
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
		Terminal terminal = terminalService.find(Integer.parseInt(id));
		terminal.setStatus(Byte.parseByte(value));
		terminalService.update(terminal);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setRegType")
	public String setRegType(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Terminal terminal = terminalService.find(Integer.parseInt(id));
		terminal.setRegType(Byte.parseByte(value));
		terminalService.update(terminal);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/terminal/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/terminal/importExcel");
		request.setAttribute("navTabId", "customer_terminal_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, terminalService, new Terminal());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(terminalService, request, response, excelName, sheetName, title);
	}
	
}
