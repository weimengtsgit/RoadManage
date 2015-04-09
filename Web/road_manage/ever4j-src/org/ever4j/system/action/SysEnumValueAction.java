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

import org.ever4j.system.entity.SysEnumValue;
import org.ever4j.system.service.SysEnumValueService;
import org.ever4j.utils.SessionUtil;

@Controller
@RequestMapping("/system/sysEnumValue")
public class SysEnumValueAction extends BaseAction{
	
	@Resource
	private SysEnumValueService sysEnumValueService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysEnumValue> pageData = new PageData<SysEnumValue>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysEnumValueService.find(pageData);

		return new ModelMap(pageData);
	}

	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		PageData<SysEnumValue> pageData = new PageData<SysEnumValue>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		model.addAttribute(pageData);
		return SessionUtil.getViewPath("/system/sysEnumValue/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
		PageData<SysEnumValue> pageData = new PageData<SysEnumValue>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysEnumValueService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	



	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysEnumValue> pageData = new PageData<SysEnumValue>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysEnumValueService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysEnumValue> lookupJson(HttpServletRequest request){
		PageData<SysEnumValue> pageData = new PageData<SysEnumValue>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysEnumValueService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysEnumValue/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model,Integer pid){
		model.addAttribute("pid", pid);
		return SessionUtil.getViewPath("/system/sysEnumValue/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysEnumValue sysEnumValue = sysEnumValueService.find(Integer.parseInt(id));
		model.addAttribute(sysEnumValue);
		return SessionUtil.getViewPath("/system/sysEnumValue/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysEnumValue sysEnumValue = sysEnumValueService.find(Integer.parseInt(id));
		model.addAttribute(sysEnumValue);
		return SessionUtil.getViewPath("/system/sysEnumValue/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysEnumValue viewJson(Model model, String id) {
		SysEnumValue sysEnumValue = sysEnumValueService.find(Integer.parseInt(id));
		model.addAttribute(sysEnumValue);
		return sysEnumValue;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysEnumValue
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysEnumValue sysEnumValue){
		// 初始化
		returnCommand(model, request);
		SysEnumValue curEnumValue = sysEnumValueService.findSibListByKey(sysEnumValue);
		
		if (sysEnumValue.isNew()){
			if(sysEnumValueService.findSibFlagByKey(curEnumValue)){
				model.addAttribute("code", "300");
				model.addAttribute("type", "warning");
				model.addAttribute("message", "代号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			
			sysEnumValueService.save(sysEnumValue);
		} else{
			if(sysEnumValueService.findSibFlagByKey(curEnumValue, sysEnumValue)){
				model.addAttribute("code", "300");
				model.addAttribute("type", "warning");
				model.addAttribute("message", "代号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			
			sysEnumValueService.getBaseDao().getSession().merge(sysEnumValue);
		}
		sysEnumValueService.getBaseDao().getSession().flush();
		sysEnumValueService.updateEnumValueToEnumMap();
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
	public String delete(HttpServletRequest request, Model model, String ids){
		// 初始化
		returnCommand(model, request);
		delete(sysEnumValueService, "SysEnumValue", ids, false);
		sysEnumValueService.updateEnumValueToEnumMap();
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
			sysEnumValueService.delete(Integer.parseInt(id));
		}
		sysEnumValueService.updateEnumValueToEnumMap();
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
}
