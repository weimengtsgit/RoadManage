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

import org.ever4j.system.entity.SysMenuRole;
import  org.ever4j.system.service.SysMenuRoleService;

@Controller
@RequestMapping("/system/sysMenuRole")
public class SysMenuRoleAction extends BaseAction{
	
	@Resource
	private SysMenuRoleService sysMenuRoleService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysMenuRole> pageData = new PageData<SysMenuRole>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysMenuRoleService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysMenuRole> pageData = new PageData<SysMenuRole>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysMenuRoleService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysMenuRole> lookupJson(HttpServletRequest request){
		PageData<SysMenuRole> pageData = new PageData<SysMenuRole>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysMenuRoleService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysMenuRole/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/system/sysMenuRole/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysMenuRole sysMenuRole = sysMenuRoleService.find(Integer.parseInt(id));
		model.addAttribute(sysMenuRole);
		return "/system/sysMenuRole/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysMenuRole sysMenuRole = sysMenuRoleService.find(Integer.parseInt(id));
		model.addAttribute(sysMenuRole);
		return "/system/sysMenuRole/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysMenuRole viewJson(Model model, String id) {
		SysMenuRole sysMenuRole = sysMenuRoleService.find(Integer.parseInt(id));
		model.addAttribute(sysMenuRole);
		return sysMenuRole;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysMenuRole
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysMenuRole sysMenuRole){
		// 初始化
		returnCommand(model, request);
		if (sysMenuRole.isNew()){
			sysMenuRoleService.save(sysMenuRole);
		} else{
			sysMenuRoleService.update(sysMenuRole);
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
		sysMenuRoleService.delete(Integer.parseInt(id));
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
			sysMenuRoleService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
}
