package com.dearcom.customer.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.PageData;
import org.base4j.orm.hibernate.BaseAction;
import org.base4j.utils.WebUtils;
import org.ever4j.main.constant.Constant;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.ever4j.utils.TimeUtil;
import org.ever4j.utils.Utils;
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
import com.dearcom.customer.entity.Message;
import com.dearcom.customer.entity.MsgLog;
import com.dearcom.customer.service.CustomerService;
import  com.dearcom.customer.service.MessageService;
import com.dearcom.customer.service.MsgLogService;
import com.dearcom.util.ComUtils;
import com.dearcom.util.SMSClient;

@Controller
@RequestMapping("/customer/message")
public class MessageAction extends BaseAction{
	
	// 是否逻辑删除
	private boolean logicDelete = false;
	
	@Resource
	private MessageService messageService;
	
	@Resource
	private CustomerService customerService;
	
	@Resource
	private MsgLogService msgLogService;
	
	/**
	 * 准备发送短信
	 * @param request
	 * @param model
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/toSendMsg")
	public String toSendMsg(HttpServletRequest request, Model model,String customerId,String phone){
		model.addAttribute("customerId", customerId);
		model.addAttribute("phone", phone);
		
		return SessionUtil.getViewPath("/customer/message/sendMsg");
	}

	/**
	 * 发送短信/站内信
	 * @param request
	 * @param model
	 * @param phones
	 * @param ids 
	 * @param msgContent
	 * @param msgTitle
	 * @param msgType 消息业务类型 ： 0:其他消息 1:注册消息  2.排号提醒
	 * @param sendType 1：短信 2：站内信 3：同时发送
	 * @return
	 */
	@RequestMapping(value = "/sendMsg", method = RequestMethod.POST)
	public String sendMsg(HttpServletRequest request, Model model,String phone,String customerId,String msgContent,String msgTitle,String msgType,String sendType){
		// 初始化
		returnCommand(model, request);
		byte type = 0 ;
		if(StringUtils.isNotBlank(msgType)){
			type = Byte.parseByte(msgType);
		}
		String sign = ComUtils.getMessageSign();
		msgContent =  msgContent + sign;
		messageService.sendMsg(sendType, type, customerId, phone, msgTitle, msgContent);
		
		model.addAttribute("message", "操作成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * to 查询列表页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/listPage")
	public String listPage(HttpServletRequest request,Model model){
		
		return SessionUtil.getViewPath("/customer/message/listPage");
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
		// 根据用户类型 只显示自己相关的数据
		SysUser user = SessionUtil.getCurrentUser();
		if(user.getUserType().equals("3")){
			request.setAttribute("filter_EQI_shopId", user.getShop().getId().toString());
		}
		if(user.getUserType().equals("2")){
			request.setAttribute("filter_EQI_mallId", user.getMall().getId().toString());
		}
		PageData<Message> pageData = new PageData<Message>();
		//给pageData设置参数
		WebUtils.setPageDataParameter(request, pageData);
		pageData = messageService.find(pageData);

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
		return SessionUtil.getViewPath("/customer/message/input");
	}
	
	/**
	 * 修改记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/edit")
	public String editForm(Model model, String id) {
		Message message = messageService.find(Integer.parseInt(id));
		model.addAttribute(message);
		return SessionUtil.getViewPath("/customer/message/input");
	}
	
	/**
	 * 查看记录
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/view")
	public String viewForm(Model model, String id) {
		Message message = messageService.find(Integer.parseInt(id));
		model.addAttribute(message);
		return SessionUtil.getViewPath("/customer/message/view");
	}


	/**
	 * 保存记录
	 * @param request
	 * @param model
	 * @param Message
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(HttpServletRequest request, Model model, Message message){
		// 初始化
		returnCommand(model, request);
		if (message.isNew()){
			messageService.save(message);
		} else{
			messageService.update(message);
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
		delete(messageService, "Message", ids,logicDelete);
		model.addAttribute("message", "删除成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	
	
	/**
	 * 快速设置sender
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setSender")
	public String setSender(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Message message = messageService.find(Integer.parseInt(id));
		message.setSender(Byte.parseByte(value));
		messageService.update(message);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	/**
	 * 快速设置isRead
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/setIsRead")
	public String setIsRead(HttpServletRequest request, Model model, String id, String value) {
		// 初始化
		returnCommand(model, request);
		Message message = messageService.find(Integer.parseInt(id));
		message.setIsRead(Byte.parseByte(value));
		messageService.update(message);
		model.addAttribute("message", "设置成功");
		return SessionUtil.getViewPath("/commons/ajaxDone");
	} 
	
	
	
	/**
	 * 弹出导入页面
	 */
	@RequestMapping(value = "/importView")
	public String importView(HttpServletRequest request, Model model) {
		request.setAttribute("uri", "/customer/message/importExcel");
		request.setAttribute("navTabId", "customer_message_list");
		return SessionUtil.getViewPath("/import/import");
	}

	/**
	 * 导入excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/importExcel", method = RequestMethod.POST)
	public String importExcel(HttpServletRequest request, @RequestParam("upload") MultipartFile file, Model model) {
		this.importExcel(model, request, file, messageService, new Message());
		return SessionUtil.getViewPath("/commons/ajaxDone");
	}
	
	/**
	 * 导出excel
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String excelName, String sheetName, String title) {
		exportExcel(messageService, request, response, excelName, sheetName, title);
	}
	
}
