package com.dearcom.customer.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.Utils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.customer.entity.MscoreLog;
import  com.dearcom.customer.service.MscoreLogService;

@Controller
@RequestMapping("/customer/mscoreLog")
public class MscoreLogAction extends BaseAction{
	
	@Resource
	private MscoreLogService mscoreLogService;
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/customer/mscoreLog/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request,Model model){
		PageData<MscoreLog> pageData = new PageData<MscoreLog>();
		// 根据用户类型 只显示自己相关的数据
//		SysUser user = SessionUtil.getCurrentUser();
//		if(user.getUserType().equals("3")){
//			request.setAttribute("filter_EQI_shopId", user.getShop().getId().toString());
//		}
//		if(user.getUserType().equals("2")){
//			request.setAttribute("filter_EQI_mallId", user.getMall().getId().toString());
//		}
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = mscoreLogService.find(pageData);

		return this.toPageModel(model, pageData);
	}
	
	

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/customer/mscoreLog/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		MscoreLog mscoreLog = mscoreLogService.find(Integer.parseInt(id));
		model.addAttribute(mscoreLog);
		return SessionUtil.getViewPath("/customer/mscoreLog/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		MscoreLog mscoreLog = mscoreLogService.find(Integer.parseInt(id));
		model.addAttribute(mscoreLog);
		return SessionUtil.getViewPath("/customer/mscoreLog/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param MscoreLog
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, MscoreLog mscoreLog){
		// 初始化
		returnCommand(model, request);
		if (mscoreLog.isNew()){
			mscoreLogService.save(mscoreLog);
		} else{
			mscoreLogService.update(mscoreLog);
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
	public String delete(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		mscoreLogService.delete(Integer.parseInt(id));
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
			mscoreLogService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 逻辑删除(单条删除)
	 */
	@RequestMapping(value = "/delete4x")
	public String delete4x(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		
		mscoreLogService.batchExecute("update MscoreLog set visible = ? where id = ?",false, Integer.parseInt(id));
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 逻辑删除(批量删除)
	 */
	@RequestMapping(value = "/delAll4x")
	public String delAll4x(HttpServletRequest request, Model model,String ids){
		// 初始化
		returnCommand(model, request);
		if(ids != null && ids.length() > 0){
			String[] idArray = ids.split(",");
			for (String idStr : idArray) {
				mscoreLogService.batchExecute("update MscoreLog  set visible = ? where id = ?", false, Integer.parseInt(idStr));
			}
		}
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setType")
	public String setType(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		MscoreLog mscoreLog = mscoreLogService.find(Integer.parseInt(id));
		mscoreLog.setType(Byte.parseByte(value));
		mscoreLogService.update(mscoreLog);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/mscoreLog/importExcel");
		request.setAttribute("navTabId", "customer_mscoreLog_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, mscoreLogService, new MscoreLog());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(mscoreLogService, request, response, excelName, sheetName, title);
	}
	
}
