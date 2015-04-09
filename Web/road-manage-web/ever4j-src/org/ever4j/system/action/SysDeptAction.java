package org.ever4j.system.action;

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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.ever4j.system.entity.SysDept;
import  org.ever4j.system.service.SysDeptService;

@Controller
@RequestMapping("/system/sysDept")
public class SysDeptAction extends BaseAction{
	
	@Resource
	private SysDeptService sysDeptService;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<SysDept> pageData = new PageData<SysDept>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysDeptService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<SysDept> pageData = new PageData<SysDept>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysDeptService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<SysDept> lookupJson(HttpServletRequest request){
		PageData<SysDept> pageData = new PageData<SysDept>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = sysDeptService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/system/sysDept/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/system/sysDept/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		SysDept sysDept = sysDeptService.find(Integer.parseInt(id));
		model.addAttribute(sysDept);
		return "/system/sysDept/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		SysDept sysDept = sysDeptService.find(Integer.parseInt(id));
		model.addAttribute(sysDept);
		return "/system/sysDept/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public SysDept viewJson(Model model, String id) {
		SysDept sysDept = sysDeptService.find(Integer.parseInt(id));
		model.addAttribute(sysDept);
		return sysDept;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysDept
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, SysDept sysDept){
		// 初始化
		returnCommand(model, request);
		
		String deptNum = sysDept.getDeptNum();
		SysDept curSysDept = sysDeptService.find("deptNum", deptNum);
		
		if (sysDept.isNew()){
			if(curSysDept != null){
				model.addAttribute("code", "300");
				model.addAttribute("message", "部门编号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			
			sysDeptService.save(sysDept);
		} else{
			if(curSysDept != null && curSysDept.getId().intValue() != sysDept.getId().intValue()){
				model.addAttribute("code", "300");
				model.addAttribute("message", "部门编号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			sysDeptService.getBaseDao().getSession().clear();
//			sysDeptService.getBaseDao().getSession().merge(sysDept);
			sysDeptService.update(sysDept);
		}
		
		model.addAttribute("message", "保存成功");
		return "/commons/ajaxDone";
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
		delete(sysDeptService, "SysDept", ids,false);
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
			sysDeptService.deleteDeptMessage(Integer.parseInt(id));
			sysDeptService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 查询部门树状结构
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/treeEdit")
	public String tree(Model model) {
		
		return "/system/sysDept/treeEdit";
	}
	
	/**
	 * 部门树
	 */
	@RequestMapping(value = "/getTree")
	@ResponseBody
	public String getTreeList(){
		List<SysDept> sysDepts = new ArrayList<SysDept>();
		sysDepts = sysDeptService.findAll();
		JSONArray listTree = new JSONArray();  
		for(SysDept sysDept : sysDepts){
			int pid = (sysDept.getParentId()==null)?-1:sysDept.getParentId().getId();
			JSONObject jo = new JSONObject();
			jo.put("id", sysDept.getId());
			jo.put("pId", pid);
			jo.put("name", sysDept.getDeptName());
			jo.put("deptNum", sysDept.getDeptNum());
			jo.put("deptAddr", sysDept.getDeptAddr() == null ? "" : sysDept.getDeptAddr());
			jo.put("deptDesc", sysDept.getDeptDesc() == null ? "" : sysDept.getDeptDesc());
			jo.put("open",  (sysDept.getParentId()==null||sysDept.getParentId().getId().intValue()==-1)?true:false);
			
			jo.put("dropRoot", false);
			listTree.add(jo);
		}
		JSONObject jo = new JSONObject();
		jo.put("id", -1);
		jo.put("name", "组织架构");
		jo.put("open",  true);
		jo.put("drag",  false);//父节点禁止移动
		jo.put("childOuter",  false);//禁止子节点移走
		listTree.add(jo);
		
		return listTree.toJSONString();
	}
	
	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param SysDept
	 * @return
	 */
	@RequestMapping(value = "/treeSave", method = RequestMethod.POST)
	public String treeSave(HttpServletRequest request, Model model, SysDept sysDept){
		// 初始化
		returnCommand(model, request);
		
		String deptNum = sysDept.getDeptNum();
		SysDept curSysDept = sysDeptService.find("deptNum", deptNum);
		
		if (sysDept.isNew()){
			if(curSysDept != null){
				model.addAttribute("code", "300");
				model.addAttribute("message", "部门编号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			sysDeptService.save(sysDept);
		} else{
			if(curSysDept != null && curSysDept.getId().intValue() != sysDept.getId().intValue()){
				model.addAttribute("code", "300");
				model.addAttribute("message", "部门编号已存在，请重新输入！");
				return "/commons/ajaxDone";
			}
			sysDeptService.getBaseDao().getSession().clear();
			sysDeptService.update(sysDept);
		}
		
		model.addAttribute("navTabId", sysDept.getParentId() == null ? "-1" : sysDept.getParentId().getId().toString());
		model.addAttribute("message", "保存成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 菜单树
	 */
	@RequestMapping(value = "/treeDelete")
	@ResponseBody
	public String deleteTree(HttpServletRequest request, Model model, String nodeId){
		sysDeptService.deleteDeptMessage(Integer.parseInt(nodeId));
		sysDeptService.delete(Integer.parseInt(nodeId));
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
}
