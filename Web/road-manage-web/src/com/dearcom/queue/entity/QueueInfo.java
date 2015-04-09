package com.dearcom.queue.entity;

public class QueueInfo {
	private String cardType ;
	private QueueConfigShop configShop;
	private Integer waitCount;
	private Integer waitTime;
	private QueueCard next;
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public QueueConfigShop getConfigShop() {
		return configShop;
	}
	public void setConfigShop(QueueConfigShop configShop) {
		this.configShop = configShop;
	}
	public Integer getWaitCount() {
		return waitCount;
	}
	public void setWaitCount(Integer waitCount) {
		this.waitCount = waitCount;
	}
	public Integer getWaitTime() {
		return waitTime;
	}
	public void setWaitTime(Integer waitTime) {
		this.waitTime = waitTime;
	}
	public QueueCard getNext() {
		return next;
	}
	public void setNext(QueueCard next) {
		this.next = next;
	}
	
}
