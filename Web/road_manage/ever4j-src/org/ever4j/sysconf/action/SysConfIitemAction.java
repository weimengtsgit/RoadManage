package org.ever4j.sysconf.action;

import java.util.ArrayList;
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

import org.ever4j.main.constant.Constant;
import org.ever4j.sysconf.entity.SysConfIitem;
import org.ever4j.sysconf.entity.SysConfType;
import org.ever4j.sysconf.service.SysConfIitemService;
import org.ever4j.sysconf.service.SysConfTypeService;
import org.ever4j.system.entity.SysEnumValue;
import org.ever4j.utils.ApplicationUtils;
import org.ever4j.utils.SessionUtil;

@Controller
@RequestMapping("/sysconf/sysConfIitem")
public class SysConfIitemAction extends BaseAction{
	
	@Resource
	private SysConfIitemService sysConfIitemService;;
	@Resource
	private SysConfTypeService sysConfTypeService;;
	
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<SysConfIitem> pageData = new PageData<SysConfIitem>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysConfIitemService.find(pageData);

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
		return SessionUtil.getViewPath("/sysconf/sysConfIitem/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
		PageData<SysConfIitem> pageData = new PageData<SysConfIitem>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysConfIitemService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	

	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysConfIitem> pageData = new PageData<SysConfIitem>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysConfIitemService.find(pageData);

		return new ModelMap(pageData);
	}
	/**
	 * 设置配置项
	 * @param request
	 * @return
	 */
	@RequestMapping("/config")
	public ModelMap config(HttpServletRequest request,Integer confTypeId){
		SysConfType sysConfType = sysConfTypeService.find("id", confTypeId);
		
		List<SysConfIitem> list = sysConfIitemService.findList("confType.id", confTypeId);
		ModelMap modelMap = new ModelMap("list",list);
		modelMap.addAttribute("confTypeId", confTypeId);
		modelMap.addAttribute("confTypeKey", sysConfType.getConfKey());
		
		return modelMap;
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysConfIitem> pageData = new PageData<SysConfIitem>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysConfIitemService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysConfIitem> lookupJson(HttpServletRequest request){
		PageData<SysConfIitem> pageData = new PageData<SysConfIitem>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysConfIitemService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/sysconf/sysConfIitem/advancedSearch";
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
		return SessionUtil.getViewPath("/sysconf/sysConfIitem/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysConfIitem sysConfIitem = sysConfIitemService.find(Integer.parseInt(id));
		model.addAttribute(sysConfIitem);
		return SessionUtil.getViewPath("/sysconf/sysConfIitem/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysConfIitem sysConfIitem = sysConfIitemService.find(Integer.parseInt(id));
		model.addAttribute(sysConfIitem);
		return SessionUtil.getViewPath("/sysconf/sysConfIitem/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysConfIitem viewJson(Model model, String id) {
		SysConfIitem sysConfIitem = sysConfIitemService.find(Integer.parseInt(id));
		model.addAttribute(sysConfIitem);
		return sysConfIitem;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysConfIitem
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysConfIitem sysConfIitem){
		// 初始化
		returnCommand(model, request);
		if(sysConfIitem.getEnumType()!=null && sysConfIitem.getEnumType().getId()==null){
			sysConfIitem.setEnumType(null);
		}
		if (sysConfIitem.isNew()){
			sysConfIitemService.save(sysConfIitem);
		} else{
			sysConfIitemService.update(sysConfIitem);
		}
		//查询配置所在的类型configtype
		SysConfType sysConfType = sysConfTypeService.find("id", sysConfIitem.getConfType().getId());
		//更新itemMap
		Constant.configMap.put(sysConfType.getConfKey()+ "_" + sysConfIitem.getItemKey(), sysConfIitem.getItemValue());
//		System.out.println("----------------更新后:conf.itemMap = " + Constant.configMap);
		ApplicationUtils.setAttribute(sysConfType.getConfKey()+ "_" + sysConfIitem.getItemKey(), sysConfIitem.getItemValue());
		/*//更新typeMap
		List<SysConfIitem> lists = Constant.configItemsWithTypeMap.get(sysConfIitem.getId().toString());
		lists.add(sysConfIitem);
		Constant.configItemsWithTypeMap.put(sysConfIitem.getId().toString(), lists);*/
		
		model.addAttribute("message", "保存成功");
		return "/commons/ajaxDone";
	}
	/**
	 * 保存配置项
	 * @param request
	 * @param model
	 * @param SysConfIitem
	 * @return
	 */
	@RequestMapping(value = "/saveConfig", method = RequestMethod.POST)
	public String saveConfig(HttpServletRequest request, Model model, SysConfType sysConfType){
		// 初始化
		returnCommand(model, request);
		//得到configtype对象
		SysConfType sysConfType2 = sysConfTypeService.find("id", sysConfType.getId()); 
		List<SysConfIitem> list = sysConfType.getList();
		for (int i = 0; i < list.size(); i++) {
			SysConfIitem item = sysConfIitemService.find(list.get(i).getId());
			item.setItemValue(list.get(i).getItemValue());
			sysConfIitemService.update(item);
			//更新map
			Constant.configMap.put(sysConfType2.getConfKey()+"_"+item.getItemKey(), item.getItemValue());
			ApplicationUtils.setAttribute(sysConfType2.getConfKey()+"_"+item.getItemKey(), item.getItemValue());
			
			Constant.configItemsWithTypeMap.put(sysConfType2.getConfKey(), list);
		}
//		System.out.println("-------------------更新后：conf.itemMap"+Constant.configMap);
//		System.out.println("-------------------更新后：conf.TypeMap"+Constant.configItemsWithTypeMap);
		
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
		SysConfIitem sysConfIitem = sysConfIitemService.find("id", new Integer(ids));
		//删除map中的值
		Constant.configMap.remove(sysConfIitem.getItemKey()+"_"+sysConfIitem.getConfType().getId());
		List<SysConfIitem> lists = Constant.configItemsWithTypeMap.get(sysConfIitem.getConfType().getId().toString());
		if(lists!=null){
			
			lists.remove(sysConfIitem);
		}
		Constant.configItemsWithTypeMap.put(sysConfIitem.getConfType().toString(), lists);
		// 初始化
		returnCommand(model, request);
		sysConfIitemService.delete(Integer.parseInt(ids));
		System.out.println("---------+++++++---------conf.map = " + Constant.configMap);
		ApplicationUtils.removeAttribute(sysConfIitem.getItemKey()+"_"+sysConfIitem.getConfType().getId());
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
			SysConfIitem sysConfIitem = sysConfIitemService.find("id", new Integer(id));
			//删除map中的值
			Constant.configMap.remove(sysConfIitem.getItemKey()+"_"+sysConfIitem.getConfType().getId());
			sysConfIitemService.delete(Integer.parseInt(id));
		}
		System.out.println("---------+++++++---------conf.map = " + Constant.configMap);
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	//循环标签的值
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setValueType")
	public String setValueType(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		SysConfIitem sysConfIitem = sysConfIitemService.find(Integer.parseInt(id));
		sysConfIitem.setValueType(value);
		sysConfIitemService.update(sysConfIitem);
		model.addAttribute("message", "设置成功");
		return "/commons/ajaxDone";
	} 
	
	public static void main(String[] args) {
		SysConfIitem s1 = new SysConfIitem();
		s1.setId(1);
		s1.setItemKey("a1");
		SysConfIitem s2 = new SysConfIitem();
		s2.setId(2);
		s2.setItemKey("a2");
		SysConfIitem s3 = new SysConfIitem();
		s3.setId(2);
		s3.setItemKey("a2");
		List<SysConfIitem> list = new ArrayList<SysConfIitem>();
		list.add(s1);
		list.add(s2);
		System.out.println(list);
		list.remove(s3);
		System.out.println(list);
	}
}
