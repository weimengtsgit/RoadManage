package com.dearcom.mall.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

@Entity
@Table(name = "com_Mall")
@ClassConfig(title = "商场信息", isShowMenu = true)
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler", "list" })
public class Mall extends BaseEntity {

	@FieldConfig(title = "商场名称")
	private String name;
	@FieldConfig(title = "商场简称")
	private String shortName;
	@FieldConfig(title = "商场UUID")
	@Column(name = "mall_uuid")
	private String mallId;
	@FieldConfig(title = "商场地址", maxlength = 50)
	private String address;
	@FieldConfig(title = "联系人")
	private String contact;
	@FieldConfig(title = "电话")
	private String phone;
	@FieldConfig(title = "创建时间", isShowInput = false)
	@Column(updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date createTime;
	@FieldConfig(title = "商场介绍", isShowList = false, maxlength = 100)
	private String intro;
	@FieldConfig(title = "商场LOGO", isShowList = false, isShowSearch = false)
	private String logo;
	@FieldConfig(title = "商场展示", isShowList = false, isShowSearch = false)
	@Column(name = "backgroud")
	private String background;

	@FieldConfig(title = "被浏览数")
	@Column(updatable = false)
	private Integer showCount;

	@FieldConfig(title = "微信认证开关")
	@Column()
	private Boolean enableWeixinLogin;
	@Column(updatable = false)
	private Boolean isDel;

	// @FieldConfig(title = "商场LOGO", valueField = "attachName", isShowList =
	// false, isShowSearch = false)
	// @ManyToOne
	// @JoinColumn(name = "logoAttachment")
	// private Attachment logoAttachment;
	// @FieldConfig(title = "商场展示背景", valueField = "attachName", isShowList =
	// false, isShowSearch = false)
	// @ManyToOne
	// @JoinColumn(name = "backgroudAttachment")
	// private Attachment backgroudAttachment;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	// public Attachment getLogoAttachment() {
	// return logoAttachment;
	// }
	//
	// public void setLogoAttachment(Attachment logoAttachment) {
	// this.logoAttachment = logoAttachment;
	// }
	//
	// public Attachment getBackgroudAttachment() {
	// return backgroudAttachment;
	// }
	//
	// public void setBackgroudAttachment(Attachment backgroudAttachment) {
	// this.backgroudAttachment = backgroudAttachment;
	// }

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getMallId() {
		return mallId;
	}

	public void setMallId(String mallId) {
		this.mallId = mallId;
	}

	public Integer getShowCount() {
		return showCount;
	}

	public void setShowCount(Integer showCount) {
		this.showCount = showCount;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

	

	public Boolean getEnableWeixinLogin() {
		return enableWeixinLogin;
	}

	public void setEnableWeixinLogin(Boolean enableWeixinLogin) {
		this.enableWeixinLogin = enableWeixinLogin;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

}
