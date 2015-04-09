package com.dearcom.customer.service;

import java.util.Date;

import javax.annotation.Resource;

import com.dearcom.customer.entity.Customer;
import com.dearcom.customer.entity.Message;
import com.dearcom.customer.entity.MsgLog;
import com.dearcom.util.SMSClient;

import org.apache.commons.lang.StringUtils;
import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.system.entity.SysUser;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageService extends BaseService<Message> {
	@Override
	@Resource(name = "messageDao")
	public void setBaseDao(BaseDao<Message> baseDao) {
		this.baseDao = baseDao;
	}

	@Resource
	private MsgLogService msgLogService;
	@Resource
	private CustomerService customerService;

	/**
	 * @param msgTitle
	 * @param msgContent
	 * @param msgType 消息业务类型： 0:其他消息 1:注册消息  2.排号提醒
	 * @param customerId
	 */
	public void sendMessage(String msgTitle, String msgContent, byte msgType,
			String customerId) {
		SysUser user = SessionUtil.getCurrentUser();
		String shopName = "";
		String mallName = "";
		if (user.getShop() != null && user.getShop().getName() != null) {
			shopName = " " + user.getShop().getName();
		}
		if (user.getMall() != null && user.getMall().getName() != null) {
			mallName = user.getMall().getName();
		}

		// 顾客

		Customer customer = customerService.find(new Integer(customerId));;

		Message log = new Message();
		String content = msgContent + " 【 " + mallName + shopName + "】";
		
		// 发信人 1:portal系统 2:管理端系统 3:商场 4:商铺
		if (user.getUserType().equals("3")) {
			log.setSender((byte) 4);
			log.setShopId(user.getShop().getId());
		} else if (user.getUserType().equals("2")) {
			log.setSender((byte) 3);

			log.setMallId(user.getMall().getId());
		} else {
			log.setSender((byte) 2);
		}

		log.setType( msgType);
		log.setMsgContent(content);
		log.setCustomer(customer);
		log.setTitle(msgTitle);
		log.setUser(user);
		log.setSendTime(new Date());
		log.setIsRead((byte) 0);
		this.save(log);
	}

	/**
	 * @param msgContent
	 * @param msgType 消息业务类型： 0:其他消息 1:注册消息  2.排号提醒
	 * @param customerId
	 * @param phone
	 */
	public void sendSMS(String msgContent, byte msgType, String customerId,
			String phone) {
		// 发信人 1:portal系统 2:管理端系统 3:商场 4:商铺
		SysUser user = SessionUtil.getCurrentUser();
		String shopName = "";
		String mallName = "";
		if (user.getShop() != null && user.getShop().getName() != null) {
			shopName = " " + user.getShop().getName();
		}
		if (user.getMall() != null && user.getMall().getName() != null) {
			mallName = user.getMall().getName();
		}

		// 顾客

		Customer customer = null;
		if (StringUtils.isNotBlank(customerId)) {
			customer = customerService.find(new Integer(customerId));
		}

		// 手机号
		if (StringUtils.isBlank(phone) && customer != null) {
			phone = customer.getMobile();
		}

		// 获取短信网关实例
		SMSClient client = new SMSClient();
		MsgLog log = null;
		String content = msgContent ;
		// 发送短信
		Byte status = client.sendSms(phone, content);
		log = new MsgLog();
		// 发信人 1:portal系统 2:管理端系统 3:商场 4:商铺
		if (user.getUserType().equals("3")) {
			log.setSender((byte) 4);
			log.setShopId(user.getShop().getId());
		} else if (user.getUserType().equals("2")) {
			log.setSender((byte) 3);

			log.setMallId(user.getMall().getId());
		} else {
			log.setSender((byte) 2);
		}

		log.setType(msgType);
		log.setMsgContent(content);
		log.setCustomer(customer);
		log.setUser(user);
		log.setSendTime(new Date());
		log.setMobile(phone);
		log.setStatus(status);

		msgLogService.save(log);
	}

	public void sendMsg(String sendType, byte businessType, String customerId,
			String phone, String title, String content) {
		if("1".equals(sendType)){
			this.sendSMS(content,businessType,customerId,phone);
			
		}else if("2".equals(sendType)){
			this.sendMessage(title,content,businessType,customerId);
			
		}else if("3".equals(sendType)){
			
			this.sendMessage(title,content,businessType,customerId);
			this.sendSMS(content,businessType,customerId,phone);
		}
	}
}
