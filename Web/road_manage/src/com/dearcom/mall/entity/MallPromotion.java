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
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "com_mall_promotion")
@ClassConfig(title = "商场促销活动", isShowMenu = true)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "list" })
public class MallPromotion extends BaseEntity {

	@FieldConfig(title = "商场", valueField = "name")
	@ManyToOne
	@JoinColumn(name = "mall_id")
	private Mall mall;
	@FieldConfig(title = "UUID")
	private String uuid;
	@FieldConfig(title = "优惠活动简介")
	private String intro;
	@FieldConfig(title = "活动具体内容", maxlength = 500)
	@Lob
	private String details;
	@FieldConfig(title = "活动图片url", isShowList = false, isShowSearch = false)
	private String image;
	@FieldConfig(title = "活动大图url", isShowList = false, isShowSearch = false)
	private String imageBig;
	// @FieldConfig(title = "活动图片", valueField = "attachName", isShowList =
	// false, isShowSearch = false)
	// @ManyToOne
	// @JoinColumn(name = "imageAttachment")
	// private Attachment imageAttachment;
	@FieldConfig(title = "开始展示时间")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date beginTime;
	@FieldConfig(title = "结束展示时间")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endTime;
	/**
	 * 0:失效　1:生效
	 */
	@FieldConfig(title = "状态", enumType = "promotionStatus", tagType = TagType.editInList, inputType = InputType.RADIO)
	private Byte status = 1;

	@FieldConfig(title = "排序")
	private Integer sort;

	@Column(updatable = false)
	private Boolean isDel;

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

	@FieldConfig(title = "今日浏览数")
	@Transient
	private Integer todayPv;
	@FieldConfig(title = "昨日浏览数")
	@Transient
	private Integer yesterdayPv;
	@FieldConfig(title = "日趋势")
	@Transient
	private Integer up;

	public Mall getMall() {
		return mall;
	}

	public void setMall(Mall mall) {
		this.mall = mall;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

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
	//
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

	public Byte getStatus() {
		return status;
	}

	public void setStatus(Byte status) {
		this.status = status == null ? 0 : status;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
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

	public Integer getTodayPv() {
		return todayPv;
	}

	public void setTodayPv(Integer todayPv) {
		this.todayPv = todayPv;
	}

	public Integer getYesterdayPv() {
		return yesterdayPv;
	}

	public void setYesterdayPv(Integer yesterdayPv) {
		this.yesterdayPv = yesterdayPv;
	}

	public Integer getUp() {
		return up;
	}

	public void setUp(Integer up) {
		this.up = up;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

	public String getImageBig() {
		return imageBig;
	}

	public void setImageBig(String imageBig) {
		this.imageBig = imageBig;
	}
}
