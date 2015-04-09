package org.ever4j.device.action;

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

import org.ever4j.device.entity.DeviceState;
import org.ever4j.device.service.DeviceStateService;

@Controller
@RequestMapping("/device/deviceState")
public class DeviceStateAction extends BaseAction{
	
	@Resource
	private DeviceStateService deviceStateService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/deviceStatelist")
	public ModelMap viewDeviceStatelist(HttpServletRequest request){
		PageData<DeviceState> pageData = new PageData<DeviceState>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = deviceStateService.find(pageData);

		return new ModelMap(pageData);
	}
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<DeviceState> pageData = new PageData<DeviceState>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = deviceStateService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<DeviceState> pageData = new PageData<DeviceState>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = deviceStateService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<DeviceState> lookupJson(HttpServletRequest request){
		PageData<DeviceState> pageData = new PageData<DeviceState>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = deviceStateService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/device/deviceState/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/device/deviceState/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		DeviceState deviceState = deviceStateService.find(Integer.parseInt(id));
		model.addAttribute(deviceState);
		return "/device/deviceState/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		DeviceState deviceState = deviceStateService.find(Integer.parseInt(id));
		model.addAttribute(deviceState);
		return "/device/deviceState/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public DeviceState viewJson(Model model, String id) {
		DeviceState deviceState = deviceStateService.find(Integer.parseInt(id));
		model.addAttribute(deviceState);
		return deviceState;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param DeviceState
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, DeviceState deviceState){
		// 初始化
		returnCommand(model, request);
		if (deviceState.isNew()){
			deviceStateService.save(deviceState);
		} else{
			deviceStateService.update(deviceState);
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
		deviceStateService.delete(Integer.parseInt(id));
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
			deviceStateService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
}
