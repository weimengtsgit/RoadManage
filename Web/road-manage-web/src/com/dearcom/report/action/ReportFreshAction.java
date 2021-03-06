package com.dearcom.report.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.report.entity.ReportFresh;
import  com.dearcom.report.service.ReportFreshService;

@Controller
@RequestMapping("/report/reportFresh")
public class ReportFreshAction extends BaseAction{
	
	@Resource
	private ReportFreshService reportFreshService;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<ReportFresh> pageData = new PageData<ReportFresh>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportFreshService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<ReportFresh> pageData = new PageData<ReportFresh>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportFreshService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<ReportFresh> pageData = new PageData<ReportFresh>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportFreshService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<ReportFresh> lookupJson(HttpServletRequest request){
		PageData<ReportFresh> pageData = new PageData<ReportFresh>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = reportFreshService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/report/reportFresh/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/report/reportFresh/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		ReportFresh reportFresh = reportFreshService.find(Integer.parseInt(id));
		model.addAttribute(reportFresh);
		return "/report/reportFresh/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		ReportFresh reportFresh = reportFreshService.find(Integer.parseInt(id));
		model.addAttribute(reportFresh);
		return "/report/reportFresh/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public ReportFresh viewJson(Model model, String id) {
		ReportFresh reportFresh = reportFreshService.find(Integer.parseInt(id));
		model.addAttribute(reportFresh);
		return reportFresh;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param ReportFresh
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, ReportFresh reportFresh){
		// 初始化
		returnCommand(model, request);
		if (reportFresh.isNew()){
			reportFreshService.save(reportFresh);
		} else{
			reportFreshService.update(reportFresh);
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
		reportFreshService.delete(Integer.parseInt(id));
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
			reportFreshService.delete(Integer.parseInt(id));
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
		
		reportFreshService.batchExecute("update ReportFresh set visible = ? where id = ?",false, Integer.parseInt(id));
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
				reportFreshService.batchExecute("update ReportFresh  set visible = ? where id = ?", false, Integer.parseInt(idStr));
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
		ReportFresh reportFresh = reportFreshService.find(Integer.parseInt(id));
		reportFresh.setType(Byte.parseByte(value));
		reportFreshService.update(reportFresh);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/report/reportFresh/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/report/reportFresh/importExcel");
		request.setAttribute("navTabId", "report_reportFresh_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, reportFreshService, new ReportFresh());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(reportFreshService, request, response, excelName, sheetName, title);
	}
	
}
