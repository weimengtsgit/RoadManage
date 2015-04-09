package com.dearcom.mall.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="com_MessageTemplate")
@ClassConfig(title="短信模版", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class MessageTemplate extends BaseEntity{
	
	@FieldConfig(title="模版名称",maxlength=20)
    private String name;
	
	@FieldConfig(title="模版内容",maxlength=200)
	private String content;
	/**
	 * 所属商铺
	 */
	@FieldConfig(title="所属商铺",valueField="name",isShowList=false,isShowSearch = false)
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "shop_id")
	private Shop shop;
	
	/**
	 * 所属商场
	 */
	@FieldConfig(title="所属商场",valueField="name",isShowList=false,isShowSearch = false)
	@ManyToOne
	@Fetch(FetchMode.JOIN)
	@JoinColumn(name = "mall_id")
	private Mall mall;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

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
}
