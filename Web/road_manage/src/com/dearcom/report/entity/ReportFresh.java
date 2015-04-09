package com.dearcom.report.entity;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.base4j.orm.hibernate.BaseEntity;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.ever4j.annotation.ClassConfig;
import org.ever4j.annotation.FieldConfig;

import com.dearcom.mall.entity.Shop;

@Entity
@Table(name="com_ReportFresh")
@ClassConfig(title="最新统计数据", isShowMenu=true)
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler", "list"})
public class ReportFresh extends BaseEntity{
	/**
	 * 记录类型：
	 *	1：在线用户数（全局）
	 *	2：PV（与商铺对应）
	 *	3：UV（与商铺对应）
	 *	4：注册用户数（与商铺对应）
	 *	5：收藏用户（与商铺对应）
	 */
	@FieldConfig(title="统计项",enumType="com_reportFresh_type")
    private byte type;
    
	@FieldConfig(title="数量")
    private int count;
    
    @FieldConfig(title="商铺", valueField="name")
	@ManyToOne
	@JoinColumn(name="shop_id")
    private Shop shopId;


	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	

	public byte getType() {
		return type;
	}

	public void setType(byte type) {
		this.type = type;
	}

    
}
