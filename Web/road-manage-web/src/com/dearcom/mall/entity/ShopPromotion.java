package com.dearcom.mall.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.ever4j.annotation.FieldConfig.InputType;
import org.ever4j.annotation.FieldConfig.TagType;

@Entity
@Table(name = "com_shop_promotion")
@ClassConfig(title = "商铺促销活动", isShowMenu = true)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "list" })
public class ShopPromotion extends BaseEntity {

	@Column(updatable = false)
	private Boolean isDel;
	@FieldConfig(title = "商场", valueField = "name")
	@ManyToOne
	@JoinColumn(name = "mall_id")
	private Mall mall;
	@FieldConfig(title = "商铺", valueField = "name")
	@ManyToOne
	@JoinColumn(name = "shop_id")
	private Shop shop;
	@FieldConfig(title = "UUID")
	private String uuid;
	@FieldConfig(title = "优惠活动简介")
	private String intro;
	@FieldConfig(title = "活动具体内容", maxlength = 500)
	@Lob
	private String details;
	@FieldConfig(title = "活动图片url", isShowList = false, isShowSearch = false)
	private String image;
	// @FieldConfig(title = "活动图片", valueField = "attachName", isShowList =
	// false, isShowSearch = false)
	// @ManyToOne
	// @JoinColumn(name = "imageAttachment")
	// private Attachment imageAttachment;
	@FieldConfig(title = "开始展示时间")
	@Column(name = "create_time")
	private Date beginTime;
	@FieldConfig(title = "结束展示时间")
	private Date endTime;
	/**
	 * 0:待提交 1:待审核　2:审核通过　3:审核拒绝
	 */
	@FieldConfig(title = "审核状态", enumType = "shopAuditStatus")
	private Byte auditStatus;

	/**
	 * 0:失效　1:生效
	 */
	@FieldConfig(title = "状态", enumType = "promotionStatus", tagType = TagType.editInList, inputType = InputType.RADIO)
	private Byte status;

	@FieldConfig(title = "排序")
	private Integer sort;

	@FieldConfig(title = "审核失败原因", maxlength = 50, isShowList = false, isShowSearch = false)
	private String auditRejectReason;

	// 社交信息
	@FieldConfig(title = "被关注数")
	@Column(updatable = false)
	private Integer mfocusCount;
	@FieldConfig(title = "被赞总数")
	@Column(updatable = false)
	private Integer praiseCount;
	@FieldConfig(title = "被浏览数")
	@Column(updatable = false)
	private Integer showCount;

	// 优惠相关
	@FieldConfig(title = "被领取数")
	@Column(updatable = false)
	private Integer received;
	@FieldConfig(title = "被消费数")
	@Column(updatable = false)
	private Integer consumed;

	@FieldConfig(title = "今日领取数")
	@Transient
	private Integer todayReceived;
	@FieldConfig(title = "今日消费数")
	@Transient
	private Integer todayConsumed;

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	// public Attachment getImageAttachment() {
	// return imageAttachment;
	// }
	// public void setImageAttachment(Attachment imageAttachment) {
	// this.imageAttachment = imageAttachment;
	// }
	public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public Byte getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Byte auditStatus) {
		this.auditStatus = auditStatus;
	}

	public String getAuditRejectReason() {
		return auditRejectReason;
	}

	public void setAuditRejectReason(String auditRejectReason) {
		this.auditRejectReason = auditRejectReason;
	}

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public Integer getMfocusCount() {
		return mfocusCount;
	}

	public void setMfocusCount(Integer mfocusCount) {
		this.mfocusCount = mfocusCount;
	}

	public Integer getPraiseCount() {
		return praiseCount;
	}

	public void setPraiseCount(Integer praiseCount) {
		this.praiseCount = praiseCount;
	}

	public Integer getShowCount() {
		return showCount;
	}

	public void setShowCount(Integer showCount) {
		this.showCount = showCount;
	}

	public Integer getReceived() {
		return received;
	}

	public void setReceived(Integer received) {
		this.received = received;
	}

	public Integer getConsumed() {
		return consumed;
	}

	public void setConsumed(Integer consumed) {
		this.consumed = consumed;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

	public Mall getMall() {
		return mall;
	}

	public void setMall(Mall mall) {
		this.mall = mall;
	}

	public Integer getTodayReceived() {
		return todayReceived;
	}

	public void setTodayReceived(Integer todayReceived) {
		this.todayReceived = todayReceived;
	}

	public Integer getTodayConsumed() {
		return todayConsumed;
	}

	public void setTodayConsumed(Integer todayConsumed) {
		this.todayConsumed = todayConsumed;
	}
}
