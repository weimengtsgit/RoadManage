package com.dearcom.queue.service;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import com.dearcom.customer.service.MessageService;
import com.dearcom.queue.entity.QueueCard;
import com.dearcom.queue.entity.QueueConfigShop;

import org.base4j.orm.hibernate.BaseDao;
import org.base4j.orm.hibernate.BaseService;
import org.ever4j.main.constant.Constant;
import org.ever4j.main.tags.EnumValuePojo;
import org.ever4j.utils.SessionUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class QueueCardService extends BaseService<QueueCard> {
	
	@Resource
	private MessageService messageService;
	@Resource
	private QueueConfigShopService queueConfigShopService;
	@Override
	@Resource(name="queueCardDao")
	public void setBaseDao(BaseDao<QueueCard> baseDao){
		this.baseDao = baseDao;
	}

	/**
	 * 排号提醒
	 * @param id
	 * @param cardType
	 */
	public void call(Integer shopId, Integer cardType) {
		List<EnumValuePojo> calls = SessionUtil.getEnumValues("call_times_config");
		if(calls!=null){
			for (int i = 0; i < calls.size(); i++) {
				EnumValuePojo call = calls.get(i);
				QueueCard qc = this.getCardByIndex(Integer.parseInt(call.getEnumKey()), shopId, cardType);
				
				QueueConfigShop config = queueConfigShopService.findHql("from QueueConfigShop c where c.shop.id=? and c.type=?", shopId,cardType);
				
				String sendType = config.getCallType().toString();
				
				String customerName = qc.getName();
				
				String shopName = qc.getShop().getName();
				
				String cardNo = qc.getCardNo().toString();
				
				// 等待人数
				BigInteger waitCount = (BigInteger) this.uniqueResult("select count(1) from com_queue_card as card where card.shop_id=? and card.card_type=? and card.status=0", config.getShop().getId(),config.getType());
				// 等待时间
				Integer waitTime = config.getInterval()*waitCount.intValue();
			
				String msgContent =  Constant.configMap.get("queueCallMessage_content"); 
				msgContent = msgContent.replace("#{shopName}", shopName);
				msgContent = msgContent.replace("#{cardNo}", cardNo);
				msgContent = msgContent.replace("#{customerName}", customerName);
				msgContent = msgContent.replace("#{waitCount}", waitCount.toString());
				msgContent = msgContent.replace("#{waitTime}", waitTime.toString());
				
				
				byte type = 2;
				
				String customerId = qc.getCustomer().getId().toString();
				
				String phone = qc.getPhone();
				
				String msgTitle =Constant.configMap.get("queueCallMessage_title"); 
				msgTitle = msgTitle.replace("#{shopName}", shopName);
				msgTitle = msgTitle.replace("#{customerName}", customerName);
				
				if("1".equals(sendType)){
					messageService.sendSMS(msgContent,type,customerId,phone);
					
				}else if("2".equals(sendType)){
					messageService.sendMessage(msgTitle,msgContent,type,customerId);
					
				}else if("3".equals(sendType)){
					
					messageService.sendMessage(msgTitle,msgContent,type,customerId);
					messageService.sendSMS(msgContent,type,customerId,phone);
				}
				
				this.executeBySql("update com_queue_card set call_times = (call_times + 1) where id=?",qc.getId());
			}
		}
	}

	/**
	 * 根据排号的索引查找排号卡
	 * @param i
	 * @param shopId
	 * @param cardType
	 * @return
	 */
	public QueueCard getCardByIndex(int i, Integer shopId, Integer cardType) {
		Integer nextId = (Integer) this.uniqueResult("select id from com_queue_card as card where card.shop_id=? and card.card_type=? and card.status=0 order by card_no limit 1", shopId,cardType);
		QueueCard card = null;
		if(nextId!=null){
			card = this.find(nextId);
		}
		return card;
	}
}
