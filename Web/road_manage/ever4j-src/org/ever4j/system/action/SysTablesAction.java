package org.ever4j.system.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.ever4j.system.entity.SysTables;
import  org.ever4j.system.service.SysTablesService;
import org.ever4j.utils.SessionUtil;

@Controller
@RequestMapping("/system/sysTables")
public class SysTablesAction extends BaseAction{
	
	@Resource
	private SysTablesService sysTablesService;;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<SysTables> pageData = new PageData<SysTables>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysTablesService.find(pageData);

		return new ModelMap(pageData);
	}
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/system/sysTables/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
		PageData<SysTables> pageData = new PageData<SysTables>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysTablesService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysTables> pageData = new PageData<SysTables>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysTablesService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysTables> pageData = new PageData<SysTables>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysTablesService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysTables> lookupJson(HttpServletRequest request){
		PageData<SysTables> pageData = new PageData<SysTables>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysTablesService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysTables/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/system/sysTables/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysTables sysTables = sysTablesService.find(Integer.parseInt(id));
		model.addAttribute(sysTables);
		return "/system/sysTables/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysTables sysTables = sysTablesService.find(Integer.parseInt(id));
		model.addAttribute(sysTables);
		return "/system/sysTables/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysTables viewJson(Model model, String id) {
		SysTables sysTables = sysTablesService.find(Integer.parseInt(id));
		model.addAttribute(sysTables);
		return sysTables;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysTables
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysTables sysTables){
		// 初始化
		returnCommand(model, request);
		if (sysTables.isNew()){
			sysTablesService.save(sysTables);
		} else{
			sysTablesService.update(sysTables);
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
		sysTablesService.delete(Integer.parseInt(id));
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
			sysTablesService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 初始化列表信息
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/initSysTables")
	public String initSysTables(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		List<SysTables> tables = sysTablesService.findAllTables(sysTablesService.getBaseDao().getSession().getSessionFactory());
		sysTablesService.initSysTables(tables);
		model.addAttribute("message", "刷新成功");
		return "/commons/ajaxDone";
	}
	
	
	//循环标签的值
	
	
}
