package com.dearcom.customer.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.main.constant.Constant;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.TimeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dearcom.customer.entity.Customer;
import com.dearcom.customer.entity.CustomerRalation;
import com.dearcom.customer.entity.MsgLog;
import com.dearcom.customer.service.CustomerRalationService;
import com.dearcom.customer.service.MessageService;
import  com.dearcom.customer.service.MsgLogService;
import com.dearcom.util.ComUtils;
import com.dearcom.util.SMSClient;

@Controller
@RequestMapping("/customer/msgLog")
public class MsgLogAction extends BaseAction{
	@Resource
	private CustomerRalationService customerRalationService;
	@Resource
	private MsgLogService msgLogService;
	@Resource
	private MessageService messageService;
	/**
	 * 存在关联对象时，查询关联对象的相关记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewRefList")
	public ModelMap viewRefList(HttpServletRequest request){
		PageData<MsgLog> pageData = new PageData<MsgLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = msgLogService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/list")
	public ModelMap list(HttpServletRequest request){
		PageData<MsgLog> pageData = new PageData<MsgLog>();
		// 如果为商铺管理员，则只显示当前用户所属商铺的信息
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_shop.id", user.getShop().getId().toString());
		}		
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = msgLogService.find(pageData);

		return new ModelMap(pageData);
	}
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		return SessionUtil.getViewPath("/customer/msgLog/listPage");
	}
	
	/**
	 * 显示所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/listJSON")
	@ResponseBody
	public Model listJSON(HttpServletRequest request, Model model){
		PageData<MsgLog> pageData = new PageData<MsgLog>();
		// 根据用户类型 只显示自己相关的数据
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_shopId", user.getShop().getId().toString());
		}
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mallId", user.getMall().getId().toString());
		}		
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = msgLogService.find(pageData);
		return this.toPageModel(model, pageData);
	}
	
	/**
	 * lookup,查询所有列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupList")
	public ModelMap lookupList(HttpServletRequest request){
		PageData<MsgLog> pageData = new PageData<MsgLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = msgLogService.find(pageData);
		
		return new ModelMap(pageData);
	}
	
	/**
	 * lookup,查询json
	 * @param request
	 * @return
	 */
	@RequestMapping("/lookupJson")
	@ResponseBody
	public List<MsgLog> lookupJson(HttpServletRequest request){
		PageData<MsgLog> pageData = new PageData<MsgLog>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = msgLogService.find(pageData);
		
		return pageData.getResult();
	}

	/**
	 * 高级检索
	 */
	@RequestMapping(value = "/advancedSearch")
	public String advancedSearch(Model model){
		return "/customer/msgLog/advancedSearch";
	}

	/**
	 * 添加新记录
	 * @param model
	 * @param nav
	 * @return
	 */
	@RequestMapping(value = "/new")
	public String add(Model model){
		return SessionUtil.getViewPath("/customer/msgLog/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		MsgLog msgLog = msgLogService.find(Integer.parseInt(id));
		model.addAttribute(msgLog);
		return SessionUtil.getViewPath("/customer/msgLog/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		MsgLog msgLog = msgLogService.find(Integer.parseInt(id));
		model.addAttribute(msgLog);
		return SessionUtil.getViewPath("/customer/msgLog/view");
	}
	
	/**
	 * 查看viewJson
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/viewJson")
	@ResponseBody
	public MsgLog viewJson(Model model, String id) {
		MsgLog msgLog = msgLogService.find(Integer.parseInt(id));
		model.addAttribute(msgLog);
		return msgLog;
	}
	
	/**
	 * 准备发送短信
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/toSendMsg")
	public String toSendMsg(HttpServletRequest request, Model model,String ids){
		model.addAttribute("ids", ids);
		
		return SessionUtil.getViewPath("/customer/customerRalation/sendMsg");
	}

	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param MsgLog
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, MsgLog msgLog,String ids,@RequestParam(value="msgContent.content", required=false)String msgContent,String sendType){
		// 初始化
		returnCommand(model, request);
		
		SysUser user = SessionUtil.getCurrentUser();
		String shopName = "";
		String mallName = "";
		if(user.getShop()!=null && user.getShop().getName()!=null){
			shopName = " "+user.getShop().getName();
		}
		if(user.getMall()!=null && user.getMall().getName()!=null){
			mallName = user.getMall().getName();
		}
		
		List<Integer> idList = new ArrayList<Integer>();
		if(ids!=null){
			String[] idss = ids.split(",");
			for (int i = 0; i < idss.length; i++) {
				idList.add(Integer.parseInt(idss[i]));
			}
		}
		List<CustomerRalation> crList= customerRalationService.findListByIds(idList);
		String sign = msgContent+ComUtils.getMessageSign();
		byte businessType = 0;
		for (int i = 0; i < crList.size(); i++) {
			String mobile = crList.get(i).getCustomer().getMobile();
			String title = Constant.getSysConfig("message_default_title"); 
			String content = "尊敬的"+mobile+"顾客，"+sign;
			//发送短信
			messageService.sendMsg(sendType,businessType,crList.get(i).getCustomer().getId().toString(),mobile,title,content);
		}
		
		
		model.addAttribute("message", "操作成功");
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
		msgLogService.delete(Integer.parseInt(id));
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
			msgLogService.delete(Integer.parseInt(id));
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	/**
	 * 逻辑删除(单条删除)
	 */
	@RequestMapping(value = "/delete4x")
	public String delete4x(HttpServletRequest request, Model model, String id){
		// 初始化
		returnCommand(model, request);
		
		msgLogService.batchExecute("update MsgLog set visible = ? where id = ?",false, Integer.parseInt(id));
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
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
				msgLogService.batchExecute("update MsgLog  set visible = ? where id = ?", false, Integer.parseInt(idStr));
			}
		}
		model.addAttribute("message", "删除成功");
		return "/commons/ajaxDone";
	}
	
	
	
	
	/**
	 * 弹出选择附件页面
	 */
	@RequestMapping(value = "/attachmentView")
	public String attachmentView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/msgLog/attachmentSave");
		return "/import/attachment";
	}
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/msgLog/importExcel");
		request.setAttribute("navTabId", "customer_msgLog_list");
		return "/import/import";
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, msgLogService, new MsgLog());
		return "/commons/ajaxDone";
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(msgLogService, request, response, excelName, sheetName, title);
	}
	
}
