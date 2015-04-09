package org.ever4j.helpdoc.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.ever4j.helpdoc.entity.HelpDoc;
import  org.ever4j.helpdoc.service.HelpDocService;
import org.ever4j.system.entity.SysMenu;

@Controller
@RequestMapping("/helpdoc/helpDoc")
public class HelpDocAction extends BaseAction{
	
	@Resource
	private HelpDocService helpDocService;;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<HelpDoc> pageData = new PageData<HelpDoc>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = helpDocService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<HelpDoc> pageData = new PageData<HelpDoc>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = helpDocService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<HelpDoc> pageData = new PageData<HelpDoc>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = helpDocService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<HelpDoc> lookupJson(HttpServletRequest request){
		PageData<HelpDoc> pageData = new PageData<HelpDoc>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = helpDocService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/helpdoc/helpDoc/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/helpdoc/helpDoc/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		HelpDoc helpDoc = helpDocService.find(Integer.parseInt(id));
		model.addAttribute(helpDoc);
		return "/helpdoc/helpDoc/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		HelpDoc helpDoc = helpDocService.find(Integer.parseInt(id));
		model.addAttribute(helpDoc);
		return "/helpdoc/helpDoc/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public HelpDoc viewJson(Model model, String id) {
		HelpDoc helpDoc = helpDocService.find(Integer.parseInt(id));
		model.addAttribute(helpDoc);
		return helpDoc;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param HelpDoc
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, HelpDoc helpDoc){
		if( helpDoc.getSysMenu()==null || helpDoc.getSysMenu().getId()==null || helpDoc.getSysMenu().getId().intValue()==0){
			helpDoc.setSysMenu(null);
		}
		// 初始化
		returnCommand(model, request);
		if (helpDoc.isNew()){
			helpDocService.save(helpDoc);
		} else{
			helpDocService.update(helpDoc);
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
		helpDocService.delete(Integer.parseInt(id));
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
			helpDocService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}

	@RequestMapping(value = "/helpDocMain")
	public String helpdocTreeListMain(Model model){
		return "/helpdoc/helpDoc/helpMain";
	}
	
	@RequestMapping(value = "/viewHelpDocMain")
	public String viewHelpDocMain(Model model,String id){
		model.addAttribute("id", id);
		return "/helpdoc/helpDoc/viewHelpDocMain";
	}
	
	@RequestMapping(value = "/helpdocTreeList")
	public String helpdocTreeList(Model model){
		return "/helpdoc/helpDoc/helpdocTreeList";
	}
	
	@RequestMapping(value = "/helpdocViewTree")
	public String helpdocView(Model model){
		return "/helpdoc/helpDoc/helpdocViewTree";
	}
	
	/**
	 * viewMenuHelpDoc
	 */
	@RequestMapping(value = "/viewHelpDoc")
	public String viewMenuHelpDoc(Model model, String id){
		HelpDoc helpDoc = null;
		//通过菜单的id,查询出其帮助文档记录
		if(StringUtils.isBlank(id) || id.equals("0")){
			helpDoc = helpDocService.findHql("from HelpDoc where sysMenu.id is null");
		}else{
			helpDoc = helpDocService.findHql("from HelpDoc where sysMenu.id = ?", Integer.parseInt(id));
			if(helpDoc == null){
				helpDoc = new HelpDoc();
				helpDoc.setDocContent("<div style='text-align:center;margin-top:100px;'><span style='font-size:24px; '>暂时没有该模块的帮助文档，请选择其他模块  :)</span></div>");
			}
		}
		model.addAttribute(helpDoc);
		return "/helpdoc/helpDoc/viewTreeHelpdoc";
	}
	/**
	 * viewMenuHelpDoc
	 */
	@RequestMapping(value = "/editHelpDoc")
	public String editMenuHelpDoc(Model model, Integer sysMenuId){
		HelpDoc helpDoc = null;
		if(sysMenuId.intValue()==0){
			
			 helpDoc = helpDocService.findHql("from HelpDoc hc where hc.sysMenu.id is null");
		}else{
			
			 helpDoc = helpDocService.findHql("from HelpDoc hc where hc.sysMenu.id = ?", sysMenuId);
		}
		if(null==helpDoc){
			helpDoc = new HelpDoc();
			SysMenu sm = new SysMenu();
			sm.setId(sysMenuId);
			helpDoc.setSysMenu(sm);
		}	
		model.addAttribute("helpDoc",helpDoc);
		return "/helpdoc/helpDoc/editTreeHelpdoc";
	}
	
}
