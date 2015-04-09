package org.ever4j.main.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.base4j.orm.hibernate.BaseAction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.ever4j.main.service.MainService;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.pojo.MainMenuPojo;
import org.ever4j.utils.SessionUtil;

@Controller
@RequestMapping("/sys/main")
public class MainAction extends BaseAction{
	
	@Resource
	private MainService mainService;
	
	@RequestMapping(value = "/index")
	public String index(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		Object userObj = session.getAttribute("curUser");
		
		if(userObj != null){
			SysUser curUser = (SysUser)userObj;
			
			List<MainMenuPojo> userOwnMenuList = mainService.findMenuInfo(curUser);
			session.setAttribute("menus", userOwnMenuList);
			
			List<MainMenuPojo> navMenus = mainService.findNavMenu(userOwnMenuList);
			session.setAttribute("navMenus", navMenus);
			
		}
		SessionUtil.setViewResolverPrefix("");
		return SessionUtil.getViewPath("/index");
	}
	@RequestMapping(value = "/index4m")
	public String index4m(Model model, HttpServletRequest request){
		HttpSession session = request.getSession();
		Object userObj = session.getAttribute("curUser");
		
		if(userObj != null){
			SysUser curUser = (SysUser)userObj;
			
			List<MainMenuPojo> userOwnMenuList = mainService.findMenuInfo(curUser);
			session.setAttribute("menus", userOwnMenuList);
			
			List<MainMenuPojo> navMenus = mainService.findNavMenu(userOwnMenuList);
			session.setAttribute("navMenus", navMenus);
			
		}
		SessionUtil.setViewResolverPrefix("../jsp4m");
		return SessionUtil.getViewPath("/index");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getNav")
	public String getNav(Model model,HttpServletRequest request){
		
		return SessionUtil.getViewPath("/nav");
	}
}
