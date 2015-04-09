package org.ever4j.system.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysLog;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.service.SysLogService;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/system/sysLog")
public class SysLogAction extends BaseAction{
	
	@Resource
	private SysLogService sysLogService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysLog> pageData = new PageData<SysLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysLogService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/system/sysLog/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model){
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_logUser.shop.id", user.getShop().getId().toString());
		}	
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_logUser.mall.id", user.getMall().getId().toString());
		}
		PageData<SysLog> pageData = new PageData<SysLog>();
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysLogService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysLog> pageData = new PageData<SysLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysLogService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysLog> lookupJson(HttpServletRequest request){
		PageData<SysLog> pageData = new PageData<SysLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysLogService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysLog/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/system/sysLog/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysLog sysLog = sysLogService.find(Integer.parseInt(id));
		model.addAttribute(sysLog);
		return "/system/sysLog/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysLog sysLog = sysLogService.find(Integer.parseInt(id));
		model.addAttribute(sysLog);
		return SessionUtil.getViewPath("/system/sysLog/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysLog viewJson(Model model, String id) {
		SysLog sysLog = sysLogService.find(Integer.parseInt(id));
		model.addAttribute(sysLog);
		return sysLog;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysLog
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysLog sysLog){
		// 初始化
		returnCommand(model, request);
		if (sysLog.isNew()){
			sysLogService.save(sysLog);
		} else{
			sysLogService.update(sysLog);
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
		sysLogService.delete(Integer.parseInt(id));
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
			sysLogService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
}
