package org.ever4j.system.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
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
import com.dearcom.customer.entity.Customer;
import com.dearcom.mall.entity.ShopPromotion;

import org.ever4j.system.entity.SysMenu;
import org.ever4j.system.entity.SysUser;
import org.ever4j.system.pojo.OderChildMenu;
import org.ever4j.system.pojo.OderMenu;
import org.ever4j.system.service.SysMenuService;
import org.ever4j.utils.SessionUtil;

@Controller
@RequestMapping("/system/sysMenu")
public class SysMenuAction extends BaseAction{
	
	@Resource
	private SysMenuService sysMenuService;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysMenu> pageData = new PageData<SysMenu>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysMenuService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/system/sysMenu/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model){
		PageData<SysMenu> pageData = new PageData<SysMenu>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysMenuService.find(pageData);
		return this.toPageModel(model, pageData);
	}
	
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysMenu> pageData = new PageData<SysMenu>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysMenuService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysMenu> lookupJson(HttpServletRequest request){
//		PageData<SysMenu> pageData = new PageData<SysMenu>();
//		//给pageData设置参数
//		WebUtils.setPageDataParameter(request, pageData);
//		pageData = sysMenuService.find(pageData);
		return sysMenuService.findHqlList("select new map(sm.id as id ,sm.menuDesc as menuDesc) from SysMenu sm ");
//		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return SessionUtil.getViewPath("/system/sysMenu/advancedSearch");
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/system/sysMenu/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysMenu sysMenu = sysMenuService.find(Integer.parseInt(id));
		model.addAttribute(sysMenu);
		return SessionUtil.getViewPath("/system/sysMenu/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysMenu sysMenu = sysMenuService.find(Integer.parseInt(id));
		model.addAttribute(sysMenu);
		return SessionUtil.getViewPath("/system/sysMenu/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysMenu viewJson(Model model, String id) {
		SysMenu sysMenu = sysMenuService.find(Integer.parseInt(id));
		model.addAttribute(sysMenu);
		return sysMenu;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysMenu
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysMenu sysMenu){
		// 初始化
		returnCommand(model, request);
		sysMenuService.grantedAuthority(sysMenu);
		if(sysMenu.getParentId()!=null && sysMenu.getParentId().getId()==null){
			sysMenu.setParentId(null);
		}
		if (sysMenu.isNew()){
			sysMenuService.save(sysMenu);
		} else{
			sysMenuService.update(sysMenu);
		}
		
		model.addAttribute("message", "保存成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
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
		delete(sysMenuService, "SysMenu", ids, false);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
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
			sysMenuService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 菜单树
	 */
	@RequestMapping(value = "/treelist")
	public String treeList(HttpServletRequest request){
		return SessionUtil.getViewPath("/system/sysMenu/treelist");
	}
	
	/**
	 * 菜单树
	 */
	@RequestMapping(value = "/addTree")
	@ResponseBody
	public String addTee(String nodeDesc, String nodeSeq, String parentNodeId){
		
		SysMenu parentMenu = null;
		if(!"-1".equals(parentNodeId)){
			parentMenu = sysMenuService.find(Integer.parseInt(parentNodeId));
		}//在<功能菜单>下添加parentId为null的菜单
		
		SysMenu sysMenu = new SysMenu();
		sysMenu.setMenuDesc(nodeDesc);
		sysMenu.setMenuSeq(Integer.parseInt(nodeSeq));
		sysMenu.setMenuType("1");//菜单
		sysMenu.setEnabled("1");//可用
		sysMenu.setParentId(parentMenu);
		
		sysMenuService.save(sysMenu);
		Integer curId = sysMenu.getId();
		return ""+curId;
	}
	
	/**
	 * 菜单树
	 */
	@RequestMapping(value = "/editTree")
	@ResponseBody
	public String editTree(String nodeId, String nodeDesc){
		SysMenu targetMenu = sysMenuService.find(Integer.parseInt(nodeId));
		targetMenu.setMenuDesc(nodeDesc);
		
		sysMenuService.update(targetMenu);
		return "";
	}
	
	/**
	 * 菜单树
	 */
	@RequestMapping(value = "/deleteTree")
	@ResponseBody
	public String deleteTree(String nodeId){
		sysMenuService.delete(Integer.parseInt(nodeId));
		return "";
	}
	
	/**
	 * 菜单树
	 */
	@RequestMapping(value = "/orderTree")
	@ResponseBody
	public String orderTree(String data){
		ObjectMapper mapper = new ObjectMapper();
		OderMenu oderMenu = null;
		try {
			oderMenu = mapper.readValue(data, OderMenu.class);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		if(oderMenu != null){
			Integer parentId = oderMenu.getParentId();
			Integer moveId = oderMenu.getMoveId();

			SysMenu parentMenu = sysMenuService.find(parentId);
			
			List<OderChildMenu> oderChildMenus  = oderMenu.getChildrens();
			if(oderChildMenus != null && oderChildMenus.size() > 0){
				for (OderChildMenu oderChildMenu : oderChildMenus) {
					if(oderChildMenu != null){
						Integer curNodeId = oderChildMenu.getNodeId();
						SysMenu curMenu = sysMenuService.find(curNodeId);
						if(moveId.intValue() == curNodeId.intValue()){//被移动的菜单
							curMenu.setParentId(parentMenu);
						}

						curMenu.setMenuSeq(oderChildMenu.getNodeSeq());
						sysMenuService.update(curMenu);
					}
				}
			}
		}
		return "";
	}
	
	/**
	 * 菜单树
	 */
	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTreeList(){
		List<SysMenu> sysMenu = new ArrayList<SysMenu>();
//		sysMenu = sysMenuService.findAll();
		// 只查询当前用户角色拥有的菜单
		SysUser user = SessionUtil.getCurrentUser();
		sysMenu = sysMenuService.menuListOrderSeq("3",user);
		JSONArray lstTree = new JSONArray();  
		for(SysMenu sm : sysMenu){
			int pid = (sm.getParentId()==null)?-1:sm.getParentId().getId();
			JSONObject jo = new JSONObject();
			jo.put("id", sm.getId());
			jo.put("pId", pid);
			jo.put("name", sm.getMenuDesc());
			jo.put("seq",sm.getMenuSeq()==null?0:sm.getMenuSeq().intValue());
			jo.put("type",sm.getMenuType());
			jo.put("open",  (sm.getParentId()==null||sm.getParentId().getId().intValue()==-1)?true:false);
			if("1".equals(sm.getMenuType())){//目录，设为父节点
				jo.put("isParent", true);
			}else{//链接、按钮禁止成为父节点
				jo.put("dropInner", false);
			}
			
			jo.put("dropRoot", false);
			lstTree.add(jo);
		}
		JSONObject jo = new JSONObject();
		jo.put("id", -1);
		jo.put("name", "功能菜单");
		jo.put("open",  true);
		jo.put("type","1");//与目录的type相同-->显示添加按钮
		jo.put("drag",  false);//父节点禁止移动
		jo.put("childOuter",  false);//禁止子节点移走
		lstTree.add(jo);
		
		return lstTree.toJSONString();
	}
	
	/**
	 * 快速设置
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setEnabled")
	public String setEnabled(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		SysMenu menu = sysMenuService.find(Integer.parseInt(id));
		menu.setEnabled(value);
		sysMenuService.update(menu);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	/**
	 * 快速设置
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setVisible")
	public String setVisible(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		SysMenu menu = sysMenuService.find(Integer.parseInt(id));
		menu.setVisible(value);
		sysMenuService.update(menu);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
}
