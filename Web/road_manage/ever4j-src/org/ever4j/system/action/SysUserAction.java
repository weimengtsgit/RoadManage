package org.ever4j.system.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.ever4j.system.entity.SysUser;
import org.ever4j.system.service.SysUserService;
import org.ever4j.utils.SessionUtil;


@Controller
@RequestMapping("/system/sysUser")
public class SysUserAction extends BaseAction{
	
	
	// 是否逻辑删除
	private boolean logicDelete = true;
	@Resource
	private SysUserService sysUserService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysUser> pageData = new PageData<SysUser>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示本商铺的用户
			request.setAttribute("filter_EQS_userType", "3");
			request.setAttribute("filter_EQI_shop.id", user.getShop().getId().toString());
			
		}else if(user.getUserType().equals("2")){
			// 商场管理员 则只显示角色类型为商铺管理员和商场管理员的角色
			request.setAttribute("filter_INS_userType", "2,3");
		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysUserService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/system/sysUser/listPage");
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
		
		PageData<SysUser> pageData = new PageData<SysUser>();
		// 根据不同的角色设置不同的查询条件
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			// 如果为商铺管理员，则只显示本商铺的用户
			request.setAttribute("filter_EQS_userType", "3");
			request.setAttribute("filter_EQI_shop.id", user.getShop().getId().toString());
			
		}else if(user.getUserType().equals("2")){
			// 商场管理员 则只显示角色类型为商铺管理员和商场管理员的角色
			request.setAttribute("filter_INS_userType", "2,3");
			request.setAttribute("filter_EQI_mall.id", user.getMall().getId().toString());
		}
		
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysUserService.find(pageData);
		
		return this.toPageModel(model, pageData);
	}
	
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysUser> pageData = new PageData<SysUser>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysUserService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysUser> lookupJson(HttpServletRequest request){
		PageData<SysUser> pageData = new PageData<SysUser>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysUserService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysUser/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/system/sysUser/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysUser sysUser = sysUserService.find(Integer.parseInt(id));
		model.addAttribute(sysUser);
		return SessionUtil.getViewPath("/system/sysUser/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysUser sysUser = sysUserService.find(Integer.parseInt(id));
		model.addAttribute(sysUser);
		return SessionUtil.getViewPath("/system/sysUser/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysUser viewJson(Model model, String id) {
		SysUser sysUser = sysUserService.find(Integer.parseInt(id));
		model.addAttribute(sysUser);
		return sysUser;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysUser
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysUser sysUser){
		// 初始化
		returnCommand(model, request);
		
		
		
		String curUserName = sysUser.getUsername();//当前b编辑的的账号
		SysUser curSysUser = sysUserService.findHql("from SysUser where username=? and isDel!=?", curUserName, true);
		if(sysUser.getPassword() != null && sysUser.getPassword().length()!=32){
			String curPasswd = new Md5PasswordEncoder().encodePassword(sysUser.getPassword(), sysUser.getUsername());
			sysUser.setPassword(curPasswd);
		}
		// 临时方案  解决shop.id为空时但shop不为空的异常情况
		if(sysUser.getShop()!=null && sysUser.getShop().getId()==null){
			sysUser.setShop(null);
		}
		SysUser curUser = SessionUtil.getCurrentUser();
		// 当前用户为商铺管理员时 创建的用户所属商铺及商场与自己相同
		if("3".equals(curUser.getUserType())){
			sysUser.setShop(curUser.getShop());
			sysUser.setMall(curUser.getMall());
		}
		// 当前用户为商场管理员时 创建的用户所属商场与自己相同
		else if("2".equals(curUser.getUserType())){
			sysUser.setMall(curUser.getMall());
		}
		
		sysUser.setIsDel(false);
		if (sysUser.isNew()){
			if(curSysUser != null){
				model.addAttribute("code", "300");
				model.addAttribute("type", "warning");
				model.addAttribute("message", "用户账号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			sysUserService.save(sysUser);
		} else{
			if(curSysUser != null && curSysUser.getId().intValue() != sysUser.getId().intValue()){
				model.addAttribute("code", "300");
				model.addAttribute("type", "warning");
				model.addAttribute("message", "用户账号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			sysUserService.getBaseDao().getSession().clear();
			sysUserService.update(sysUser);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}

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
		delete(sysUserService, "SysUser", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	
	
	/**
	 * to修改个人密码
	 */
	@RequestMapping(value = "/editInfo")
	public String updateInfo(Model model){
		return SessionUtil.getViewPath("/system/sysUser/updateInfo");
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @param model
	 * @param SysUser
	 * @return
	 */
	@RequestMapping(value = "/saveInfo", method = RequestMethod.POST)
	public String saveInfo(HttpServletRequest request, Model model, String oldpassword, String password){
		// 初始化
		returnCommand(model, request);
		SysUser curUser = SessionUtil.getCurrentUser();
		SysUser sysUser = sysUserService.findHql("from SysUser where username=? ", curUser.getUsername());
		String oldPasswodEncode = new Md5PasswordEncoder().encodePassword(oldpassword, sysUser.getUsername()); 
		if(!oldPasswodEncode.equals(sysUser.getPassword())){
			model.addAttribute("code", "300");// 适应dwz版本
			model.addAttribute("type", "warning");// 适应bootstrap版本
			model.addAttribute("message", "原密码输入有误，请重新输入！");
			return "/commons/ajaxDone";
		}else{
			String newPasswodEncode = new Md5PasswordEncoder().encodePassword(password, sysUser.getUsername());
			sysUserService.executeBySql("update sys_user set password = ? where id = ?", newPasswodEncode, sysUser.getId());
		}
		model.addAttribute("callbackType","closeCurrent");
		model.addAttribute("message", "修改密码成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
}
