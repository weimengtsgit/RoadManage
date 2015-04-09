package org.ever4j.system.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.ever4j.system.entity.SysMenu;
import org.ever4j.system.entity.SysMenuRole;
import org.ever4j.system.entity.SysRole;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.service.SysMenuRoleService;
import org.ever4j.system.service.SysMenuService;
import org.ever4j.system.service.SysRoleService;
import org.ever4j.utils.SessionUtil;

@Controller
@RequestMapping("/system/sysRole")
public class SysRoleAction extends BaseAction{
	// 是否逻辑删除
	private boolean logicDelete = true;
	
	@Resource
	private SysRoleService sysRoleService;
	
	@Resource
	private SysMenuService sysMenuService;
	
	@Resource
	private SysMenuRoleService sysMenuRoleService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysRole> pageData = new PageData<SysRole>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示角色类型为商铺管理员的  且创建人为自己或公共角色
			request.setAttribute("filter_EQS_roleType", "3");
			request.setAttribute("filter_EQI_insertUser.id_OR_EQS_common", user.getId().toString()+"_OR_1");
			
		}else if(user.getUserType().equals("2")){
			// 商场管理员 则只显示角色类型为商铺管理员和商场管理员的角色
			request.setAttribute("filter_INS_roleType", "2,3");
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysRoleService.find(pageData);

		return new ModelMap(pageData);
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
				
		PageData<SysRole> pageData = new PageData<SysRole>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示角色类型为商铺管理员的  且创建人为自己或公共角色
			request.setAttribute("filter_EQS_roleType", "3");
			request.setAttribute("filter_EQI_insertUser.id_OR_EQS_common", user.getId().toString()+"_OR_1");
			
		}else if(user.getUserType().equals("2")){
			// 商场管理员 则只显示角色类型为商铺管理员和商场管理员的角色
			request.setAttribute("filter_INS_roleType", "2,3");
			request.setAttribute("filter_EQI_insertUser.id_OR_EQS_common", user.getId().toString()+"_OR_1");
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysRoleService.find(pageData);
		
		return this.toPageModel(model, pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/system/sysRole/listPage");
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysRole> pageData = new PageData<SysRole>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示角色类型为商铺管理员的  且创建人为自己或公共角色
			request.setAttribute("filter_EQS_roleType", "3");
			request.setAttribute("filter_EQI_insertUser.id_OR_EQS_common", user.getId().toString()+"_OR_1");
			
		}else if(user.getUserType().equals("2")){
			// 商场管理员 则只显示角色类型为商铺管理员和商场管理员的角色
			request.setAttribute("filter_INS_roleType", "2,3");
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysRoleService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysRole> lookupJson(HttpServletRequest request){
		PageData<SysRole> pageData = new PageData<SysRole>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示角色类型为商铺管理员的  且创建人为自己或公共角色
			request.setAttribute("filter_EQS_roleType", "3");
			request.setAttribute("filter_EQI_insertUser.id_OR_EQS_common", user.getId().toString()+"_OR_1");
			
		}else if(user.getUserType().equals("2")){
			// 商场管理员 则只显示角色类型为商铺管理员和商场管理员的角色
			request.setAttribute("filter_INS_roleType", "2,3");
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysRoleService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysRole/advancedSearch";
	}

	/**
	 * 角色菜单树
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getMenuTree")
	@ResponseBody
	public String getMenuTree(Model model,Integer roleId){
		List<SysMenuRole> smrList = sysMenuRoleService.findList("roleId", roleId);
		List<SysMenu> sysMenu = new ArrayList<SysMenu>();
//		sysMenu = sysMenuService.findAll();
		// 只查询当前用户角色拥有的菜单
		SysUser user = SessionUtil.getCurrentUser();
		sysMenu = sysMenuService.menuListOrderSeq(null,user);
		JSONArray lstTree = new JSONArray();  
		for(SysMenu sm : sysMenu){
			int pid = (sm.getParentId()==null)?-1:sm.getParentId().getId();
			JSONObject jo = new JSONObject();
			jo.put("id", sm.getId());
			jo.put("pId", pid);
			jo.put("name", sm.getMenuDesc());
			jo.put("open",  (sm.getParentId()==null||sm.getParentId().getId().intValue()==-1)?true:false);
			if(hasThisMenu(sm.getId(),smrList)){
				jo.put("checked", true);
			}
			lstTree.add(jo);
		}
		JSONObject jo = new JSONObject();
		jo.put("id", -1);
		jo.put("name", "功能菜单");
		jo.put("open",  true);
		lstTree.add(jo);
		
		return lstTree.toJSONString();
	}
	
	/**
	 * 帮助文档菜单树的生成
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getMenuTreeForHelpDoc")
	@ResponseBody
	public String getMenuTreeForHelpDoc(Model model,HttpServletRequest request){
		List<SysMenu> sysMenu = new ArrayList<SysMenu>();
		sysMenu = sysMenuService.findHqlList("from SysMenu sm where sm.menuType != ?", "3");
		JSONArray lstTree = new JSONArray();  
		JSONObject jo = new JSONObject();
		jo.put("id", 0);
		jo.put("name", "首页");
		jo.put("open",  true);
		jo.put("url", request.getContextPath()+"/helpdoc/helpDoc/editHelpDoc?sysMenuId=0");
		jo.put("target", "helpdocIframeId");
		lstTree.add(jo);
		for(SysMenu sm : sysMenu){
			int pid = (sm.getParentId()==null)?-1:sm.getParentId().getId();
			jo = new JSONObject();
			jo.put("id", sm.getId());
			jo.put("pId", pid);
			jo.put("name", sm.getMenuDesc());
			jo.put("open",  (sm.getParentId()==null||sm.getParentId().getId().intValue()==-1)?true:false);
			if(sm.getMenuName() != null && !sm.getMenuName().equals("")){
				jo.put("url", request.getContextPath()+"/helpdoc/helpDoc/editHelpDoc?sysMenuId=" + sm.getId());
				jo.put("target", "helpdocIframeId");
			}
			lstTree.add(jo);
		}
		
		
		return lstTree.toJSONString();
	}
	/**
	 * 帮助文档菜单树的生成
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getMenuTreeForViewHelpDoc")
	@ResponseBody
	public String getMenuTreeForViewHelpDoc(Model model,HttpSession session,HttpServletRequest request){
		SysUser sysUser = ((SysUser)session.getAttribute("curUser"));
		Integer roleId = sysUser.getUserRole().getId();
		List<SysMenuRole> smrList = sysMenuRoleService.findList("roleId", roleId);
		List<SysMenu> sysMenu = new ArrayList<SysMenu>();
		sysMenu = sysMenuService.findHqlList("from SysMenu sm where sm.menuType != ?", "3");
		JSONArray lstTree = new JSONArray();  
		JSONObject jo = new JSONObject();
		jo.put("id", 0);
		jo.put("name", "首页");
		jo.put("open",  true);
		jo.put("url", request.getContextPath()+"/helpdoc/helpDoc/viewHelpDoc?id=0");
		jo.put("target", "helpdocIframeId");
		lstTree.add(jo);
		for(int i=0;i<sysMenu.size();i++){
			SysMenu sm = sysMenu.get(i);
			if("1".equals(sysUser.getUserType()) || hasThisMenu(sm.getId(),smrList)){
				int pid = (sm.getParentId()==null)?-1:sm.getParentId().getId();
				jo = new JSONObject();
				jo.put("id", sm.getId());
				jo.put("pId", pid);
				jo.put("name", sm.getMenuDesc());
				jo.put("open",  (sm.getParentId()==null||sm.getParentId().getId().intValue()==-1)?true:false);
				if(sm.getMenuName() != null && !sm.getMenuName().equals("")){
					jo.put("url", request.getContextPath()+"/helpdoc/helpDoc/viewHelpDoc?id=" + sm.getId());
					jo.put("target", "helpdocIframeId");
				}else{
					//System.out.println(sm.getId());
				}
				
				lstTree.add(jo);
			}
		}
		
		return lstTree.toJSONString();
	}
	
	private boolean hasThisMenu(Integer id, List<SysMenuRole> smrList) {
		
		boolean flag = false;
		if(smrList!=null && smrList.size()>0 && id!=null){
			for (int i = 0; i < smrList.size(); i++) {
				SysMenuRole mmp = smrList.get(i);
				if(mmp.getMenuId().intValue()==id.intValue()){
					flag = true;
					break;
				}
			}
		}
		return flag;
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/system/sysRole/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysRole sysRole = sysRoleService.find(Integer.parseInt(id));
		model.addAttribute(sysRole);
		return SessionUtil.getViewPath("/system/sysRole/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysRole sysRole = sysRoleService.find(Integer.parseInt(id));
		model.addAttribute(sysRole);
		return SessionUtil.getViewPath("/system/sysRole/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysRole viewJson(Model model, String id) {
		SysRole sysRole = sysRoleService.find(Integer.parseInt(id));
		model.addAttribute(sysRole);
		return sysRole;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysRole
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysRole sysRole,String ids){
		// 初始化
		returnCommand(model, request);
		
		String curRoleName = sysRole.getRoleName();
		SysRole curSysRole = sysRoleService.find("roleName", curRoleName);
		
		String curRoleDesc = sysRole.getRoleDesc();
		SysRole curSysRole1 = sysRoleService.find("roleDesc", curRoleDesc);
		
		if (sysRole.isNew()){
			if(curSysRole != null){
				model.addAttribute("code", "300");
				model.addAttribute("message", "角色名称已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			if(curSysRole1 != null){
				model.addAttribute("code", "300");
				model.addAttribute("message", "角色描述已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			// 创建人
			SysUser createUser = SessionUtil.getCurrentUser();
			sysRole.setInsertUser(createUser);
			// 是否公共角色 超级管理员和商场管理员创建的为公共角色
			if(createUser.getUserType().equals("3")){
				sysRole.setCommon("0");
			}else{
				sysRole.setCommon("1");
			}
			sysRoleService.save(sysRole);
			
			// 设置权限
			if(StringUtils.isNotBlank(ids)){
				String[] idsArray = ids.split(",");
				SysMenuRole smr;
				for (int i = 0; i < idsArray.length; i++) {
					if(StringUtils.isNotBlank(idsArray[i])){
						smr = new SysMenuRole();
						smr.setRoleId(sysRole.getId());
						smr.setMenuId(new Integer(idsArray[i]));
						sysMenuRoleService.save(smr);
					}
				}
			}
		} else{
			if(curSysRole != null && curSysRole.getId().intValue() != sysRole.getId().intValue()){
				model.addAttribute("code", "300");
				model.addAttribute("message", "角色名称已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			if(curSysRole1 != null && curSysRole1.getId().intValue() != sysRole.getId().intValue()){
				model.addAttribute("code", "300");
				model.addAttribute("message", "角色描述已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			
			sysRoleService.getBaseDao().getSession().clear();
			sysRoleService.update(sysRole);
			
			// 设置权限
			if(StringUtils.isNotBlank(ids)){
				sysMenuRoleService.batchExecute("delete from SysMenuRole s where s.roleId = ?", sysRole.getId());
				
				String[] idsArray = ids.split(",");
				SysMenuRole smr;
				for (int i = 0; i < idsArray.length; i++) {
					if(StringUtils.isNotBlank(idsArray[i]) && !idsArray[i].equals("-1")){
						smr = new SysMenuRole();
						smr.setRoleId(sysRole.getId());
						smr.setMenuId(new Integer(idsArray[i]));
						sysMenuRoleService.save(smr);
					}
				}
			}
		}
		
		model.addAttribute("message", "保存成功");
		return "/commons/ajaxDone";
	}

//	/**
//	 * 删除单条记录
//	 * @param request
//	 * @param model
//	 * @param id
//	 * @return
//	 */
//	@RequestMapping(value = "/delete")
//	public String delete(HttpServletRequest request, Model model, String id){
//		// 初始化
//		returnCommand(model, request);
//		sysRoleService.delete(Integer.parseInt(id));
//		sysRoleService.deleteRoleMessage(Integer.parseInt(id));
//		model.addAttribute("message", "删除成功");
//		return "/commons/ajaxDone";
//	}
	/**
	 * 删除
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public String delete(HttpServletRequest request, Model model, String ids){
		// 初始化
		returnCommand(model, request);
		delete(sysRoleService, "SysRole", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
//	/**
//	 * 批量删除记录
//	 * @param request
//	 * @param model
//	 * @param ids
//	 * @return
//	 */
//	@RequestMapping(value = "/delAll")
//	public String delAll(HttpServletRequest request, Model model,String ids){
//		// 初始化
//		returnCommand(model, request);
//		for(String id : ids.split(",")){
//			sysRoleService.delete(Integer.parseInt(id));
//			sysRoleService.deleteRoleMessage(Integer.parseInt(id));
//		}
//		model.addAttribute("message", "删除成功");
//		return "/commons/ajaxDone";
//	}
}
