package com.dearcom.mall.entity;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.ever4j.attachment.entity.Attachment;

@Entity
@Table(name="com_Shop")
@ClassConfig(title="商铺信息", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class Shop extends BaseEntity{
	
	@FieldConfig(title="商铺名称")
	private String name;
	@FieldConfig(title = "商场简称")
	private String shortName;
    @FieldConfig(title="所属商场", valueField="name")
	@ManyToOne
	@JoinColumn(name="mall_id")
    private Mall mall;
    
    @FieldConfig(title = "商铺UUID")
    @Column(updatable=false)
	private String shopUuid;
    
    @FieldConfig(title = "优先级")
    private Integer priority;
   
	@FieldConfig(title="创建时间")
	@Column(updatable=false,columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    private Date createTime;
    
	@FieldConfig(title="商铺编号")
    private String sn;
    
	@FieldConfig(title="联系人")
    private String contact;
    
	@FieldConfig(title="联系人电话")
    private String phone;
    
	@FieldConfig(title="商铺电话1", isShowList = false, isShowSearch = false)
    private String hotline1;
    
	@FieldConfig(title="商铺电话2", isShowList = false, isShowSearch = false)
    private String hotline2;
    
	@FieldConfig(title="商铺电话3", isShowList = false, isShowSearch = false)
    private String hotline3;
    
	@FieldConfig(title="商铺介绍", maxlength=50, isShowList = false, isShowSearch = false)
    private String intro;
    
	@FieldConfig(title="商铺LOGO", isShowList = false, isShowSearch = false)
    private String logo;
    
	@FieldConfig(title="展示图片", isShowList = false, isShowSearch = false)
    private String image;
    
//    @FieldConfig(title="商铺LOGO", valueField="attachName", isShowList = false, isShowSearch = false)
//	@ManyToOne
//	@JoinColumn(name="logoAttachment")
//    private Attachment logoAttachment;
//    
//    @FieldConfig(title="展示图片", valueField="attachName", isShowList = false, isShowSearch = false)
//	@ManyToOne
//	@JoinColumn(name="imageAttachment")
//    private Attachment imageAttachment;
    
    @FieldConfig(title="无线AP设备")
    @Transient
    private ApDevice device;
    
    
    @FieldConfig(title="客服内部编码", isShowList = false, isShowSearch = false)
    private String hotline; 
    
    @FieldConfig(title="所在楼层",enumType="com_shop.floor", isShowList = false, isShowSearch = false)
    private String floor;
    
    @FieldConfig(title="坐标", isShowList = false, isShowSearch = false)
    private String location;
    
    @FieldConfig(title="推荐指数", isShowList = false, isShowSearch = false)
    private Float recomment;
    
//    @FieldConfig(title="商铺分类",enumType="com_shop.class",  isShowList = false, isShowSearch = false)
//    @Column(name="class")
//    private Integer clazz;
    
    @FieldConfig(title="一级分类", valueField="name")
	@ManyToOne
	@JoinColumn(name="class")
    private ShopClass class1;
    @FieldConfig(title="二级分类", valueField="name")
    @ManyToOne
    @JoinColumn(name="class2")
    private ShopClass class2;
    
    
    @FieldConfig(title="微信公众号码", isShowList = false, isShowSearch = false)
    private String weixin;
    
    
    // 社交信息
 	@FieldConfig(title="被关注数")
 	@Column(updatable=false)
 	private Integer mfocusCount;
 	@FieldConfig(title="被赞总数")
 	@Column(updatable=false)
 	private Integer praiseCount;
 	@FieldConfig(title="被浏览数")
 	@Column(updatable=false)
 	private Integer showCount;
 	
 	// 评价
 	@FieldConfig(title="描述-平均分数")
 	@Column(updatable=false,name="eva1_avg")
 	private Float eva1Avg;
 	@FieldConfig(title="服务-平均分数")
 	@Column(updatable=false,name="eva2_avg")
 	private Float eva2Avg;
 	@FieldConfig(title="商品-平均分数")
 	@Column(updatable=false,name="eva3_avg")
 	private Float eva3Avg;
    
    
	@Column(updatable=false)
	private Boolean isDel;
 	
 	
	public Mall getMall() {
		return mall;
	}

	public void setMall(Mall mall) {
		this.mall = mall;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
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

	public String getHotline1() {
		return hotline1;
	}

	public void setHotline1(String hotline1) {
		this.hotline1 = hotline1;
	}

	public String getHotline2() {
		return hotline2;
	}

	public void setHotline2(String hotline2) {
		this.hotline2 = hotline2;
	}

	public String getHotline3() {
		return hotline3;
	}

	public void setHotline3(String hotline3) {
		this.hotline3 = hotline3;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

//	public Attachment getLogoAttachment() {
//		return logoAttachment;
//	}
//
//	public void setLogoAttachment(Attachment logoAttachment) {
//		this.logoAttachment = logoAttachment;
//	}
//
//	public Attachment getImageAttachment() {
//		return imageAttachment;
//	}
//
//	public void setImageAttachment(Attachment imageAttachment) {
//		this.imageAttachment = imageAttachment;
//	}

	public ApDevice getDevice() {
		return device;
	}

	public void setDevice(ApDevice device) {
		this.device = device;
	}

	public String getShopUuid() {
		return shopUuid;
	}

	public void setShopUuid(String shopUuid) {
		this.shopUuid = shopUuid;
	}

	public Integer getPriority() {
		return priority;
	}

	public void setPriority(Integer priority) {
		this.priority = priority;
	}

	public String getHotline() {
		return hotline;
	}

	public void setHotline(String hotline) {
		this.hotline = hotline;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Float getRecomment() {
		return recomment;
	}

	public void setRecomment(Float recomment) {
		this.recomment = recomment;
	}

//	public Integer getClazz() {
//		return clazz;
//	}
//
//	public void setClazz(Integer clazz) {
//		this.clazz = clazz;
//	}

	public String getWeixin() {
		return weixin;
	}

	public void setWeixin(String weixin) {
		this.weixin = weixin;
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

	public Float getEva1Avg() {
		return eva1Avg;
	}

	public void setEva1Avg(Float eva1Avg) {
		this.eva1Avg = eva1Avg;
	}

	public Float getEva2Avg() {
		return eva2Avg;
	}

	public void setEva2Avg(Float eva2Avg) {
		this.eva2Avg = eva2Avg;
	}

	public Float getEva3Avg() {
		return eva3Avg;
	}

	public void setEva3Avg(Float eva3Avg) {
		this.eva3Avg = eva3Avg;
	}

	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public ShopClass getClass1() {
		return class1;
	}

	public void setClass1(ShopClass class1) {
		this.class1 = class1;
	}

	public ShopClass getClass2() {
		return class2;
	}

	public void setClass2(ShopClass class2) {
		this.class2 = class2;
	}


    
}
