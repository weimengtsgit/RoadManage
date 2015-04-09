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

import org.ever4j.device.entity.Device;
import org.ever4j.device.service.DeviceService;

@Controller()
@RequestMapping("/device/device")
public class DeviceAction extends BaseAction{
	
	@Resource
	private DeviceService deviceService;;
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<Device> pageData = new PageData<Device>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = deviceService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<Device> pageData = new PageData<Device>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = deviceService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<Device> lookupJson(HttpServletRequest request){
		PageData<Device> pageData = new PageData<Device>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = deviceService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/device/device/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return "/device/device/input";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Device device = deviceService.find(Integer.parseInt(id));
		model.addAttribute(device);
		return "/device/device/input";
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Device device = deviceService.find(Integer.parseInt(id));
		model.addAttribute(device);
		return "/device/device/view";
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public Device viewJson(Model model, String id) {
		Device device = deviceService.find(Integer.parseInt(id));
		model.addAttribute(device);
		return device;
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param ApDevice
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Device device){
		// 初始化
		returnCommand(model, request);
		if (device.isNew()){
			deviceService.save(device);
		} else{
			deviceService.update(device);
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
		deviceService.delete(Integer.parseInt(id));
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
			deviceService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setControlledState")
	public String setControlledState(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Device device = deviceService.find(Integer.parseInt(id));
		device.setControlledState(value);
		deviceService.update(device);
		model.addAttribute("message", "修改成功");
		return "/commons/ajaxDone";
	} 
}
