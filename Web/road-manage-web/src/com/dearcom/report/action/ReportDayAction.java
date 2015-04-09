package com.dearcom.report.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.dearcom.report.entity.ReportDay;
import  com.dearcom.report.service.ReportDayService;

@Controller
@RequestMapping("/report/reportDay")
public class ReportDayAction extends BaseAction{
	
	@Resource
	private ReportDayService reportDayService;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<ReportDay> pageData = new PageData<ReportDay>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportDayService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<ReportDay> pageData = new PageData<ReportDay>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportDayService.find(pageData);

		return new ModelMap(pageData);
	}
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/report/reportDay/listPage");
	}
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
		PageData<ReportDay> pageData = new PageData<ReportDay>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportDayService.find(pageData);
		model.addAttribute(pageData);
		model.addAttribute("iTotalRecords", pageData.getPagination().getTotalCount());
		model.addAttribute("iTotalDisplayRecords",  pageData.getPagination().getTotalCount());
		return model;
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<ReportDay> pageData = new PageData<ReportDay>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportDayService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<ReportDay> lookupJson(HttpServletRequest request){
		PageData<ReportDay> pageData = new PageData<ReportDay>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportDayService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/report/reportDay/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/report/reportDay/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		ReportDay reportDay = reportDayService.find(Integer.parseInt(id));
		model.addAttribute(reportDay);
		return "/report/reportDay/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		ReportDay reportDay = reportDayService.find(Integer.parseInt(id));
		model.addAttribute(reportDay);
		return "/report/reportDay/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public ReportDay viewJson(Model model, String id) {
		ReportDay reportDay = reportDayService.find(Integer.parseInt(id));
		model.addAttribute(reportDay);
		return reportDay;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param ReportDay
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, ReportDay reportDay){
		// 初始化
		returnCommand(model, request);
		if (reportDay.isNew()){
			reportDayService.save(reportDay);
		} else{
			reportDayService.update(reportDay);
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
		reportDayService.delete(Integer.parseInt(id));
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
			reportDayService.delete(Integer.parseInt(id));
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
		
		reportDayService.batchExecute("update ReportDay set visible = ? where id = ?",false, Integer.parseInt(id));
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
				reportDayService.batchExecute("update ReportDay  set visible = ? where id = ?", false, Integer.parseInt(idStr));
			}
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/report/reportDay/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/report/reportDay/importExcel");
		request.setAttribute("navTabId", "report_reportDay_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, reportDayService, new ReportDay());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(reportDayService, request, response, excelName, sheetName, title);
	}
	
}
